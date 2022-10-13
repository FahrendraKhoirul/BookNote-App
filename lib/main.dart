import 'package:booknote/model/model_data.dart';
import 'package:booknote/view/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init hive database
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox('booknote');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      home: Home(),
    );
  }
}
