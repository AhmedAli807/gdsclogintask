import 'package:flutter/material.dart';

Widget InputText(
    {required String hintText,
    required String labelText,
    required IconData prefixIcon,
    required double padding,
    required TextInputType keyboardType,
    required String? Function(String?)? validator,
    required Color color,
    required TextEditingController controller,
    required InputBorder border,
    bool obscureText = true}) {
  return Padding(
    padding: EdgeInsets.all(padding),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
          boxShadow: const [
            BoxShadow(
                color: Color(0xffF4F4F4), blurRadius: 2, offset: Offset(10, 10))
          ]),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: border,
          labelText: labelText,
          prefixIcon: Icon(
            prefixIcon,
            color: color,
          ),
        ),
      ),
    ),
  );
}





