import 'dart:convert';
import 'package:http/http.dart';
import 'package:network/model/author_model.dart';

class API {
  static const String _base_url = 'https://jsonplaceholder.typicode.com';

  static Future<Author> createAuthor(Author author) async {
    // business logic to send data to the server

    final Response response = await post(
      Uri.parse('$_base_url/posts'), // Convert the URL string to a Uri object
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: jsonEncode(author.toJson()),
    );
    print(response.body);

     if (response.statusCode == 200) {
      print(response.body);
      return Author.fromJson(json.decode(response.body));
    } else {
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
       Exception("Can't load Author");
    }
return Author.fromJson(json.decode(response.body));
  }
}
