import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Rounded_buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:gwbhai/Data/Data_list.dart';
import 'package:provider/provider.dart';

class Mycard extends StatefulWidget {
  String image;
  final String details;
  final String price;
  final double size;
  final date;
  Future<dynamic> networkWidget;

  Mycard({this.image, this.details, this.price, this.size,this.networkWidget,this.date});
  @override
  _MycardState createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  File _image;

  @override
  Widget build(BuildContext context) {

     Future  getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

     Future uploadPic(BuildContext context) async {
      String fileName = p.basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Picture Uploaded')));
      });
    }

    return Container(
      width: MediaQuery.of(context).size.width/2,
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 4,
            color: Colors.orange[300],
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: RoundIconButton(
                        Icondata: FontAwesomeIcons.upload,
                        onpress: () {
                          uploadPic(context);
                          setState(() {
                            _image = null;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundIconButton(
                        Icondata: Icons.add_a_photo,
                        onpress: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: _image != null
                        ? Image.file(
                            _image,
                            height: 150,
                            width: widget.size,
                            fit: BoxFit.fill,
                          )
                        : FutureBuilder(
                            future:widget.networkWidget,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return snapshot.data==null?Container():Container(
                                  height: 140,
                                  width: MediaQuery.of(context).size.width/2,
                                  child:snapshot.data
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  height: 140,
                                  width: widget.size,
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Container();
                            },
                          )),
                ListTile(
                  title: Text(
                    widget.details,
                  ),
                  subtitle: Text(
                    widget.price,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: RoundIconButton(
                    Icondata: Icons.clear,
                    onpress: () {
                      setState(() {
                       // Provider.of<MyRows>(context, listen: false).d

                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//_image != null
//? Image.file(
//_image,
//fit: BoxFit.fill,
//height: 150,
//width: widget.size,
//)
//: Image.network(
//"Images/${widget.image.toString()}",
//height: 150,
//width: widget.size,
//),
