import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendease_test/src/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle? textFormFieldStyle;
  final TextStyle? hintTextStyle;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? label;
  final String? initialValue;
  final TextCapitalization textCapitalization;
  final AutovalidateMode autovalidateMode;
  final String? prefixText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool enabled;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final int? maxLength;
  final bool maxLengthEnforced;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final EdgeInsets margin;
  final int maxLines;
  final String? errorText;

  CustomTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.textFormFieldStyle = const TextStyle(fontSize: 14.0),
    this.hintTextStyle,
    this.borderStyle = BorderStyle.solid,
    this.borderRadius = 6,
    this.borderWidth = 0.5,
    this.contentPaddingHorizontal = 12,
    this.contentPaddingVertical = 18,
    this.hintText,
    this.label,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderColor = AppColors.darkBorderColor,
    this.focusedBorderColor = AppColors.primaryColor,
    this.enabledBorderColor = AppColors.darkBorderColor,
    this.fillColor = AppColors.white,
    this.filled = true,
    this.obscured = false,
    this.enabled = true,
    this.textInputType,
    this.onChanged,
    this.onSaved,
    this.prefixText,
    this.maxLength,
    this.maxLengthEnforced = false,
    this.validator,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textInputAction,
    this.maxLines = 1,
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Row(
              children: [
                Text(
                  '$label',
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 4.0),
                if (validator != null) ...[
                  Text('*', style: TextStyle(color: AppColors.red)),
                  Text(' (required)',
                      style: TextStyle(fontSize: 10.0, color: AppColors.red)),
                ],
                if (validator == null)
                  Text(' (optional)',
                      style:
                          TextStyle(fontSize: 10.0, color: AppColors.greyText)),
              ],
            ),
            SizedBox(height: 8.0),
          ],
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            textInputAction: textInputAction,
            enabled: enabled,
            style: textFormFieldStyle,
            autofocus: autofocus,
            keyboardType: textInputType,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            onSaved: onSaved,
            maxLength: maxLength,
            initialValue: controller != null ? null : initialValue,
            validator: validator,
            autovalidateMode: autovalidateMode,
            inputFormatters: inputFormatters,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorText: errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              prefixText: prefixText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: enabledBorderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: focusedBorderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.symmetric(
                horizontal: contentPaddingHorizontal,
                vertical: contentPaddingVertical,
              ),
              hintText: hintText,
              hintStyle: hintTextStyle,
              filled: filled,
              fillColor: fillColor,
            ),
            obscureText: obscured,
          ),
        ],
      ),
    );
  }
}
