import 'package:booknote/constants.dart';
import 'package:flutter/material.dart';

Widget Catalog() {
  // Grid item di shop
  return Center(
    child: Column(
      children: [
        Container(
          height: 250,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/rich dad, poor dad.png"),
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 3),
          child: Text(
            "Rich Dad, Poor Dad",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          "Anonymous",
          style: TextStyle(
            color: lightGrey,
          ),
        )
      ],
    ),
  );
}

Widget searchBar() {
  // Search bar di shop
  return Padding(
    padding: const EdgeInsets.only(bottom: 25, top: 10),
    child: Container(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: extraLightGrey)),
          fillColor: extraLightGrey,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: extraLightGrey, width: 3)),
          hintText: 'Search...',
          prefixIcon: Icon(
            Icons.search,
            color: lightGrey,
          ),
          hintStyle: TextStyle(
              fontFamily: 'Raleway-Medium', color: lightGrey, fontSize: 16),
        ),
      ),
    ),
  );
}
