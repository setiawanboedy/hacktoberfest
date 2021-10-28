import 'package:flutter/material.dart';
class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Petunjuk perjalanan 1'),
        Text('Petunjuk perjalanan 3'),
        Text('Petunjuk perjalanan 4'),

        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Code',
          ),
        ),
      ],
    );
  }
}
