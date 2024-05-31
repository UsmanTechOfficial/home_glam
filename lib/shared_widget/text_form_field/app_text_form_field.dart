import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final Color? txtColor;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool? psdObs;
  final String? obscuringCharacter;
  final Widget? suffix;
  final bool? readOnly;
  final bool? enabled;
  final Iterable<String>? autofillHints;
  final TapRegionCallback? onTapOutside;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final int? maxLines;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool? autofocus;

  const CTextField({
    super.key,
    this.autofocus,
    this.hint,
    required this.controller,
    this.obscuringCharacter,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.psdObs,
    this.suffix,
    this.autofillHints,
    this.onTapOutside,
    this.textInputAction,
    this.enabled,
    this.prefixIcon,
    this.readOnly,
    this.maxLines,
    this.onChanged,
    this.maxLength,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLength: maxLength,
        autofocus: autofocus ?? false,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        controller: controller,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.words,
        autofillHints: autofillHints,
        enabled: enabled,
        keyboardType: keyboardType,
        obscureText: psdObs ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon), hintText: hint, suffixIcon: suffix),
        validator: validator,
        textInputAction: textInputAction,
        style: TextStyle(color: txtColor),
        onTapOutside: onTapOutside);
  }
}
