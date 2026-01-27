import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'presentation/ui/film_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'SWAPI App', home: const FilmScreen());
  }
}

// ==========================================
// ETAPE 4 : CODE SANS CLEAN ARCHITECTURE
// ==========================================
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String responseData = 'Chargement...';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://swapi.info/api/films'));
//
//     if (response.statusCode == 200) {
//       setState(() {
//         responseData = response.body;
//       });
//     } else {
//       setState(() {
//         responseData = 'Erreur: ${response.statusCode}';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('SWAPI Films')),
//       body: SingleChildScrollView(child: Text(responseData)),
//     );
//   }
// }
