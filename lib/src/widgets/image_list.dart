import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildimages(images[index]);
      },
    );
  }

  Widget buildimages(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          // SizedBox(
          //   height: 10.0,
          // ),
          Padding(
            padding: EdgeInsets.only(top:9.0),
            child: Text(
              image.title,
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent.shade400),
            ),
          ),
        ],
      ),
    );
  }
}
