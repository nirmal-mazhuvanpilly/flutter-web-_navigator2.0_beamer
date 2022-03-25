import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/widgets/common_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "HomeScreen", backButtonEnabled: false),
      body: Center(
        child: GestureDetector(
          onTap: () => context.beamToNamed('/books'),
          child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Colors.blue.shade900,
                  ])),
              child: const Center(
                  child: Text(
                'See books',
                style: TextStyle(color: Colors.white),
              ))),
        ),
      ),
    );
  }
}
