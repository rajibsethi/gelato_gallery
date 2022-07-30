import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final String image;
  final String name;

  // ignore: prefer_const_constructors_in_immutables
  ImageDetailScreen({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
