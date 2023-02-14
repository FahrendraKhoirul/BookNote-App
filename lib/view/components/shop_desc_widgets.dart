import 'package:auto_size_text/auto_size_text.dart';
import 'package:booknote/constants.dart';
import 'package:flutter/material.dart';

Widget TopBar() { // Action top bar di shop_desc
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(
        Icons.keyboard_arrow_left,
        color: semiBlack,
        size: 37,
      ),
      Row(
        children: [
          Icon(
            Icons.favorite_border,
            color: semiBlack,
            size: 27,
          ),
          SizedBox(width: defaultPadding / 2),
          Icon(
            Icons.share,
            color: semiBlack,
            size: 22,
          )
        ],
      )
    ],
  );
}

Widget Description() { // Deskripsi buku di shop_desc
  return Padding(
    padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding - 2, vertical: defaultPadding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: semiBlack,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ante tortor, pharetra ut quam a, commodo gravida nibh. Sed massa erat, molestie ac malesuada eget, pulvinar non justo. Maecenas tortor odio, tempus a massa eu, bibendum ullamcorper magna.",
          style: TextStyle(
            fontSize: 15,
            color: darkGrey,
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
            itemBuilder: (context, index) {
              return Tag();
            },
          ),
        )
      ],
    ),
  );
}

Widget Tag() { // Tag ex. lifestyle di shop_desc
  return Padding(
    padding: const EdgeInsets.only(right: defaultPadding / 2),
    child: Material(
      color: Color.fromARGB(255, 255, 238, 213),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        height: 20,
        child: Center(
          child: Text(
            "Lifestyle",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: semiBlack,
              fontSize: 15,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget ButtonShop() { // Button book now di shop_desc
  return Padding(
    padding: const EdgeInsets.only(bottom: defaultPadding / 2),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(
        "Buy Now",
        style:
            TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          primary: semiBlack,
          elevation: 0,
          minimumSize: const Size.fromHeight(53),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          )),
    ),
  );
}

Widget CoverCard() { // Cover di shop_desc
  return Container(
    width: double.infinity,
    height: 500,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(3, 3)),
          BoxShadow(
              color: white,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(-3, -3))
        ],
        color: lightOrange,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      child: Column(
        children: [
          TopBar(),
          SizedBox(height: defaultPadding * 2),
          Container(
            height: 250,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/seni hidup minimalis.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: AutoSizeText(
              "Hidup Minimalis Ala Orang Jepang",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Fumio Sasaki",
            style: TextStyle(
              color: white,
              fontSize: 17,
            ),
          )
        ],
      ),
    ),
  );
}
