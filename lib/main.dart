import 'package:booknote/controller/firebaseController.dart';
import 'package:booknote/view/detail_screen.dart';
import 'package:booknote/view/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'view/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // updateNote("bxOehItiJmgxgdC2KqI0", dataDummy, "fvWDRYoSsD0iweNAGLjN"); SUCCESS

    getAllBookFirestore("fvWDRYoSsD0iweNAGLjN");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      home: HomeScreen(),
    );
  }
}
