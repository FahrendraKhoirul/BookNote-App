import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:pemogramanmobile_uts/addBookScreen.dart';
import 'package:pemogramanmobile_uts/detailScreen.dart';

import 'book.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    //custom widget
    var heightScreen = MediaQuery.of(context).size.height;
    var CustomListView = Expanded(
      child: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(buku: bookList[index]);
                }));
              },
              child: Card(
                color: bookList[index].warna,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "fotobuku ${bookList[index].judul}",
                        child: Material(
                          elevation: 10,
                          //shadowColor: Colors.black,
                          child: Image.asset(
                            bookList[index].gambar,
                            height: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bookList[index].judul,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              bookList[index].penulis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Chip(
                              label: Text(bookList[index].genre,
                                  style: TextStyle(fontSize: 10)),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );

    //MaterialApp
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: heightScreen - 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              "Happy Reading",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black54,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomListView,
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        fabElevation: 2.0,
        fabColor: Colors.white,
        ringColor: Colors.white,
        ringWidth: 100,
        ringDiameter: 400,
        children: [
          IconButton(
              onPressed: () {
                ShowModalBottomSheet(context);
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddBookScreen()));
              },
              icon: Icon(Icons.add)),
        ],
      ),
      // bottomSheet: BottomSheet(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(12.0),
      //   ),
      //   builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: Column(
      //         children: [
      //           Text(
      //             "Theme",
      //             style: TextStyle(
      //               fontWeight: FontWeight.w900,
      //               color: Colors.black,
      //               fontSize: 19,
      //             ),
      //           ),
      //           Row(
      //             children: [
      //               Transform.translate(
      //                 offset: Offset(-5, 0),
      //                 child: Radio(
      //                   value: true,
      //                   groupValue: _isDark,
      //                   onChanged: (newValue) {
      //                     setState(() {
      //                       _isDark = !_isDark;
      //                     });
      //                   },
      //                 ),
      //               ),
      //               Text("Light"),
      //             ],
      //           ),
      //           Row(
      //             children: [
      //               Transform.translate(
      //                 offset: Offset(-5, 0),
      //                 child: Radio(
      //                   value: false,
      //                   groupValue: _isDark,
      //                   onChanged: (newValue) {
      //                     setState(() {
      //                       _isDark = !_isDark;
      //                     });
      //                   },
      //                 ),
      //               ),
      //               Text("Dark"),
      //             ],
      //           ),
      //         ],
      //       ),
      //     );
      //   },
      //   onClosing: () {
      //     setState(() {
      //
      //     });
      //   },
      // ),
    );
  }

  void ShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Theme",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-5, 0),
                      child: Radio(
                        value: true,
                        groupValue: _isDark,
                        onChanged: (newValue) {
                          setState(() {
                            _isDark = !_isDark;
                          });
                        },
                      ),
                    ),
                    Text("Light"),
                  ],
                ),
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-5, 0),
                      child: Radio(
                        value: false,
                        groupValue: _isDark,
                        onChanged: (newValue) {
                          setState(() {
                            _isDark = !_isDark;
                          });
                        },
                      ),
                    ),
                    Text("Dark"),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
