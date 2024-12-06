import 'package:favoritemovies/home/bloc/home_bloc.dart';
import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/strings_manger.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  final HomeBloc homeBloc;
  final TextEditingController _controller = TextEditingController();

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
          style: TextStyle(color: ColorManager.white),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: AppStrings.hintText,
            hintStyle: TextStyle(color: ColorManager.white),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: ColorManager.white,
              ),
              onPressed: () {
                String searchTerm = _controller.text;
                homeBloc.add(FeachingFlimsEvent(searchTerm));
              },
            ),
          ),
        ),
      ),
    );
  }
}
