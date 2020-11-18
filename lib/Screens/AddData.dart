import 'package:flutter/material.dart';
import 'package:gwbhai/Screens/Home_page.dart';
import 'package:provider/provider.dart';
import 'package:gwbhai/Data/Data_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:gwbhai/Widgets/Rounded_buttons.dart';
import 'package:gwbhai/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gwbhai/Widgets/SelectiveCategroy_List.dart';
import 'package:gwbhai/Data/KeyBoardData.dart';
import 'package:gwbhai/Data/CasingsData.dart';
import 'package:gwbhai/Data/MousesData.dart';
import 'package:gwbhai/Data/HeadPhonesData.dart';
import 'package:gwbhai/Data/GraphicCardsData.dart';
import 'package:gwbhai/Data/LedsData.dart';
import 'package:gwbhai/Data/MousePadsData.dart';
import 'package:gwbhai/Data/CategoryList_Data.dart';

class AddData extends StatefulWidget {
  String CategorgyName;

  AddData({this.CategorgyName});
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String newDetails;
  String newPrice;
  File _image;
  String dropdownValue = 'KEYBOARDS';
  CategoryList categoryList= CategoryList();

  List<DropdownMenuItem> getDropdownItems(){
    List<DropdownMenuItem<String>> dropdownItems=[];

    for(int i=0;i<categoryList.categoryTile.length;i++){
      print(categoryList.categoryTile[i].categoryTitle);
      String category= categoryList.categoryTile[i].categoryTitle;
      var newItem=DropdownMenuItem(
        child: Text(categoryList.categoryTile[i].categoryTitle),
        value: category,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }
  Widget forspecificpagewidget(){
    return widget.CategorgyName.toLowerCase()==HomePage.myclassName.toLowerCase()?
    DropdownButton<String>(
      isExpanded: true,
      isDense: true,
      elevation: 20,
      value: dropdownValue != null ? dropdownValue : null,
      items: getDropdownItems(),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
    ):Container();
  }

  void uploadCardDataToDataBase() {
    try {
      FeaturedList.fireStore.collection(widget.CategorgyName).add({
        'Name': newDetails,
        'Price': newPrice,
        'ImageUrl': p.basename(_image.path),
        'Date': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
    if (widget.CategorgyName.toLowerCase() ==
        HomePage.myclassName.toLowerCase()) {
      try {
        FeaturedList.fireStore.collection(dropdownValue).add({
          'Name': newDetails,
          'Price': newPrice,
          'ImageUrl': p.basename(_image.path),
          'Date': DateTime.now(),
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
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
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('DATA ADDED SUCCESSFULLY')));
      });
    }

    return Container(
      color: Color(0xff757575),
      height: MediaQuery.of(context).size.height,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Add More Data',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'ENTER PRODUCT NAME'),
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newDetails = newValue;
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'ENTER PRODUCT PRICE'),
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newPrice = newValue;
              },
            ),
            ListTile(
              leading: _image != null
                  ? Image.file(_image)
                  : Image.asset('Images/pic7.png'),
              title: Text("SELECT YOUR PICTURE FROM YOUR GALLARY"),
              trailing: RoundIconButton(
                Icondata: Icons.add_a_photo,
                onpress: () {
                  getImage();
                },
              ),
            ),
            forspecificpagewidget(),
            FlatButton(
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                uploadCardDataToDataBase();
                uploadPic(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            topLeft: Radius.circular(10.0),
          ),
          color: Colors.orange[100],
        ),
      ),
    );
  }
}
//              style: TextStyle(color: Colors.deepPurple),
//              underline: Container(
//                height: 2,
//                color: Colors.deepPurpleAccent,
//              ),
//                icon: Icon(Icons.arrow_downward),
//              iconSize: 24,
//              elevation: 16,
//                if (widget.CategorgyName.toLowerCase() ==
//                    HomePage.myclassName.toLowerCase()) {
//                  Provider.of<MyRows>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    KeyBoardsList.myclassName.toLowerCase()) {
//                  Provider.of<KeyBoardsList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    HeadPhonesList.myclassName.toLowerCase()) {
//                  Provider.of<HeadPhonesList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    MousePadsList.myclassName.toLowerCase()) {
//                  Provider.of<MousePadsList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    MouseList.myclassName.toLowerCase()) {
//                  Provider.of<MouseList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    GraphicCardLists.myclassName.toLowerCase()) {
//                  Provider.of<GraphicCardLists>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    LedsList.myclassName.toLowerCase()) {
//                  Provider.of<LedsList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                } else if (widget.CategorgyName.toLowerCase() ==
//                    CasingList.myclassName.toLowerCase()) {
//                  Provider.of<CasingList>(context, listen: false)
//                      .addTask(p.basename(_image.path), newDetails, newPrice);
//                }