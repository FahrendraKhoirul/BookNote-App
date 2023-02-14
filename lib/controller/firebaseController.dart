import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/book.dart';

Future<List<Book>> getAllBookFirestore(String userID) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  List<Book> books = [];

  await users
      .doc(userID)
      .collection('books')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      books.add(Book.fromMap(doc.data() as Map<String, dynamic>));
    });
  });
  // print("tes");
  // print(books[0].notes?[0]);  SUCCESS
  return books;
}

//
