import 'package:flutter/material.dart';
class SubTitleText extends StatelessWidget {
  double size=0;
  final String text;
  final Color color;
  SubTitleText({Key? key,this.size=16, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontSize: size,fontFamily: 'Poppins'),
    );
  }
}
