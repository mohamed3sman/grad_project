import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.isPassword = false,
    this.validator,
    this.text,
    this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.hasEndText,
  });

  final bool? isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? text;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? hasEndText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly!,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorColor: Colors.black,
      cursorWidth: 1.5,
      obscureText: widget.isPassword == true ? !_isObscured : _isObscured,
      decoration: InputDecoration(
          suffixText: widget.hasEndText == true ? 'EGP' : null,
          suffixStyle: const TextStyle(color: Colors.black, fontSize: 20),
          prefixIcon: widget.prefixIcon,
          hintText: widget.text,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffC6C6C6),
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffC6C6C6),
              width: 1.5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xffC6C6C6),
              width: 1.5,
            ),
          ),
          suffixIcon: widget.isPassword == true
              ? GestureDetector(
                  onTap: _toggleVisibility,
                  child: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                )
              : null),
    );
  }
}
