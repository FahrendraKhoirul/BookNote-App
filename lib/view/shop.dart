import 'package:booknote/constants.dart';
import 'package:booknote/view/components/shop_widgets.dart';
import 'package:booknote/view/components/shop_desc_widgets.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedIndex = 0;

  List<String> categories = [
    "Lifestyle",
    "Education",
    "Politic",
    "History",
    "Design"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          child: Column(
            children: [
              searchBar(),
              SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Category(index);
                    }),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: defaultPadding / 2,
                    crossAxisSpacing: defaultPadding / 2,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return Catalog();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Category(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selectedIndex == index ? semiBlack : lightGrey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultPadding / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index ? lightOrange : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
