import 'package:hive/hive.dart';
part 'model_data.g.dart';

@HiveType(typeId: 1)
class BookModel extends HiveObject {
  @HiveField(0)
  String judul;
  @HiveField(1)
  String gambar;
  @HiveField(2)
  String penulis;
  @HiveField(3)
  String genre;
  @HiveField(4)
  String tahunTerbit;
  @HiveField(5)
  String penerbit;
  @HiveField(6)
  int warna;
  @HiveField(7)
  List<String> notes;

  BookModel({
    required this.judul,
    required this.gambar,
    required this.penulis,
    required this.genre,
    required this.penerbit,
    required this.tahunTerbit,
    required this.warna,
    required this.notes,
  });
}

// add BookModel
addBookModel(BookModel bookModel) async {
  var box = await Hive.openBox('booknote');
  box.add(bookModel);
}

// get BookModel
getBookModel() async {
  var box = await Hive.openBox('booknote');
  return box.values.toList();
}

// update BookModel
updateBookModel(int index, BookModel bookModel) async {
  var box = await Hive.openBox('booknote');
  box.putAt(index, bookModel);
}

// delete BookModel
deleteBookModel(int index) async {
  var box = await Hive.openBox('booknote');
  box.deleteAt(index);
}
