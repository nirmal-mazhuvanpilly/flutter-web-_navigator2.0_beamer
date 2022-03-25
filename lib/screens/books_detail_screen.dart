import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/book.dart';
import 'package:flutter_web_app_navigation/widgets/common_app_bar.dart';

class BooksDetailsScreen extends StatelessWidget {
  final Book? book;
  const BooksDetailsScreen({Key? key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(child: Text(book?.id.toString() ?? "")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Book Name : ",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20)),
                Text(book?.name ?? "",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Author : ",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20)),
                Text(book?.author ?? "",
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
