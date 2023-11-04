import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Screen/photo_details.dart';
import 'package:http/http.dart';

class PhotoGalleryList extends StatefulWidget {
  const PhotoGalleryList({super.key});

  @override
  State<PhotoGalleryList> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGalleryList> {
  bool inProgress = false;
  List<Photo> photoList = [];

  Future<void> getPhoto() async {
    inProgress = true;
    setState(() {});

    Response response =
    await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List<dynamic> responseData = jsonDecode(response.body);

      for (Map<String, dynamic> photoJson in responseData) {
        photoList.add(Photo(photoJson['albumId'], photoJson['id'],
            photoJson['title'], photoJson['url'], photoJson['thumbnailUrl']));
      }
      inProgress = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    getPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: inProgress
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        itemCount: photoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoDetails(
                          photo: photoList[index],
                        )));
              },
              leading: Image.network(photoList[index].thumbnailUrl),
              title: Text(photoList[index].title),
            ),
          );
        },
        separatorBuilder: (_,__)=>Divider(),
      ),
    );
  }
}


class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
}