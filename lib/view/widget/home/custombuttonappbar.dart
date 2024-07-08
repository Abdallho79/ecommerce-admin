import 'package:admin/core/Constant/Color_Const.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icondata;
  final String iconname;
  final bool? active;
  const CustomButtonAppBar(
      {Key? key,
      required this.icondata,
      required this.onPressed,
      required this.active,
      required this.iconname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            color: active == true ? AppColor.primaryColor : AppColor.grey2),
        Text(
          iconname,
          style: TextStyle(
              color: active == true ? AppColor.primaryColor : AppColor.grey2),
        )
      ]),
    );
  }
}
