import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gwbhai/Data/Data_stream.dart';
import 'package:gwbhai/Data/Data_list.dart';
import 'package:provider/provider.dart';

class FeaturedList extends StatefulWidget {
  static final fireStore = Firestore.instance;
  final List list;
  final List list2;
  final String tablename;
  FeaturedList({this.list, this.list2, this.tablename});

  @override
  _FeaturedListState createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  Widget refreshpage() {
    setState(() {});
    return SizedBox(
      width: 0,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => refreshpage());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: widget.list.length != 0
                  ? (widget.list.length / 2).round()
                  : 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Provider.of<MyRows>(context, listen: false).deleteCard(widget.list[index]); 
                  },
                  child: this.widget.list[index],
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.list2.length != 0
                  ? widget.list2.length % 2 != 0
                      ? (widget.list2.length / 2 + 1) % 2 == 0
                          ? (widget.list2.length / 2).round()
                          : (widget.list2.length / 2).round() - 1
                      : (widget.list2.length / 2).round()
                  : 0,
              itemBuilder: (context, index) {
                return this.widget.list2[index];
              }),
        ),
      ],
    );
  }
}

//Expanded(
//child: DataStream(
//count: (widget.list.length / 2).round(),
//list:widget.list,
//tablename: widget.tableName,
//)),

//Expanded(
//child: DataStream(
//count:widget.list.length % 2 != 0
//? (widget.list.length / 2 + 1) % 2 == 0
//? (widget.list.length / 2).round()
//    : (widget.list.length / 2).round() - 1
//: (widget.list.length / 2).round(),
//list: widget.list.reversed.toList(),
//tablename: widget.tableName,
//),),
