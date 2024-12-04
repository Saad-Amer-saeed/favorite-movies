import 'package:favoritemovies/home/data/models/flim.dart';
import 'package:flutter/material.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  final List<Flim> films; // Assuming `films` is a list of `Movie` objects

  FavoriteMoviesScreen({required this.films});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: FavoriteMoviesGrid(films: films),
    );
  }
}

class FavoriteMoviesGrid extends StatelessWidget {
  final List<Flim> films;

  const FavoriteMoviesGrid({Key? key, required this.films}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.75,
          ),
          itemCount: films.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  films[index].poster ?? '',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
