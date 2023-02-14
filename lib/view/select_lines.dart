import 'package:booknote/constants.dart';
import 'package:booknote/view/share_lines.dart';
import 'package:flutter/material.dart';
import 'package:booknote/view/detail_screen.dart';

class SelectLines extends StatefulWidget {
  const SelectLines({Key? key}) : super(key: key);

  @override
  State<SelectLines> createState() => _SelectLinesState();
}

class _SelectLinesState extends State<SelectLines> {
  bool selected = false;

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
              BtnAction(Icons.keyboard_arrow_down),
              SizedBox(height: defaultPadding / 2),
              Center(
                child: Text(
                  "Select Lines",
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
                  "0" + "lines selected",
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
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShareLines()));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: semiBlack,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ResumeLines() {
    return Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding / 2,
          right: defaultPadding / 2,
          bottom: defaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selected == false) {
              selected = true;
            } else {
              selected = false;
            }
          });
        },
        child: Material(
          color: selected ? lightOrange : extraLightOrange,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 16,
                  color: selected ? white : darkOrange),
            ),
          ),
        ),
      ),
    );
  }
}
