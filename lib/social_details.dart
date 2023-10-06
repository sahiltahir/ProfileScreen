import 'package:flutter/material.dart';

class social_details extends StatelessWidget {
  final String count;
  final String name;
  final double? fontSize;
  const social_details({
    Key? key,
    required this.count,
    required this.name,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: fontSize),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(name)
      ],
    );
  }
}
