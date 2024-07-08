import 'package:flutter/material.dart';

class Test extends StatelessWidget {
//  final String? buttontext;
//   final  void Function()? onPressed
  Test({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            // CoustomButton(text: "Confrim111111111111", paddinglenth: 50 , onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
