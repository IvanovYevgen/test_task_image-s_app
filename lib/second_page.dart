import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageURL), fit: BoxFit.cover),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
