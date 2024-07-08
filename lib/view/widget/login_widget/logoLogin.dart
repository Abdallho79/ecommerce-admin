import 'package:flutter/material.dart';
import 'package:admin/core/Constant/ImageAsset_Const.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: 70,
      child: ClipOval(
        child: Container(
          padding: EdgeInsets.all(0), // Radius
          child: Image.asset(
            AppImageAsset.logo,
          ),
        ),
      ),
    );
  }
}
