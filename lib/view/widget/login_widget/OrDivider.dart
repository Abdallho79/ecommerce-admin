import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 150,
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سمك الخط
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 150,
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سمك الخط
          ),
        ),
      ],
    );
  }
}
