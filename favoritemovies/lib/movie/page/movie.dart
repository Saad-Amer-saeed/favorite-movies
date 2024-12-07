// import 'dart:math';

// import 'package:favoritemovies/movie/bloc/movie_bloc.dart';
// import 'package:favoritemovies/movie/data/repository/movie_repository.dart';
// import 'package:favoritemovies/movie/data/web_service/web_service.dart';
// import 'package:favoritemovies/resources/color_manager.dart';
// import 'package:flutter/material.dart';

// class Movie extends StatefulWidget {
//   const Movie({Key? key}) : super(key: key);

//   @override
//   _MovieState createState() => _MovieState();
// }

// class _MovieState extends State<Movie> {
//   bool _isFavorite = false; // State variable to manage favorite status
//   final MovieBloc movieBloc = MovieBloc();

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//     // movieBloc.add(FeachingRequsetMovieEvent("tt0108778"));
//   }

//   Future<void> _fetchData() async {
//     final flimsWebServices = RequsetFlimsWebServices();
//     final requsetFlimRepository = RequsetFlimRepository(flimsWebServices);
//     var result = await requsetFlimRepository.geRequsetflim('tt0108778');
//     print(result);

//     // Add any other logic you need after fetching the data
//   }

//   @override
//   void dispose() {
//     movieBloc.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.lightdark,
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Movie Poster Image
//             Image.network(
//               "https://m.media-amazon.com/images/M/MV5BNzNmNmQ2ZDEtMTc1MS00NjNiLThlMGUtZmQxNTg1Nzg5NWMzXkEyXkFqcGc@._V1_SX300.jpg",
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 20),

//             // Movie Title and Year
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Friends',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: ColorManager.white,
//                     ),
//                   ),
//                   Text(
//                     '1994–2004',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: ColorManager.white.withOpacity(0.7),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),

//             // Writer Info with Rating
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.amber),
//                   SizedBox(width: 8), // Space between icon and rating
//                   Text(
//                     '4.4',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: ColorManager.white,
//                     ),
//                   ),
//                   Spacer(), // Push the button to the far right
//                   IconButton(
//                     icon: Icon(
//                       _isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: _isFavorite ? Colors.red : Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isFavorite = !_isFavorite; // Toggle favorite status
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),

//             // Writer Info
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Writer: David Crane, Marta Kauffman',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: ColorManager.white.withOpacity(0.8),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),

//             // Actors Info
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Actors: Jennifer Aniston, Courteney Cox, Lisa Kudrow',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: ColorManager.white.withOpacity(0.8),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),

//             // Plot Info
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Summary: Follows the personal and professional lives of six twenty to thirty-year-old friends living in the Manhattan borough of New York City.',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: ColorManager.white.withOpacity(0.8),
//                   height: 1.6, // Line height for better readability
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:favoritemovies/movie/bloc/movie_bloc.dart';
import 'package:favoritemovies/movie/data/repository/movie_repository.dart';
import 'package:favoritemovies/movie/data/web_service/web_service.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Movie extends StatefulWidget {
  final String imdbID;
  const Movie({Key? key, required this.imdbID}) : super(key: key);

  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  bool _isFavorite = false; // State variable to manage favorite status
  final MovieBloc movieBloc = MovieBloc();

  @override
  void initState() {
    super.initState();
    movieBloc.add(FeachingRequsetMovieEvent(widget.imdbID));
  }

  @override
  void dispose() {
    movieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      bloc: movieBloc,
      buildWhen: (previous, current) {
        // Only rebuild when the state is not loading to avoid unnecessary rebuilding
        return current is FeachingMoviesucess;
      },
      listenWhen: (previous, current) {
        // You can use this to listen to state changes and perform side-effects (e.g., navigation)
        return current is! FeachingMoviesucess;
      },
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: Center(
                child: CircularProgressIndicator()), // Show loading indicator
          );
        }

        if (state is FeachingMoviesucess) {
          print(state.film.rating);

          return Scaffold(
            backgroundColor: ColorManager.lightdark,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //   "https://m.media-amazon.com/images/M/MV5BNzNmNmQ2ZDEtMTc1MS00NjNiLThlMGUtZmQxNTg1Nzg5NWMzXkEyXkFqcGc@._V1_SX300.jpg",
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),

                  Image.network(
                    state
                        .film.image!, // Use the URL from the fetched movie data
                    width: double.infinity,
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
                          state.film
                              .title!, // Use the title from the fetched movie data
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white,
                          ),
                        ),
                        Text(
                          state.film
                              .year!, // Use the year from the fetched movie data
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
                        SizedBox(width: 8),
                        Text(
                          state.film.rating.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite ? Colors.red : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              _isFavorite =
                                  !_isFavorite; // Toggle favorite status
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Writer Info
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Writer: ${state.film.writer}',
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
                      'Actors: ${state.film.actors}',
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
                      'Summary: ${state.film.summary}',
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

        return Scaffold(
          body: Text('hhhhhhhhhhhh'),
        ); // Default case to handle unexpected states
      },
    );
  }
}
