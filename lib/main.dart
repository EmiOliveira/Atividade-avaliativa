import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Digital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LibraryScreen(),
    );
  }
}

class Book {
  String title;
  String author;
  String description;
  String coverImage;

  Book({required this.title, required this.author, required this.description, required this.coverImage});
}

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<Book> books = [
    Book(
      title: 'A Guerra dos Tronos',
      author: 'George R. R. Martin',
      description: 'A primeira temporada da série de televisão Game of Thrones é baseada neste livro.',
      coverImage: 'https://images-na.ssl-images-amazon.com/images/I/71k4G%2BZk%2B-L.jpg',
    ),
    Book(
      title: 'Harry Potter e a Pedra Filosofal',
      author: 'J.K. Rowling',
      description: 'O primeiro livro da série Harry Potter.',
      coverImage: 'https://images-na.ssl-images-amazon.com/images/I/51UoqRAxwDL._SX324_BO1,204,203,200_.jpg',
    ),
    Book(
      title: 'O Hobbit',
      author: 'J.R.R. Tolkien',
      description: 'Bilbo Bolseiro é um hobbit que leva uma vida confortável e sem ambições.',
      coverImage: 'https://images-na.ssl-images-amazon.com/images/I/91YklPf-yUL.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Biblioteca Digital'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          Book book = books[index];
          return ListTile(
            leading: Image.network(book.coverImage),
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookDetailScreen(book: book)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Busca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(book.coverImage),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Description: ${book.description}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


