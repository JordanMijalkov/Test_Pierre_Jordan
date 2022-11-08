import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/services/Validator.dart';
import '../viewModel/books_list_view_model.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  _AddBookPageState createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleInput = TextEditingController();
  final _authorInput = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    _titleInput.addListener(() {
      final isButtonActive = FieldValidator.checkButtonIsActive(
          _titleInput.text, _authorInput.text);
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    _authorInput.addListener(() {
      final isButtonActive = FieldValidator.checkButtonIsActive(
          _titleInput.text, _authorInput.text);
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });

    _titleInput.text = "";
    _authorInput.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<BooksListViewModel>(context);
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text("Add Book"),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleInput(),
            authorInput(),
            const SizedBox(
              height: 20,
            ),
            const Text("There is no Image"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                saveButton(vm),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget titleInput() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Title',
      ),
      controller: _titleInput,
    );
  }

  Widget authorInput() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Author',
      ),
      controller: _authorInput,
    );
  }

  Widget saveButton(BooksListViewModel vm) {
    return ElevatedButton(
      onPressed: isButtonActive
          ? () {
              vm.addBook(
                _titleInput.text,
                _authorInput.text,
              );
              _titleInput.text = '';
              _authorInput.text = '';
              const snackBar = SnackBar(
                content: Text('Added!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          : null,
      child: const Text("Add"),
    );
  }
}
