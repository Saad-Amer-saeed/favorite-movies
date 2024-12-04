import 'package:favoritemovies/home/page/home.dart';
import 'package:favoritemovies/resources/theme_manager.dart';
import 'package:favoritemovies/splash/page/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      title: 'Splash to Home Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => Home(),
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:favoritemovies/home/data/models/flim.dart';
// import 'package:favoritemovies/home/data/web_service/filim_web_services.dart';
// import 'package:favoritemovies/home/data/repository/flim_repository.dart';

// void main() async {
//   // Initialize FlimsWebServices
//   final flimsWebServices = FlimsWebServices();

//   // Create an instance of FlimsRepository
//   final flimsRepository = FlimsRepository(flimsWebServices);

//   // Fetch all films
//   final films = await flimsRepository.getAllFlims();

//   // Print the result to check if it works
//   print('Fetched Films: $films');

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Films App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Films'),
//         ),
//         body: Center(
//           child: Text('Check the console for fetched films'),
//         ),
//       ),
//     );
//   }
// }
