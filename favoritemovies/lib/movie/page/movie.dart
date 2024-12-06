import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Movie extends StatelessWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightdark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the start
          children: [
            // Movie Poster Image
            Image.network(
              "https://m.media-amazon.com/images/M/MV5BNzNmNmQ2ZDEtMTc1MS00NjNiLThlMGUtZmQxNTg1Nzg5NWMzXkEyXkFqcGc@._V1_SX300.jpg",
              // width: 440, // Set width here
              // height: 450,
              width: double.infinity,
              // height: 500,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),

            // Movie Title and Year
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white,
                    ),
                  ),
                  Text(
                    '1994–2004',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Writer Info with Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8), // Space between icon and rating
                  Text(
                    '4.4',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white,
                    ),
                  ),
                  Spacer(), // This will push the button to the far right
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     _isFavorite ? Icons.favorite : Icons.favorite_border,
                  //     color: Colors.red,
                  //     size: 30,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isFavorite = !_isFavorite; // Toggle favorite status
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Writer Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Writer: David Crane, Marta Kauffman',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Actors Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Actors: Jennifer Aniston, Courteney Cox, Lisa Kudrow',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Plot Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Summary: Follows the personal and professional lives of six twenty to thirty-year-old friends living in the Manhattan borough of New York City.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.white.withOpacity(0.8),
                  height: 1.6, // Line height for better readability
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
