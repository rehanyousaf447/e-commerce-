import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LoadFirbaseStorage {
  static Future<Widget> getImage(BuildContext context,String image) async {
    // print('Image Name:'+image);
    Image m;
    final ref = FirebaseStorage.instance.ref().child(image);
    String url = await ref.getDownloadURL();
    m = Image.network(
      url,
      //height: 150,
      width: MediaQuery.of(context).size.width / 2,
      fit: BoxFit.fill,
    );
    // print('URL IS:'+url);
    return m;
  }
}
