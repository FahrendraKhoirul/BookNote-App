import 'package:booknote/controller/firebaseController.dart';
import 'package:booknote/view/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

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
    //test firebase
    // addBook("Tes", "saya", "horor", "colorful", "", "fvWDRYoSsD0iweNAGLjN"); SUCCES
    List dataDummy = [
      "Menjadi 1% lebih baik setiap ikut berperan dalam kemajuan besar jangka panjang",
      "Kebiasaan bisa menguntungkan, dapat menjadi teman atau lawan",
      "Jika menginginkan hasil yang lebih baik, jangan memungkinkan sasaran dahulu. Sebagai gantinya, berfokuslah pada sistem anda",
      "Anda tidak mencapai level sasaran. Anda jatuh di level sistem",
      "Cara paling efektif untuk mengubah kebiasaan Anda adalah berfokus bukan pada yang ingin anda capai, melainkan tipe orang yang anda inginkan",
      "Identitas anda muncul anda kebiasaan-kebiasaan anda. setiap aksi sama seperti suara dukugan untuk tipe orang yang anda inginkan",
      "Alasan utama kebiasaan itu penting bukan karena memberi anda hasil-hasil yang lebih baik (meskipun bisa), tetapi karena kebiasan dapat mengubah keyakinian tentang diri sendiri",
      "Menjadi versi terbaik anda menuntut anda terus menerus mengedit keyakinan keyakinan anda, dan meningkatkan serta memperluas identitas anda",
      "Proses pengubahan perilaku selalu dimulai dengan kesadaran. Anda perlu menyadari kebiasaan kebiasaan anda sebelum dapat mengubahnya",
      "Kartu Nilai untuk kebiasaan adalah latihan sederhana untuk menjadi lebih sadar tentang perilaku anda"
    ];
    // updateNote("bxOehItiJmgxgdC2KqI0", dataDummy, "fvWDRYoSsD0iweNAGLjN"); SUCCESS

    getAllBookFirestore("fvWDRYoSsD0iweNAGLjN");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      home: Home(),
    );
  }
}
