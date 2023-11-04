import 'package:flutter/material.dart';
import 'package:flutter_assignment/Screen/photo_gallery.dart';

class PhotoDetails extends StatelessWidget {
  final Photo photo;
  const PhotoDetails({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(photo.url),
            Text(photo.title),
            Text('ID: ${photo.id}'),
          ],
        ),
      ),
    );
  }
}