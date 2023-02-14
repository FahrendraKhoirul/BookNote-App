// import 'package:booknote/model/model_data.dart';
import 'package:booknote/view/detail_screen.dart';
import 'package:booknote/view/home_screen.dart';
import 'package:booknote/view/maximize_detail.dart';
import 'package:booknote/view/select_lines.dart';
import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      home: SelectLines(),
    );
  }
}
