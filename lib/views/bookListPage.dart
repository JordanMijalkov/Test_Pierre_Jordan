import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/widgets/book_list.dart';
import '../viewModel/books_list_view_model.dart';

class BookListPage extends StatefulWidget {
  BookListPage({Key? key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<BooksListViewModel>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BooksListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book List"),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
                child: BookList(
              books: vm.books,
            ))
          ],
        ),
      ),
    );
  }
}
