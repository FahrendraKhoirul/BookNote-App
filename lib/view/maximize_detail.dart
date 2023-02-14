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
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding + 5, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.elasticOut);
                            return ScaleTransition(
                              alignment: Alignment.center,
                              scale: animation,
                              child: child,
                            );
                          },
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return Details();
                          },
                        ));
                  },
                  child: BtnAction(Icons.keyboard_arrow_down)),
              SizedBox(height: defaultPadding / 2),
              Center(
                child: Text(
                  "Goodbye, Things",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: semiBlack,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: defaultPadding / 4),
              Center(
                child: Text(
                  "Anonymous",
                  style: TextStyle(
                    color: lightGrey,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ResumeLines();
                  },
                ),
              )
            ],
          ),
        ),
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
}

Widget ResumeLines() {
  return Padding(
    padding: const EdgeInsets.only(
        left: defaultPadding, right: defaultPadding, bottom: defaultPadding),
    child: Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, fontSize: 16, color: semiBlack),
    ),
  );
}
