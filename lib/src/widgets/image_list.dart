import 'package:flutter/material.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageList> images;

  ImageList(this.images);

  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        var url;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          child: Image.network(images[index].url),
        );
      },
    );
  }
}
