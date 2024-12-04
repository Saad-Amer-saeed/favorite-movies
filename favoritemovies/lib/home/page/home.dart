import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc(); // Initialize the HomeBloc

  @override
  void initState() {
    super.initState();
    homeBloc.add(Loadfilmseven()); // Trigger the event to fetch movies
  }

  @override
  void dispose() {
    homeBloc.close(); // Close the Bloc when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is LoadFilmsState,
      listener: (context, state) {
        // Handle side effects here if necessary
      },
      builder: (context, state) {
        if (state is LoadingState) {
          // Show a shimmer effect while loading
          return Scaffold(
            appBar: AppBar(
              title: const Text('Favorite Movies'),
            ),
            body: Container(
              color: Colors.black, // Dark background
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 6, // Number of shimmer items (temporary)
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[500]!,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is LoadFilmsState) {
          // Show the grid of films
          return Scaffold(
            appBar: AppBar(
              title: const Text('Favorite Movies'),
            ),
            body: Container(
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
                  itemCount: state.films.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          state.films[index].poster ?? '',
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }

        // Default fallback (loading spinner)
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorite Movies'),
          ),
          body: const Center(
            child: CircularProgressIndicator(), // Fallback spinner
          ),
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(home: Home()));
