import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class DataNotFound extends StatelessWidget {
  const DataNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Data Not Found",
              style: TextStyle(fontSize: 100),
            ),
            InkWell(
              onTap: () {
                context.beamToNamed("/contacts");
              },
              child: Text(
                "Click here to get contacts",
                style: TextStyle(
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
