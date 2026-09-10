import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project2/providers/provider_todo.dart';
import 'dash_screen.dart';
import 'providers/bottom_navigation_provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create:(_)=> BottomNavigationProvider(),),
            ChangeNotifierProvider(create:(_)=> TodoProvider(),),
          ],
          child: const MyApp()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DashScreen(),
    );
  }
}


