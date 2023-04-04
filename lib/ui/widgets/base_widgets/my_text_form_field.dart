import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool? obscure;
  final bool? enabled;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final Color? borderColor;
  final BorderRadius? borderRadius;

  const MyTextFormField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.maxLength,
    this.obscure,
    this.enabled,
    this.onSaved,
    this.onChanged,
    this.minLines,
    this.maxLines,
    this.autofillHints,
    this.textInputAction,
    this.initialValue,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      obscureText: obscure ?? false,
      keyboardType: keyboardType,
      maxLength: maxLength,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
      cursorColor: Theme.of(context).primaryColor,
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        errorBorder: UnderlineInputBorder(
          // borderSide: BorderSide.none,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          // borderSide: BorderSide.none,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(8),
              ),
        ),
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        floatingLabelStyle: floatingLabelStyle,
        counterText: "",
      ),
    );
  }
}
