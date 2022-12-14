import 'package:booknote/model/model_data.dart';
import 'package:flutter/material.dart';
import '../model/book.dart';

class DetailScreen extends StatelessWidget {
  //variabel
  final BookModel buku;

  //constructor
  DetailScreen({required this.buku});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(buku.warna),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  color: Color(buku.warna),
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            "Book Note",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: "fotobuku ${buku.judul}",
                            child: Material(
                              elevation: 10,
                              //shadowColor: Colors.black,
                              child: Image.asset(
                                buku.gambar,
                                height: 150,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  buku.judul,
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
                                  buku.penulis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Chip(
                                  label: Text(buku.genre,
                                      style: TextStyle(fontSize: 10)),
                                  backgroundColor: Colors.white,
                                ),
                                Text(
                                  "Penerbit: ${buku.penerbit}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Tahun Terbit: ${buku.tahunTerbit}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: 25,
                    ),
                  ],
                ),
              ]),
              Container(
                color: Colors.white,
                //background putih harusnya disini
                // padding diganti container
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: buku.notes.map((note) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, right: 10),
                            child: Icon(
                              Icons.circle,
                              size: 10,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              note,
                              maxLines: 4,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
