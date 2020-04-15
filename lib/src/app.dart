import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:pics/Widgets/image_list.dart';
import 'package:pics/Widgets/image_model.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int count = 0;

  void fetchData() async {
    count++;
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$count');

    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  List<ImageModel> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Let Me See Some Pictures')),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchData,
          child: Icon(Icons.add)),
      body: ImageList(images),
    );
  }
}
