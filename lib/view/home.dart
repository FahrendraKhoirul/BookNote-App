import 'package:booknote/controller/firebaseController.dart';
import 'package:booknote/model/book.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../model/booksModel.dart';
import 'addBookScreen.dart';

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
    Future<List<Book>> data = getAllBookFirestore(USERID);

    //MaterialApp
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: LiquidPullToRefresh(
        animSpeedFactor: 2,
        springAnimationDurationInMilliseconds: 1000,
        color: Color(0xFFFCBD00),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        showChildOpacityTransition: false,
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            data = getAllBookFirestore(USERID);
          });
        },
        child: SafeArea(
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
                    CustomListViewA(
                        getAllBookFirestore("fvWDRYoSsD0iweNAGLjN")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //create floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
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

  Widget CustomListViewA(Future<List<Book>> futureBookList) {
    return FutureBuilder(
        future: futureBookList,
        builder: (context, AsyncSnapshot<List<Book>> bookList) {
          if (bookList.hasData) {
            return Expanded(
              child: ListView.builder(
                  itemCount: bookList.data?.length,
                  itemBuilder: (context, index) {
                    String? cusColor = bookList.data?[index].color;
                    //con
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return DetailScreen(buku: bookList[index]);
                        // }));
                      },
                      child: Card(
                        color: Color(int.parse(cusColor as String)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "fotobuku ${bookList.data?[index].title}",
                                child: Material(
                                  elevation: 10,
                                  //shadowColor: Colors.black,
                                  // child: Image.asset(
                                  //   bookList[index].gambar,
                                  //   height: 150,
                                  //   fit: BoxFit.fitHeight,
                                  // ),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 150,
                                    width: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${bookList.data?[index].title}",
                                            overflow: TextOverflow.fade,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            "${bookList.data?[index].author}",
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                                      "${bookList.data?[index].title}",
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
                                      "${bookList.data?[index].author}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Chip(
                                      label: Text(
                                          "${bookList.data?[index].genre}",
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
