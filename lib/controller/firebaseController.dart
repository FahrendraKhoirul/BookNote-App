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

//create addbookfirestore method
Future<void> addBookFirestore(
  String title,
  String author,
  String genre,
  String color,
  String image,
  String userID,
) async {
  // Call the user's CollectionReference to add a new user
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  return users
      .doc(userID)
      .collection('books')
      .add({
        'title': title, // John Doe
        'author': author, // Stokes and Sons
        'genre': genre, // 42
        'color': color, // 42
        'image': image, // 42
        'notes': [], // 42
      })
      .then((value) => print("Book Added"))
      .catchError((error) => print("Failed to add book: $error"));
}

//create updateNoteFirestore method
Future<void> updateNoteFirestore(
  String bookId,
  List content,
  String userID,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  return users
      .doc(userID)
      .collection('books')
      .doc(bookId)
      .update(
        {
          'notes': content,
        },
      )
      .then((value) => print("Note Updated"))
      .catchError((error) => print("Failed to update note: $error"));
}

//create deleteBookFirestore method
Future<void> deleteBookFirestore(
  String bookId,
  String userID,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  return users
      .doc(userID)
      .collection('books')
      .doc(bookId)
      .delete()
      .then((value) => print("Book Deleted"))
      .catchError((error) => print("Failed to delete book: $error"));
}

//create updateBookFirestore method
Future<void> updateBookFirestore(
  String bookId,
  String title,
  String author,
  String genre,
  String color,
  String image,
  String userID,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  return users
      .doc(userID)
      .collection('books')
      .doc(bookId)
      .update(
        {
          'title': title, // John Doe
          'author': author, // Stokes and Sons
          'genre': genre, // 42
          'color': color, // 42
          'image': image, // 42
        },
      )
      .then((value) => print("Book Updated"))
      .catchError((error) => print("Failed to update book: $error"));
}
