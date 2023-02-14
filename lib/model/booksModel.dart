import 'package:cloud_firestore/cloud_firestore.dart';

String USERID = "fvWDRYoSsD0iweNAGLjN";
// method add book
Future<void> addBook(String title, String author, String genre, String color,
    String image, String userID) async {
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

//method update note
Future<void> updateNote(String bookId, List content, String userID) async {
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

//method getAllBooks
Future<List> getAllBooks(String userID) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  List books = [];

  await users
      .doc(userID)
      .collection('books')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      books.add(doc.data);
      print("tes");
      print(doc.data().toString());
    });
  });

  // print(books[0]["title"]);
  print(books[1]);

  return books;
}
