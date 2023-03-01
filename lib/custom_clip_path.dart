// عملت class ب extend من class CustomClipper من النوع Path
import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  // عملت override ل  two methods
  @override
  Path getClip(Size size) {
    double height = size.height * 0.8;
    double width = size.width;
    // هنضيف variable و هنسميه path و هيكون من النوع Path class
    var path = Path();
    //هنرسم ال path الي هيتعملها clipping
    //هنستدعي ميثود lineTo عن طريق path
    path.lineTo(0, height);
    //هنستدعي ميثود quadraticBezierTo عن طريق path
    path.quadraticBezierTo(width / 4, height - 40, width / 2, height - 20);
    path.quadraticBezierTo(3 / 4 * width, height, width, height - 30);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}