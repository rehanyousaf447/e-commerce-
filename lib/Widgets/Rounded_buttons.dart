import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.Icondata, this.onpress});
  final IconData Icondata;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(Icondata),
      onPressed: onpress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
      fillColor: Colors.orange,
      shape: CircleBorder(),
    );
  }
}