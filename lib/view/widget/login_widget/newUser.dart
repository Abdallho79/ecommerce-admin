import 'package:flutter/material.dart';
import 'package:admin/core/Constant/Color_Const.dart';

class NewUser extends StatelessWidget {
  final String text1;
  final String text2;
  final Function()? onTap;
  const NewUser(
      {super.key, required this.text1, required this.text2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 14, color: AppColor.grey),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: const TextStyle(fontSize: 14, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
