// import 'package:favoritemovies/resources/color_manager.dart';
// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   final List<String> movies = [
//     'Movie 1',
//     'Movie 2',
//     'Movie 3',
//     'Movie 4',
//     'Movie 5',
//     'Movie 6',
//     'Movie 6',
//     'Movie 6',
//     'Movie 6',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorite Movies'),
//       ),
//       body: Container(
//         color: ColorManager.dark,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, // 2 items per row
//               crossAxisSpacing: 6.0, // Space between columns
//               mainAxisSpacing: 8.0, // Space between rows
//               childAspectRatio: 0.75, // Adjust aspect ratio for width/height
//             ),
//             itemCount: movies.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 elevation: 4,
//                 child: Center(
//                   child: Text(
//                     movies[index],
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: Home()));

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> movieImages = [
    'assets/movie1.jpg',
    'assets/movie2.jpg',
    'assets/movie3.jpg',
    'assets/movie4.jpg',
    'assets/movie5.jpg',
    'assets/movie6.jpg',
    'assets/movie7.jpg',
    'assets/movie8.jpg',
    'assets/movie9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Container(
        color: Colors.black, // Dark background color
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 6.0, // Space between columns
              mainAxisSpacing: 8.0, // Space between rows
              childAspectRatio: 0.75, // Adjust aspect ratio for width/height
            ),
            itemCount: movieImages.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12), // Image border radius
                  child: Image.asset(
                    movieImages[index], // Replace with your image path
                    fit: BoxFit.cover,
                    height: 150, // Fixed height for images
                    width: double.infinity, // Full width for the image
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Home()));
