import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pitjarus_test/base/tools/base_location_service.dart';

class BaseMap extends StatefulWidget {
  const BaseMap({this.markers, super.key});
  final List<Marker>? markers;
  @override
  State<BaseMap> createState() => _BaseMapState();
}

class _BaseMapState extends State<BaseMap> with AfterLayoutMixin<BaseMap> {
  final ValueNotifier<LatLng> _currentPosition =
      ValueNotifier(const LatLng(0, 0));
  GoogleMapController? _controller;
  final Set<Marker> _markers = {};
  @override
  void initState() {
    super.initState();
    //init marker
    widget.markers?.forEach((element) {
      _markers.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      markers: _markers,
      initialCameraPosition: CameraPosition(
        target: _currentPosition.value,
        zoom: 19.4746,
      ),
      onMapCreated: (GoogleMapController controller) async {
        _controller = controller;
        final pos = await BaseLocationService.location.getLocation();
        _currentPosition.value = LatLng(pos.latitude ?? 0, pos.longitude ?? 0);
        if (_controller != null) {
          _controller?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: _currentPosition.value, zoom: 19)));
        }
      },
    );
  }

  @override
  Future<FutureOr<void>> afterFirstLayout(BuildContext context) async {
    //init location service is not enable
    if (!BaseLocationService.serviceIsEnable) {
      await BaseLocationService.init();
    }
  }
}
