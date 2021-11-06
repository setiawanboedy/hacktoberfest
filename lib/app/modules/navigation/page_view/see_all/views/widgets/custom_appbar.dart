import 'package:flutter/material.dart';
import 'package:squidgame/app/modules/components/custom_textfiel.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Function(String)? onChanged;

  @override
  final Size preferredSize;

  CustomAppBar({Key? key, this.title, this.onChanged}) : preferredSize = Size.fromHeight(150.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar( // your customization here
      title: Text('$title'),
      centerTitle: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomTextField(
            onChanged: onChanged,
            icon: Icons.search,
            keyboardType: TextInputType.text,
            hint: 'Cari tempat wisata disini',
          ),
        ),
      ),
    );
  }
}