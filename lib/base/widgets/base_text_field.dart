import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:pitjarus_test/base/themes/base_fonts.dart';
import 'package:pitjarus_test/base/tools/base_number_tools.dart';
import 'package:pitjarus_test/base/tools/base_string_tools.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../themes/base_colors.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BaseTextField extends StatefulWidget {
  BaseTextField({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType,
    this.isRequired = true,
    this.minLength,
    this.maxLength,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.readOnly = false,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key);

  BaseTextField.password({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    // this.onChanged,
    this.keyboardType,
    this.isRequired = true,
    this.minLength = 8,
    this.usingPasswordValidator = true,
    this.maxLength,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.readOnly = false,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    _isPasswordMode = true;
  }
  BaseTextField.email({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    // this.onChanged,
    this.keyboardType,
    this.isRequired = true,
    this.minLength,
    this.maxLength,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.readOnly = false,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    _isEmailMode = true;
  }
  BaseTextField.multiline({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.isRequired = true,
    this.minLength,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.controller,
    this.readOnly = false,
    this.prefixIcon,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    _isMultiline = true;
    keyboardType = TextInputType.multiline;
  }
  BaseTextField.dateTimePicker({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    required this.initialDate,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.isRequired = true,
    required this.firstDate,
    required this.lastDate,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    _isDateTimePicker = true;
  }
  BaseTextField.chipTag({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialTags = const [],
    required this.tagsController,
    required this.textSeparators,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.keyboardType,
    this.isRequired = true,
    this.minLength,
    this.maxLength,
    this.controller,
    this.onTagDeleted,
    this.onTagPressed,
    this.readOnly = false,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    _isChipTag = true;
  }
  BaseTextField.number({
    Key? key,
    this.hintText,
    this.label,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.isRequired = true,
    this.minLength,
    this.maxLength,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.readOnly = false,
    this.signed,
    this.decimal,
    this.formatter,
    this.removeBorder = false,
    this.focusNode,
    this.labelStyle,
    this.backgroundcolor,
    this.onEditingComplete,
  }) : super(key: key) {
    keyboardType =
        TextInputType.numberWithOptions(signed: signed, decimal: decimal);
  }
  final Color? backgroundcolor;
  bool readOnly = false;
  final FocusNode? focusNode;
  Widget? prefixIcon;
  BoxConstraints? prefixIconConstraints;
  final String? hintText;
  final String? label;
  final TextStyle? labelStyle;
  final String? Function(String? value)? validator;
  String? initialValue;
  List<String> initialTags = [];
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  final void Function(String? value)? onSaved;
  final void Function(String value)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  void Function(String value)? onChanged;
  final bool isRequired;
  int? minLength;
  int? maxLength;
  int? maxLines;
  int? minLines;
  bool usingPasswordValidator = false;
  DateTime initialDate = DateTime.now();
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now().add(const Duration(days: 100));
  TextEditingController? controller;
  TextfieldTagsController? tagsController;
  void Function(String tag)? onTagPressed;
  void Function(String tag)? onTagDeleted;
  List<String> textSeparators = [];
  bool? signed;
  bool? decimal;
  TextInputFormatter? formatter;
  final bool removeBorder;
  //not declare to class
  bool _isPasswordMode = false;
  bool _isEmailMode = false;
  bool _isMultiline = false;
  bool _isDateTimePicker = false;
  bool _isChipTag = false;
  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController _textEditingController;
  late TextfieldTagsController _tagsController;

  final ValueNotifier<bool> _showPassword = ValueNotifier(false);
  String get _passwordValidatorMessage =>
      "Your password must be consist of at least ${widget.minLength} characters with lowercase & uppercase letters, number & symbol";

  late double _screenWidth;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    _textEditingController = widget.controller ?? TextEditingController();
    _textEditingController.text = widget.initialValue ?? "";
    //-----------
    _tagsController = widget.tagsController ?? TextfieldTagsController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._isChipTag) {
      return _buildBaseTags();
    } else {
      return _buildBaseTextfield();
    }
  }

  Widget _buildBaseTextfield() {
    if (BaseStringTools.isNullOrEmpty(widget.label)) {
      return _buildTextField();
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, bottom: 4),
            child: Text(
              widget.label!,
              style: widget.labelStyle ?? BaseFonts.h4,
            ),
          ),
          _buildTextField()
        ],
      );
    }
  }

  Widget _buildTextField() {
    return ValueListenableBuilder<bool>(
      valueListenable: _showPassword,
      builder: (context, showPassword, child) => GFTextFieldRounded(
        controller: _textEditingController,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        readOnly: widget._isDateTimePicker || widget.readOnly,
        iconPrefix: widget.prefixIcon,
        focusNode: widget.focusNode,
        inputFormatters: widget.formatter != null ? [widget.formatter!] : [],
        backgroundcolor: widget.backgroundcolor,
        onEditingComplete: widget.onEditingComplete,
        onTap: () async {
          if (widget._isDateTimePicker) {
            final res = await showDatePicker(
                context: context,
                initialDate: widget.initialDate,
                firstDate: widget.firstDate.isAfter(widget.initialDate)
                    ? widget.initialDate
                    : widget.firstDate,
                lastDate: widget.lastDate);
            if (res != null) {
              _textEditingController.text =
                  DateFormat("dd MMMM yyyy", Get.deviceLocale?.languageCode)
                      .format(res);
              widget.onChanged?.call(res.toIso8601String());
            }
          }
        },
        editingbordercolor: BaseColors.thirdBlue,
        idlebordercolor: BaseColors.primaryStroke.withOpacity(0.9),
        borderwidth: 1,
        cornerradius: 10,
        hintText: widget.hintText ?? "",
        hintStyle: BaseFonts.h4
            .copyWith(color: BaseColors.thirdBlack.withOpacity(0.5)),
        errorStyle:
            BaseFonts.h4.copyWith(color: BaseColors.secondRed, fontSize: 12),
        // errorbordercolor: BaseColors.primaryStroke.withOpacity(0.9),
        paddinghorizontal: 0,
        paddingvertical: 0,
        marginvertical: 0,
        marginhorizontal: 0,
        errorMaxLines: 5,
        minLines: widget._isMultiline ? widget.minLines : 1,
        maxLines: widget._isMultiline ? widget.maxLines : 1,
        maxLength: widget.maxLength,

        validator: (value) {
          //base validator
          if (BaseStringTools.isNullOrEmpty(value) && widget.isRequired) {
            return "We need this information".tr;
          } else if (!(value?.isEmail ?? true) && widget._isEmailMode) {
            return "Please enter the correct email address".tr;
          } else if (widget.minLength != null &&
              BaseStringTools.isNotNullOrEmpty(value)) {
            if (value!.length < widget.minLength!) {
              if (widget._isPasswordMode && widget.usingPasswordValidator) {
                return _passwordValidatorMessage;
              } else {
                return "Please enter at least ${widget.minLength} characters"
                    .tr;
              }
            }
          } else if (BaseStringTools.validatePasswordStructure(value ?? "") &&
              widget.usingPasswordValidator) {
            return _passwordValidatorMessage;
          }
          //user validator
          return widget.validator?.call(value);
        },
        keyboardType: _getKeyboardType(),
        initialValue: widget.initialValue ?? "",
        textInputAction: widget.textInputAction,
        style: BaseFonts.h4.copyWith(),
        obscureText: (widget._isPasswordMode && !showPassword),
        obscuringCharacter: "●",
        scrollPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        iconSuffix: widget._isPasswordMode
            ? IconButton(
                onPressed: () {
                  _showPassword.value = !_showPassword.value;
                },
                icon: showPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility))
            : null,
      ),
    );
  }

  TextInputType _getKeyboardType() {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    } else {
      if (widget._isEmailMode) {
        return TextInputType.emailAddress;
      }
      return TextInputType.text;
    }
  }

  Widget _buildBaseTags() {
    return TextFieldTags(
      textfieldTagsController: _tagsController,
      initialTags: widget.initialTags,
      textSeparators: widget.textSeparators,
      letterCase: LetterCase.normal,
      validator: (String tag) {
        return null;
      },
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, sc, tags, onTagDelete) {
          return BaseTextField(
            onEditingComplete: widget.onEditingComplete,
            onFieldSubmitted: onSubmitted,
            hintText: widget.hintText,
            isRequired: widget.isRequired && tags.isEmpty,
            // keyboardType: widget.keyboardType,
            label: widget.label,
            labelStyle: widget.labelStyle,
            controller: tec,
            onChanged: onChanged,
            readOnly: widget.readOnly,
            focusNode: fn,
            prefixIcon: tags.isNotEmpty
                ? Container(
                    constraints: BoxConstraints(maxWidth: _screenWidth * 0.74),
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      controller: sc,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: tags.map((String tag) {
                        return Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              color: BaseColors.secondGrey),
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Text(
                                  tag,
                                  // style: const TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  widget.onTagPressed?.call(tag);
                                },
                              ),
                              const SizedBox(width: 8.0),
                              InkWell(
                                child: const Icon(
                                  Icons.close,
                                  size: 14.0,
                                  color: BaseColors.primaryBlack,
                                ),
                                onTap: () {
                                  onTagDelete(tag);
                                  widget.onTagDeleted?.call(tag);
                                },
                              )
                            ],
                          ),
                        );
                      }).toList()),
                    ),
                  )
                : null,
          );
        });
      },
    );
  }
}

class RupiahFormatter extends TextInputFormatter {
  RupiahFormatter({this.decimalDigits = 0, this.withSimbol = true});
  final int decimalDigits;
  final bool withSimbol;
  int value = 0;
  String text = "";

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    value = BaseStringTools.extractNumber(newValue.text);
    text = BaseNumberTools.toRupiah(nominal: value);
    return newValue.copyWith(
        text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}
