import 'package:flutter/material.dart';
import 'package:squidgame/app/utils/style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.text = '', this.hint = '', this.keyboardType, this.controller, this.icon}) : super(key: key);
  final String text;
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              hintText: hint,
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
