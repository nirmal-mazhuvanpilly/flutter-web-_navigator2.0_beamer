class Book {
  const Book({this.id, this.name, this.author});

  final int? id;
  final String? name;
  final String? author;
}

class BookList {
  static final List<Book>? bookList = [
    const Book(
        id: 1,
        name: 'Stranger in a Strange Land',
        author: 'Robert A. Heinlein'),
    const Book(id: 2, name: 'Foundation', author: 'Isaac Asimov'),
    const Book(id: 3, name: 'Fahrenheit 451', author: 'Ray Bradbury'),
  ];
}
