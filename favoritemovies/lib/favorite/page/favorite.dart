import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:flutter/material.dart';

class FavoriteFlims extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favorite),
      ),
      body: const Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
