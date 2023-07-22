import 'package:flutter/material.dart';
import 'package:network/model/author_model.dart';
import 'package:network/network/api.dart';
import 'package:network/ui/add_auther.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NetWorking lesson 2'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAuther(),
            ),
          );
        },
      ),
      body: FutureBuilder<List<Author>>(
        future: API.getAllAuthor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final title = snapshot.data![index].title.toString();
                final words = title.split(" ");
                final firstTwoWords =
                    words.length > 1 ? words.sublist(0, 3).join(" ") : title;

                return Card(
                  color: Colors.lightBlue.shade100,

                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          firstTwoWords,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 50),
                        Text(
                          'Post Id ${snapshot.data![index].userId}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      snapshot.data![index].body as String ?? '',
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('You Have a Error');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
