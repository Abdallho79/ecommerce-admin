import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String logo;
  final String name;
  final double witdh80facebool60any;
  final Function()? onTap;
  const SocialIcon(
      {super.key,
      required this.logo,
      required this.name,
      required this.witdh80facebool60any,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            logo,
            width: witdh80facebool60any,
            height: 60,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 8,
          ),
          Text(name)
        ],
      ),
    );
  }
}
