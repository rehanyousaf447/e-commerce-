import 'package:flutter/material.dart';


class CategoryTile extends StatelessWidget {
  final String categoryTitle;
  final Function onTap;
  final String images;

  CategoryTile({this.categoryTitle, this.onTap,this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              categoryTitle,
              style: TextStyle(
                  fontFamily: 'Cinzel',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25.0
              ),
              textAlign: TextAlign.center,
            ),
           leading: Image.asset("Images/$images"),
            onTap:onTap,
          ),
          Divider(thickness: 1.5,),
        ],
      ),
    );
  }
}
