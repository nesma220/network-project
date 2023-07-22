import 'package:flutter/material.dart';
import 'package:network/network/api.dart';

class AddAuther extends StatefulWidget {
  const AddAuther({Key? key}) : super(key: key);

  @override
  State<AddAuther> createState() => _AddAutherState();
}

class _AddAutherState extends State<AddAuther> {
  String? authorBody;
  String? authorTitle;
  final AddAutorkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AddAutorkey,
      appBar: AppBar(
        title: Text('New Author'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
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
              ElevatedButton(
                  onPressed: () {
                    //send data to the internet

                    API.createAuthor(authorTitle!, authorBody!).then((author) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('SUCCESS Add Post')));
                    });
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
