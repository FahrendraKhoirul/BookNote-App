import 'package:booknote/constants.dart';
import 'package:flutter/material.dart';

class ShareLines extends StatelessWidget {
  const ShareLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: lightOrange,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Share",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: semiBlack,
                      fontSize: 25,
                    ),
                  ),
                  Material(
                    color: semiBlack,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 7),
                      child: Text(
                        "Edit",
                        style: TextStyle(color: white, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFDE08A),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: lightOrange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.close,
                        color: white,
                        size: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Container(
                        height: 180,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/seni hidup minimalis.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Goodbye, Things",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: semiBlack,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(height: 7),
                    Center(
                      child: Text(
                        "Fumio Sasaki",
                        style: TextStyle(color: white, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: TextStyle(
                            color: semiBlack, fontSize: 14, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Material(
              color: Colors.transparent,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconShare("assets/icons/instagram.png", "Stories"),
                    IconShare("assets/icons/facebook.png", "Stories"),
                    IconShare("assets/icons/twitter.png", "Twitter"),
                    IconShare("assets/icons/whatsapp.png", "Whatsapp"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget IconShare(String icon, text) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(icon), fit: BoxFit.cover)),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(color: white, fontSize: 14),
        )
      ],
    );
  }
}
