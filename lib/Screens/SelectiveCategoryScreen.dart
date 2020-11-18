import 'package:flutter/material.dart';
import 'package:gwbhai/Widgets/Rounded_buttons.dart';
import 'package:gwbhai/Screens/AddData.dart';

class SelectiveScreen extends StatefulWidget {
  final String tableName;
  final object;

  SelectiveScreen({this.object, this.tableName});

  @override
  _SelectiveScreenState createState() => _SelectiveScreenState();
}

class _SelectiveScreenState extends State<SelectiveScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text(
            "GAMING WALA BHAI",
            style: TextStyle(
                fontFamily: 'Squada One',
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 12,
                color: Colors.black),
          ),
          centerTitle: true,
          actions: <Widget>[
            RoundIconButton(
              Icondata: Icons.add,
              onpress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddData(CategorgyName: widget.tableName),
                );
              },
            ),
            RoundIconButton(
              Icondata: Icons.update,
              onpress: () {
               setState(() {
                print('helooooooooooooooooooooooooooooooooooo');
               });
              },
            ),
          ]),
      body: widget.object,
    );
  }
}
