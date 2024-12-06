import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  final HomeBloc homeBloc;
  final TextEditingController _controller = TextEditingController();

  // Constructor to accept homeBloc as a parameter
  SearchMovies({
    required this.homeBloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightdark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          controller: _controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter a search term',
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white, // Set search icon color to white
              ),
              onPressed: () {
                String searchTerm = _controller.text; // Use _controller here
                homeBloc.add(FeachingFlimsEvent(searchTerm)); // Trigger search
              },
            ),
          ),
        ),
      ),
    );
  }
}
