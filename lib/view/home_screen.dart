import 'package:booknote/constants.dart';
import 'package:booknote/view/feed.dart';
import 'package:booknote/view/shop.dart';
import 'package:booknote/widget.dart/customListView.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [Body(), Feed(), Shop()];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: pages.elementAt(currentIndex),
      floatingActionButton: FabCircularMenu(
        fabElevation: 2.0,
        fabColor: Colors.white,
        ringColor: Colors.white,
        ringWidth: 100,
        ringDiameter: 400,
        children: [
          IconButton(
              onPressed: () {
                // ShowModalBottomSheet(context);
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => AddBookScreen()));
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }

  Widget BottomNav() {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'Shop'),
      ],
      selectedItemColor: lightOrange,
      unselectedItemColor: lightGrey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 8,
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    List<dynamic> book = [
      {
        'warna': Color(0xFFFCBD00),
        'judul': 'Lorem ipsum',
        'gambar': 'assets/images/seni hidup minimalis.png',
        'penulis': 'John Doe',
        'genre': 'Drama'
      }
    ];
    
    return SafeArea(
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
                CustomListView(book),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
