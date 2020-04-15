import 'package:flutter/material.dart';
import 'package:pics/Widgets/image_model.dart';

class ImageList extends StatelessWidget {
  List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Column(
                children: <Widget>[
                  Image.network(images[index].url),
                  Text(images[index].title),
                  
                ],
              ));
        });
  }
}
