import 'dart:io';

import 'package:booknote/model/booksModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  Color backgroundCover = Color(0xFFE5E5E5);
  bool coverType = false;
  TextEditingController _controllerTitle = TextEditingController();
  TextEditingController _controllerAuthor = TextEditingController();
  TextEditingController _controllerTags = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    Text(
                      "Add Book",
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
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: backgroundCover,
                      ),
                      height: 220,
                      width: 160,
                      child: Center(
                        child: Material(
                          elevation: 10,
                          //shadowColor: Colors.black,
                          child: (image != null && coverType == false)
                              ? Image.file(
                                  image!,
                                  height: 150,
                                  fit: BoxFit.fitHeight,
                                )
                              : Container(
                                  padding: EdgeInsets.all(10),
                                  height: 150,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          _controllerTitle.text,
                                          overflow: TextOverflow.fade,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          _controllerAuthor.text,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                              "Book Cover",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                Transform.translate(
                                  offset: Offset(-5, 0),
                                  child: Radio(
                                    visualDensity: VisualDensity(vertical: -3),
                                    value: true,
                                    groupValue: coverType,
                                    onChanged: (newValue) {
                                      setState(() {
                                        coverType = !coverType;
                                      });
                                    },
                                  ),
                                ),
                                Text("Text"),
                              ],
                            ),
                            Row(
                              children: [
                                Transform.translate(
                                  offset: Offset(-5, 0),
                                  child: Radio(
                                    visualDensity: VisualDensity(vertical: -3),
                                    value: false,
                                    groupValue: coverType,
                                    onChanged: (newValue) {
                                      setState(() {
                                        coverType = !coverType;
                                      });
                                    },
                                  ),
                                ),
                                Text("Image"),
                              ],
                            ),
                            CustomButton("Choose Image"),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Background Color",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton("Pick Color")
                          ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Book Title",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    CustomTextFormField("title", _controllerTitle, "1"),
                    Text(
                      "Author",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    CustomTextFormField("name", _controllerAuthor, "1"),
                    Text(
                      "Genre",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    CustomTextFormField("genre", _controllerTags, "1"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton("Add Book"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomTextFormField(
      String hint, TextEditingController controller, String action) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onFieldSubmitted: (String value) {
          setState(() {
            if (controller.text == _controllerTitle.text) {
              _controllerTitle.text = value;
            } else if (controller.text == _controllerAuthor.text) {
              _controllerAuthor.text = value;
            } else if (controller.text == _controllerTags.text) {
              _controllerTags.text = value;
            }
          });
        },
      ),
    );
  }

  Widget CustomButton(String text) {
    return Material(
      color: Color(0xFF515151),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          if (text == "Add Book") {
            //check if all fields are filled
            if (_controllerTitle.text == "" ||
                _controllerAuthor.text == "" ||
                _controllerTags.text == "") {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Please fill all fields"),
                backgroundColor: Colors.red,
              ));
              return;
            } else {
              addBook(
                  _controllerTitle.text,
                  _controllerAuthor.text,
                  _controllerTags.text,
                  backgroundCover.value.toString(),
                  "",
                  USERID);
              Navigator.pop(context);
              //snackbar  book added
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Book added"),
                backgroundColor: Colors.green,
              ));
            }
          } else if (text == "Pick Color") {
            pickColor(context);
          } else if (text == "Choose Image") {
            pickImage();
          }
        },
        splashColor: Colors.white,
        child: Container(
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void pickColor(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              title: Text(
                "Pick Background Color",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              actions: [
                ColorPicker(
                  enableAlpha: false,
                  showLabel: false,
                  pickerColor: backgroundCover,
                  onColorChanged: (Color value) {
                    setState(() {
                      backgroundCover = value;
                    });
                  },
                ),
                Material(
                  color: Color(0xFF515151),
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    splashColor: Colors.white,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Choose Color",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}
