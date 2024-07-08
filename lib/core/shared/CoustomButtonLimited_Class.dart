// import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:admin/core/Constant/Color_Const.dart';

class CoustomButton extends StatelessWidget {
  final String text;
  final double paddinglenth;
  final double width;
  final void Function()? onPressed;
  const CoustomButton(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.paddinglenth,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: paddinglenth),
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
