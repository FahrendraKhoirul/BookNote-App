import 'package:flutter/material.dart';

import '../view/detailScreen.dart';

Widget CustomListView(List bookList) {
  return Expanded(
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
}
