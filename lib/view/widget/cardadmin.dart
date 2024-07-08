import 'package:flutter/material.dart';

class Cardadmin extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? ontap;


  const Cardadmin({super.key, required this.image, required this.title,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 100,
              width: 100,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
