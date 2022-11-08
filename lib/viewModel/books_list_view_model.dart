import 'package:flutter/material.dart';
import '../common/services/service.dart';
import '../models/book.dart';
import 'book_view_model.dart';

class BooksListViewModel extends ChangeNotifier {
  List<BookViewModel> books = [];
  Future<void> fetchData() async {
    final results = await Webservice().fetchData();
    if (books.isEmpty) {
      books = results.map((item) => BookViewModel(book: item)).toList();
    }
    notifyListeners();
  }

  removeBook(BookViewModel book) {
    books.remove(book);
    notifyListeners();
  }

  editBook(String bookId, String name, String author) {
    books[books.indexWhere((element) => element.bookId == bookId)] =
        BookViewModel(
            book: Book(
      bookId: bookId,
      name: name,
      author: author,
      image: books[int.parse(bookId) - 1].image,
    ));
    notifyListeners();
  }

  addBook(String name, String author) {
    var bookId = DateTime.now().toString();
    books.add(BookViewModel(
        book: Book(
            bookId: bookId,
            name: name,
            author: author,
            image:
                "https://www.mswordcoverpages.com/wp-content/uploads/2018/10/Book-cover-page-5-CRC.png")));
    notifyListeners();
    print('Book was added!');
  }
}
