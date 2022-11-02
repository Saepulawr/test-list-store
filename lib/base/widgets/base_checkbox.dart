// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:pitjarus_test/base/base.dart';

import 'package:get/get.dart';

class BaseCheckbox extends StatelessWidget {
  const BaseCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    this.onTapLabel,
    Key? key,
    this.validator,
    this.onSaved,
    this.onFieldSubmitted,
    this.isRequired = true,
  }) : super(key: key);

  final bool value;
  final void Function(bool value)? onChanged;
  final void Function(bool value)? onTapLabel;
  final String label;
  final String? Function(bool value)? validator;
  final void Function(bool? value)? onSaved;
  final void Function(bool value)? onFieldSubmitted;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return _buildCheckboxField();
  }

  Widget _buildCheckboxField() {
    return FormField(
        initialValue: value,
        validator: (value) {
          //base validator
          if (!(value ?? false) && isRequired) {
            return "We need this information".tr;
          }
          //user validator
          return validator?.call(value ?? false);
        },
        onSaved: onSaved,
        builder: (field) {
          if (field.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCheckbox(field),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    field.errorText ?? "",
                    style: BaseFonts.h4
                        .copyWith(color: BaseColors.secondRed, fontSize: 12),
                    maxLines: 5,
                  ),
                )
              ],
            );
          } else {
            return _buildCheckbox(field);
          }
        });
  }

  Widget _buildCheckbox(FormFieldState<bool> field) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GFCheckbox(
          size: 24,
          value: value,
          onChanged: (val) {
            field.setValue(val);
            onChanged?.call(val);
          },
          activeBgColor: BaseColors.primaryGreen,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (onTapLabel != null) {
                field.setValue(!value);
                onTapLabel?.call(!value);
              } else {
                field.setValue(!value);
                onChanged?.call(!value);
              }
            },
            child: Text(
              label,
              style: BaseFonts.h4.copyWith(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
