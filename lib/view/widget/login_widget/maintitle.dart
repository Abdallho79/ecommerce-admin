import 'package:flutter/material.dart';

class CoustomTitle extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final AlignmentGeometry alignmentGeometry;
  final FontWeight fontWeight;

  const CoustomTitle(
      {super.key,
      required this.color,
      required this.text,
      required this.size,
      required this.alignmentGeometry,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignmentGeometry,
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
      ),
    );
  }
}
