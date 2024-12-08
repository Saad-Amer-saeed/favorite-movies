import 'package:favoritemovies/movie/data/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/home/data/models/flim.dart';

class MovieDetails extends StatelessWidget {
  final RequsetFlim flim;
  final bool isInFavoriteList;
  final Function onFavoritePressed;

  MovieDetails({
    Key? key,
    required this.flim,
    required this.isInFavoriteList,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          flim.title!,
          style: TextStyle(color: ColorManager.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              flim.image!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      flim.title!,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                  Text(
                    flim.year!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: ColorManager.amber),
                  const SizedBox(width: 8),
                  Text(
                    flim.rating.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isInFavoriteList ? Icons.favorite : Icons.favorite_border,
                      color: isInFavoriteList ? Colors.red : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      onFavoritePressed();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Writer: ${flim.writer}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Actors: ${flim.actors}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Summary: ${flim.summary}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
