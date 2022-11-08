
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewModel/book_view_model.dart';
import '../../viewModel/books_list_view_model.dart';
import '../../views/addBookPage.dart';

class BookList extends StatelessWidget {
  final List<BookViewModel> books;

  BookList({required this.books});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BooksListViewModel>(context);
    if (this.books.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: this.books.length,
      itemBuilder: (context, index) {
        final book = this.books[index];

        return bookWidget(book, context, vm);
      },
    );
  }

  Widget bookWidget(BookViewModel book, BuildContext context, vm) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              children: [
                Image.network(
                  book.image,
                  width: size.width * 0.8,
                  height: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(book.name,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                Text(book.author),
              ],
            ),
          ));
    
  }
}
