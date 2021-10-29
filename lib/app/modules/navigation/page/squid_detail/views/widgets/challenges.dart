import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  const Challenges({Key? key, this.func, this.result}) : super(key: key);
  final VoidCallback? func;
  final String? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Petunjuk perjalanan 1'),
        Text('Petunjuk perjalanan 3'),
        Text('Petunjuk perjalanan 4'),

        Text('Result: $result'),
        ElevatedButton(
          onPressed: func,
          child: Text('Scan here'),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}
