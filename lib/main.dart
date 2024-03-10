//import 'package:first_app/sum_app/sum_app.dart';
import 'package:first_app/product_app_api/app.dart';
//import 'package:first_app/todo_app/todo_list_app.dart';
import 'package:flutter/material.dart';

void main() {
  //runApp(const TodoListApp());
  //runApp(const SumApp());
  runApp(const ProductApp());
}




// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
// title: Transform.scale(
//   scale: 1.5,
//   child: FloatingActionButton(
//     child: Text(
//       "My Home",
//       style: TextStyle(fontSize: 11),
//     ),
//     elevation: 1.0,
//     highlightElevation: 12.0,
//     shape: CircleBorder(side: BorderSide.none),
//     backgroundColor: Colors.green,
//     onPressed: () {},
//   ),
// ),

// backgroundColor: Colors.amber,
// titleSpacing: 0,
// toolbarHeight: 100,
// bottomOpacity: 1,
// elevation: 0,
// actions: [
//   IconButton(
//     onPressed: () {},
//     icon: Icon(Icons.home),
//   ),
// Expanded(
//   child: Center(
//     child: Text(
//       "My APP",
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// ),
// Row(
// children: [
//   IconButton(
//     onPressed: () {},
//     icon: Icon(Icons.settings),
//   ),
//   IconButton(
//     onPressed: () {},
//     icon: Icon(Icons.email),
//   )
// ],
//               ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//           elevation: 10, child: Icon(Icons.add), onPressed: () {}),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("My App"),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 color: Colors.blue, // Adjust color as needed
//                 child: Center(
//                   widthFactor: 10,
//                   child: Text(
//                     "Your main content goes here",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.green, // Adjust color as needed
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.home),
//                       onPressed: () {
//                         // Handle home button tap
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.person),
//                       onPressed: () {
//                         // Handle profile button tap
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.message),
//                       onPressed: () {
//                         // Handle message button tap
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey,
//         appBar: AppBar(
//           toolbarHeight: 60,
//           toolbarOpacity: 1,
//           titleTextStyle: TextStyle(
//             fontSize: 30,
//           ),
//           backgroundColor: Colors.amber,
//           title: Text(
//             "App Bar",
//             style: TextStyle(
//               fontSize: 20,
//             ),
//           ),
//         ),
//         bottomNavigationBar: SizedBox(
//           width: 100,
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                   iconSize: 30,
//                   onPressed: () {},
//                   icon: Icon(Icons.home),
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   onPressed: () {},
//                   icon: Icon(Icons.message),
//                 ),
//                 IconButton(
//                   iconSize: 30,
//                   onPressed: () {},
//                   icon: Icon(Icons.email),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
