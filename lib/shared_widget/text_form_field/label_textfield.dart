import 'package:flutter/material.dart';
import 'package:home_glam/consts/global_var.dart';

import '../../consts/text_size.dart';
import '../text/apptext.dart';

class LabelTextField extends StatelessWidget {
  final double? padTop;
  final double? padBottom;
  final double? labelSize;
  final String label;
  final String? hint;
  final Color? txtColor;
  final TextInputType keyboardType;
  final bool? psdObs;
  final String? obsCharacter;
  final Widget? suffix;
  final bool? readOnly;
  final bool? enabled;
  final IconData? prefixIcon;
  final int? maxLines;
  final int? maxLength;
  final bool? autofocus;
  final AutovalidateMode? validateMode;
  final FocusNode focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final TapRegionCallback? onTapOutside;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;

  const LabelTextField({
    super.key,
    this.hint,
    required this.label,
    this.txtColor,
    required this.keyboardType,
    this.psdObs,
    this.obsCharacter,
    this.suffix,
    this.readOnly,
    this.enabled,
    this.prefixIcon,
    this.maxLines,
    this.maxLength,
    this.autofocus,
    required this.controller,
    this.validator,
    this.autofillHints,
    this.onTapOutside,
    this.textInputAction,
    this.onChanged,
    this.labelSize,
    this.padTop,
    this.padBottom,
    required this.focusNode,
    required this.onFieldSubmitted,
    this.validateMode,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop ?? 0, bottom: padBottom ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CText(txt: label, size: labelSize ?? AppTextSize.labelMediumFont),
          const SizedBox(height: 5),
          TextFormField(
            focusNode: focusNode,
            maxLength: maxLength,
            autofocus: autofocus ?? false,
            onChanged: onChanged,
            readOnly: readOnly ?? false,
            controller: controller,
            maxLines: maxLines,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            autofillHints: autofillHints,
            enabled: enabled,
            keyboardType: keyboardType,
            obscureText: psdObs ?? false,
            obscuringCharacter: obsCharacter ?? '•',
            onFieldSubmitted: onFieldSubmitted,
            autovalidateMode: validateMode ?? AutovalidateMode.disabled,
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon),
              hintText: hint,
              suffixIcon: suffix,
            ),
            validator: validator,
            textInputAction: textInputAction,
            style: TextStyle(
              color: txtColor ?? colorScheme(context).primary,
            ),
            onTapOutside: onTapOutside,
          ),
        ],
      ),
    );
  }
}
