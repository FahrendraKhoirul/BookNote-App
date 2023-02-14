import 'package:booknote/constants.dart';
import 'package:booknote/view/maximize_detail.dart';
import 'package:booknote/view/select_lines.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightOrange,
      key: navigatorKey,
      body: Column(
        children: [
          DetailCover(),
          Flexible(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BtnAction(Icons.edit),
                        SizedBox(
                          width: defaultPadding / 3,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectLines()));
                            },
                            child: BtnAction(Icons.share)),
                        SizedBox(width: defaultPadding / 3),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        animationTime, child) {
                                      animation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.elasticInOut);
                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return MaximizeDetail();
                                    },
                                  ));
                            },
                            child: BtnAction(Icons.fullscreen))
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ResumeText();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: lightOrange,
        child: Icon(
          Icons.add,
          color: white,
          size: 30,
        ),
      ),
    );
  }

  Widget DetailCover() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220,
            width: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/seni hidup minimalis.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: defaultPadding - 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seni Hidup Minimalis",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: semiBlack),
                ),
                Text(
                  "Fumio Sasaki",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: darkGrey),
                ),
                SizedBox(height: defaultPadding / 2),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  color: extraLightGrey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding - 5,
                        vertical: defaultPadding / 4),
                    child: Text(
                      "Lifestyle",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding - 5),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: semiBlack, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Container(
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: semiBlack, width: 1),
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: semiBlack, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start reading",
                          style: TextStyle(fontSize: 15, color: semiBlack),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "13 Februari 2020",
                          style: TextStyle(fontSize: 13, color: darkGrey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Finish reading",
                          style: TextStyle(fontSize: 15, color: semiBlack),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "13 Februari 2020",
                          style: TextStyle(fontSize: 13, color: darkGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(
              Icons.share,
              color: semiBlack,
              size: 25,
            ),
          )
        ],
      ),
    );
  }

  Widget ResumeText() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        textAlign: TextAlign.justify,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

Widget BtnAction(IconData icon) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        color: Color(0xFFFDE08A), borderRadius: BorderRadius.circular(20)),
    child: Icon(
      icon,
      color: white,
      size: 18,
    ),
  );
}
