import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/src/models/image_model.dart';
import 'widgets/image_list.dart';
import 'dart:convert';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var responce =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(responce.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ImageList(images),
      appBar: AppBar(
        title: Text('Lets see some images!'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add'),
        icon: Icon(Icons.add),
        onPressed: fetchImage,
      ),
    ));
  }
}
