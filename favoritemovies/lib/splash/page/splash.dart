import 'package:favoritemovies/resources/color_manager.dart';
import 'package:favoritemovies/resources/routes_manager.dart';
import 'package:favoritemovies/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:favoritemovies/resources/assets_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashBloc splashBloc = SplashBloc();

  @override
  void initState() {
    super.initState();
    splashBloc.add(Anmitionsplashstart());
  }

  @override
  void dispose() {
    splashBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      bloc: splashBloc,
      listenWhen: (previous, current) => current is SplashActionState,
      listener: (context, state) {
        if (state is SplasNavigatetoHome) {
          Navigator.pushReplacementNamed(
            context,
            Routes.home,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.lightdark,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  ImageAssets.anmition,
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
