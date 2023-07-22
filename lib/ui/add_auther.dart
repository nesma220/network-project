import 'package:flutter/material.dart';
import 'package:network/model/author_model.dart';
import 'package:network/network/api.dart';

class AddAuther extends StatefulWidget {
  const AddAuther({Key? key}) : super(key: key);

  @override
  State<AddAuther> createState() => _AddAutherState();
}

class _AddAutherState extends State<AddAuther> {
  String? authorBody;
  String? authorTitle;
  int? authorUserId;
  final AddAutorkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'AuthorUserId',
                  hintText: 'Enter Author userId',
                ),
                onChanged: (value) {
                  setState(() {
                    authorUserId = int.parse(value);
                  });
                },
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'AuthorTitle',
                  hintText: 'Enter Author title',
                ),
                onChanged: (value) {
                  setState(() {
                    authorTitle = value;
                  });
                },
              ),
              const SizedBox(height: 6),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'AuthorBody',
                  hintText: 'Enter Author Body',
                ),
                onChanged: (value) {
                  setState(() {
                    authorBody = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  //send data to the internet

                  API
                      .createAuthor(Author(
                          userId: authorUserId!,
                          title: authorTitle,
                          body: authorBody))
                      .then((author) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('SUCCESS Add Post')));
                    Navigator.of(context).pop();
                  });
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
