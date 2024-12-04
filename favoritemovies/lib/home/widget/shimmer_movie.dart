import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.favoriteMovies),
      ),
      body: const ShimmerGrid(),
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.dark,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: ColorManager.gray800,
              highlightColor: ColorManager.gray500,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.gray800,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
