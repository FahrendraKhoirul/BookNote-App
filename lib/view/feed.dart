import 'package:booknote/constants.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: white,
        actions: [
          TopSearch(context),
          Container(
            height: 53,
            margin: EdgeInsets.only(
                bottom: defaultPadding, right: defaultPadding / 2),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box_outlined,
                  color: semiBlack,
                  size: 28,
                )),
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return FeedItem();
          },
        ),
      ),
    );
  }

  Widget TopSearch(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width * 0.84,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: white)),
              fillColor: white,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: white, width: 3)),
              hintText: 'Search...',
              prefixIcon: Icon(
                Icons.search,
                color: lightGrey,
              ),
              hintStyle: TextStyle(
                  fontFamily: 'Raleway-Medium',
                  color: lightGrey,
                  fontSize: 16),
            ),
          ),
        );
  }
}

Widget FeedItem() {
  return Column(
    children: [
      Material(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.dailysia.com/wp-content/uploads/2022/01/Ragil-Mahardika.jpg"),
                      radius: 25,
                    ),
                    SizedBox(width: defaultPadding / 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ragil Jerman",
                          style: TextStyle(color: semiBlack, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              "Si paling bogor",
                              style: TextStyle(color: darkGrey, fontSize: 16),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: darkGrey, fontSize: 16),
                            ),
                            Text(
                              "17 minutes ago",
                              style: TextStyle(color: darkGrey, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: defaultPadding / 2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ante tortor, pharetra ut quam a, commodo gravida nibh.",
                  style: TextStyle(
                    fontSize: 15,
                    color: darkGrey,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: defaultPadding / 2),
              Container(
                color: lightOrange,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: defaultPadding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        height: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/seni hidup minimalis.png"),
                                fit: BoxFit.cover)),
                      ),
                      Expanded(
                        child: Text(
                          "Hidup Minimalis Ala Orang Jepang",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: defaultPadding / 2, left: defaultPadding / 2),
                    padding: EdgeInsets.symmetric(
                        vertical: defaultPadding / 4,
                        horizontal: defaultPadding / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: lightGrey, width: 1)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_circle_up,
                          color: darkGrey,
                        ),
                        SizedBox(width: defaultPadding / 4),
                        Text(
                          "Upvote",
                          style: TextStyle(
                            color: darkGrey,
                          ),
                        ),
                        SizedBox(width: defaultPadding / 4),
                        Text(
                          "123",
                          style: TextStyle(
                            color: darkGrey,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: defaultPadding),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.comment_outlined,
                      color: lightGrey,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(height: defaultPadding),
    ],
  );
}

// PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem(
//         child: Row(
//       children: [
//         Icon(
//           item.icon,
//           color: semiBlack,
//           size: 20,
//         ),
//         SizedBox(width: 12),
//         Text(item.text),
//       ],
//     ));

// class MenuItems {
//   static const List<MenuItem> items = [addPost, addProduct];

//   static const addPost = MenuItem(
//     text: 'Post',
//     icon: Icons.post_add_outlined,
//   );

//   static const addProduct = MenuItem(
//     text: 'Product',
//     icon: Icons.add_shopping_cart,
//   );
// }

// class MenuItem {
//   final String text;
//   final IconData icon;

//   const MenuItem({required this.text, required this.icon});
// }

// Container(
//                       height: 53,
//                       margin: EdgeInsets.only(bottom: defaultPadding),
//                       child: PopupMenuButton<MenuItem>(
//                         icon: Icon(
//                           Icons.add_box_outlined,
//                           color: semiBlack,
//                           size: 28,
//                         ),
//                         itemBuilder: (context) => [
//                           ...MenuItems.items.map(buildItem).toList(),
//                         ],
//                       ),
//                     ),