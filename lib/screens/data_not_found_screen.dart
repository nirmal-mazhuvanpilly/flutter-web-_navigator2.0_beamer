import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Data Not Found",
          style: TextStyle(fontSize: 100),
        ),
      ),
    );
  }
}
