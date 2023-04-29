import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Book {
  String title;
  String author;
  String summary;
  List<String> chapters;
  String image;

  Book(
      {required this.title,
      required this.author,
      required this.summary,
      required this.chapters, required this.image});
}

class MyApp extends StatelessWidget {
  final List<Book> library = [
    Book(
        title: "O Senhor dos Anéis",
        author: "J.R.R. Tolkien",
        summary:
            "Um hobbit chamado Frodo recebe a missão de destruir um anel mágico que pode controlar o mundo.",
        chapters: [
          "A Sociedade do Anel",
          "As Duas Torres",
          "O Retorno do Rei"],
        image:('assets/OSenhorAneis.jpg'),
        ),
    Book(
        title: "1984",
        author: "George Orwell",
        summary:
            "Em um futuro distópico, um governo totalitário controla tudo e todos.",
        chapters: ["Parte 1", "Parte 2", "Parte 3"],
        image: "assets/1984.png",
      ),
      Book(
        title: "A Moreninha",
        author: "George Orwell",
        summary:
            "A Moreninha é um romance do escritor brasileiro Joaquim Manuel de Macedo e um dos maiores clássicos da literatura brasileira.",
        chapters: ["Parte 1", "Parte 2", "Parte 3"],
        image: "assets/A moreninha.jpg",
      ),
      Book(
        title: "Iracema",
        author: "Jose de Alencar",
        summary:
            "Iracema é uma obra do escritor romântico cearense José de Alencar. Publicada em 1865, trata-se de um romance indianista, com presença de elementos indígenas.",
        chapters: ["Parte 1", "Parte 2", "Parte 3"],
        image: "assets/Iracema.jpg",
      ),
      Book(
        title: "A Cartomante",
        author: "Jose de Alencar",
        summary:
            "A Cartomante é um conto do escritor brasileiro Machado de Assis, que foi publicado originalmente na Gazeta de Notícias do Rio de Janeiro, em 28 de novembro de 1884.",
        chapters: ["Parte 1", "Parte 2", "Parte 3", "Parte 4", "Parte 5"],
        image: "assets/Cartomante.jpg",
      ),
      Book(
        title: "O Guarani",
        author: "Jose de Alencar",
        summary:
            "O Guarani é um romance histórico escrito por José de Alencar, desenvolvido em princípio em folhetim.",
        chapters: ["Parte 1", "Parte 2", "Parte 3", "Parte 4", "Parte 5", "Parte 6", "Parte 7", "Parte 8"],
        image: "assets/Indio.jpg",
      ),
      Book(
        title: "O Cortiço",
        author: "Aluizio de Azevedo",
        summary:
            "O Cortiço é um romance do escritor brasileiro Aluísio de Azevedo. Foi publicado em 1890 e faz parte do movimento naturalista do Brasil.",
        chapters: ["Parte 1", "Parte 2", "Parte 3", "Parte 4", "Parte 5", "Parte 6", "Parte 7", "Parte 8"],
        image: "assets/Cortico.jpg",
      ),
      Book(
        title: "A Cidade e as Serras",
        author: "Eça de Queiroz",
        summary:
            "A Cidade e as Serras é um romance de Eça de Queirós, autor do Realismo português, e pertence à terceira e última fase de sua obra.",
        chapters: ["Parte 1", "Parte 2", "Parte 3", "Parte 4", "Parte 5", "Parte 6", "Parte 7", "Parte 8"],
        image: "assets/Cidade.jpg",
      ),
      Book(
        title: "A felicidade Clandestina",
        author: "Clarice Lispector",
        summary:
            "A felicidade sempre iria ser clandestina para mim. Parece que eu já pressentia.",
        chapters: ["Parte 1", "Parte 2", "Parte 3", "Parte 4", "Parte 5", "Parte 6", "Parte 7", "Parte 8"],
        image: "assets/Cidade.jpg",
      ),
    Book(
        title: "O Pequeno Príncipe",
        author: "Antoine de Saint-Exupéry",
        summary:
            "Um piloto cai no deserto do Saara e conhece um pequeno príncipe de outro planeta.",
        chapters: ["Capítulo 1", "Capítulo 2", "Capítulo 3"],
        image: "assets/PequenoPrincipe.jpg",
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Biblioteca'),
        ),
        body: ListView.builder(
          itemCount: library.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(library[index].title),
              subtitle: Text(library[index].author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookDetails(book: library[index])),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  final Book book;

  BookDetails({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                book.image,
                height: 200,
                width: 150,
              ),
            ),
            SizedBox(height: 16),
            Text("Autor: " + book.author),
            SizedBox(height: 16),
            Text("Resumo: " + book.summary),
            SizedBox(height: 16),
            Text("Capítulos:"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                book.chapters.length,
                (index) => Text("${index + 1}. ${book.chapters[index]}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
