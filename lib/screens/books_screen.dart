import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/models/book.dart';
import 'package:flutter_web_app_navigation/widgets/common_app_bar.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({Key? key}) : super(key: key);

  final List<Book>? bookList = [
    const Book(
        id: 1,
        name: 'Stranger in a Strange Land',
        author: 'Robert A. Heinlein'),
    const Book(id: 2, name: 'Foundation', author: 'Isaac Asimov'),
    const Book(id: 3, name: 'Fahrenheit 451', author: 'Ray Bradbury'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: ListView(
          children: bookList!
              .map((bookData) => GestureDetector(
                    onTap: () {
                      context.beamToNamed('/books/${bookData.id}',
                          data: bookData);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: Text(bookData.id.toString()),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookData.name ?? "",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                bookData.author ?? "",
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
