import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/post.dart';

void main() {
  runApp(const Home());
}




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   Future<Post> ?postData;

  @override
  void initState() {
    postData =  getPostById();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home  : Scaffold(
        appBar: AppBar(title:const Text('NetWork http lesson 1'),),
        body:Center(
          child: FutureBuilder<Post>(
            future: postData,
            builder: (context, snapshot) {
            if(snapshot.hasData){
              return Text(snapshot.data!.title);
            }else if (snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<Post>getPostById ()async{
    http.Response futurePost =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));


if(futurePost.statusCode == 200){

//success
return Post.fromJson(json.decode(futurePost.body));
}else{
  //error
  throw Exception('can not load post data');
}
  }
}
