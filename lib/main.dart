
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Screen/photo_gallery.dart';

void main() {
runApp(const PhotoGallery());
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: PhotoGalleryList() ,
    );
  }
}
