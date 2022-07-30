// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gelato_gallery/home/home_detail.dart';
import 'package:gelato_gallery/home/home_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  final HomeViewModel _viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: GridView.builder(
        physics: const ScrollPhysics(), 
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
        ),
        itemCount: _viewModel.imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailScreen(
                      image: _viewModel.imageList[index].image,
                      name: _viewModel.imageList[index].name),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_viewModel.imageList[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
