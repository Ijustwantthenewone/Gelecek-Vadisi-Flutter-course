import 'package:flutter/material.dart';

class MyNumberSelector extends StatefulWidget {
  const MyNumberSelector({super.key});

  @override
  State<MyNumberSelector> createState() => _MyNumberSelectorState();
}

class _MyNumberSelectorState extends State<MyNumberSelector> {
  int selectedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          Icons.remove,
          () {
            if (selectedNumber != 0) {
              setState(() {
                selectedNumber--;
              });
            }
          },
        ),
        SizedBox(
          width: 13,
        ),
        Text(
          selectedNumber.toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 13,
        ),
        _buildButton(
          Icons.add,
          () {
            setState(() {
              selectedNumber++;
            });
          },
        ),
      ],
    );
  }

  IconButton _buildButton(IconData icon, void Function() onPressed) {
    return IconButton(
        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(16))),
        onPressed: () {
          onPressed();
        },
        icon: Icon(icon));
  }
}
