import 'package:flutter/material.dart';



class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 400,
      child: const Divider(
        color: Colors.transparent,
        height: 1,
        thickness: 1,
      ),
    );
  }
}
