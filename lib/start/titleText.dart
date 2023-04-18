import 'package:flutter/material.dart';
class TitleText extends StatelessWidget {
  double size=0;
  final String text;
  final Color color;
   TitleText({Key? key,this.size=30, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size,fontFamily: 'Poppins'),
    );
  }
}
