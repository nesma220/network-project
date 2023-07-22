import 'package:flutter/material.dart';
import 'package:network/ui/add_auther.dart';


class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text('NetWorking lesson 2'),),
      body: null,
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.add),
        onPressed: () {
Navigator.push(context, MaterialPageRoute(builder:(context)=>AddAuther() ,),);
      },),
    );
  }
}
