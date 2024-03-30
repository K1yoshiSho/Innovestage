// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:innovestage/src/core/utils/extensions/context_extension.dart';
import 'package:innovestage/src/common/utils/extensions/context_extension.dart';

/// `FilledTextfield` is a custom widget which is used for return custom textfield with custom style.
class FilledTextfield extends StatelessWidget {
  // These are the required input parameters for the widget.
  final String hintText;
  final String? labelText;
  final bool? readOnly;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextEditingController? textController;
  final int? maxLines;
  final int? minLines;
  final bool? obsureText;
  final int? maxLength;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final double? radius;
  final bool autofocusEnabled;
  final Function()? onEditingComplete;
  final EdgeInsetsGeometry? contentPadding;

  // Constructor method to initialize the above input parameters.
  const FilledTextfield({
    required this.textController,
    required this.hintText,
    super.key,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.obsureText,
    this.minLines,
    this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.labelText,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.inputFormatters,
    this.textInputAction,
    this.radius,
    this.autofocusEnabled = false,
    this.onEditingComplete,
    this.contentPadding,
  });

  // This is a FocusNode variable which can be used to control the focus on the text field if needed.
  // (It is currently commented out because it is not being used.)
  // FocusNode focusNode = FocusNode();

  // This method builds and returns the widget tree for the FilledTextfield widget.
  @override
  Widget build(BuildContext context) => TextFormField(
        // These properties define the basic configuration of the text field.
        readOnly: readOnly ?? false,
        controller: textController,
        onTap: onTap,
        enabled: enabled,
        textAlignVertical: TextAlignVertical.top,

        cursorColor: context.theme.colors.primary,
        maxLength: maxLength,
        validator: validator,
        style: context.theme.textTheme.titleSmall,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autofocus: autofocusEnabled,
        onEditingComplete: () {
          onEditingComplete?.call();
        },
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: (obsureText ?? false) ? 1 : maxLines,
        minLines: minLines,
        onChanged: onChanged,
        obscureText: obsureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          hintTextDirection: TextDirection.ltr,
          labelText: (labelText != "") ? labelText ?? hintText : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            borderSide: BorderSide(
              color: context.theme.colors.fill,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            borderSide: BorderSide(
              color: context.theme.colors.border,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            borderSide: BorderSide(
              color: context.theme.colors.error,
              width: 1.5,
            ),
          ),
          alignLabelWithHint: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            borderSide: BorderSide(
              color: context.theme.colors.error,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
            borderSide: BorderSide(
              color: readOnly ?? false
                  ? context.theme.colors.border
                  : context.theme.colors.primary,
              width: 1.5,
            ),
          ),
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: context.theme.colors.fill,
          contentPadding: contentPadding ??
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        ),
      );
}
