import 'package:Citizen.Tech/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextField extends StatefulWidget {
  final String hintText;

  // final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validate;
  final Function? onSubmit;
  final bool isEnabled;
  final bool isBorder;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final double prefixSize;
  final bool divider;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;

  InputTextField(
      {super.key,
      this.hintText = 'Write something...',
      this.focusNode,
      this.nextFocus,
      this.isEnabled = true,
      this.isBorder = false,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onSubmit,
      this.onChanged,
      this.prefixIcon,
      this.capitalization = TextCapitalization.none,
      this.isPassword = false,
      this.prefixSize = 25,
      this.divider = false,
      this.textAlign = TextAlign.start,
      this.isAmount = false,
      this.isNumber = false,
      this.showTitle = false,
      this.validate});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: widget.controller,
      focusNode: widget.focusNode,
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      textInputAction: widget.inputAction,
      keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
      cursorColor: Theme.of(context).primaryColor,
      enabled: widget.isEnabled,
      autofocus: false,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ]
          : widget.isAmount
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
              : widget.isNumber
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                  : null,
      decoration: InputDecoration(
        border: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: DefaultTheme().textFieldBorder,
                ),
              )
            : null,
        enabledBorder: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: DefaultTheme().textFieldBorder,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultTheme().textFieldBorder,
                ),
              ),
        focusedBorder: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: DefaultTheme().textFieldBorder,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultTheme().textFieldBorder,
                ),
              ),
        errorBorder: widget.isBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: DefaultTheme().red,
                ),
              )
            : UnderlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultTheme().red,
                ),
              ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
            textStyle: DefaultTheme().labelRegular.copyWith(fontSize: 13)),
        errorStyle: GoogleFonts.poppins(
            textStyle: DefaultTheme().labelRegular.copyWith(fontSize: 13)),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.prefixSize),
                child: Image.asset(widget.prefixIcon!, height: 20, width: 20),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: DefaultTheme().white.withOpacity(0.5)),
                onPressed: _toggle,
              )
            : null,
      ),
      onChanged: widget.onChanged,
      validator: widget.validate,
      style: GoogleFonts.poppins(
          textStyle: DefaultTheme().labelRegular.copyWith(fontSize: 13)),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
