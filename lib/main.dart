import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_favourite/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Netflix Clone",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blueGrey,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
