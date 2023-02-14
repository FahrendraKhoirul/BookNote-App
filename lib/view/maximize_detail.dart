import 'package:booknote/constants.dart';
import 'package:flutter/material.dart';
import 'package:booknote/view/detail_screen.dart';

class MaximizeDetail extends StatelessWidget {
  const MaximizeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding/2),
          child: Column(
            children: [
              BtnAction(Icons.keyboard_arrow_down),
              
            ],
          ),
        ),
      ),
    );
  }
}