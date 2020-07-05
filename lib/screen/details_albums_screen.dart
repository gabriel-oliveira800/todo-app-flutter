import 'package:flutter/material.dart';
import 'package:todoApp/models/albums.dart';
import 'package:todoApp/models/photo.dart';
import 'package:todoApp/repository/repository.dart';

import 'components/photo_item.dart';

class DetailsAlbum extends StatelessWidget {
  final AlbumModel album;
  final Repository repository;

  const DetailsAlbum({@required this.album, @required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          album.userId.toString(),
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<PhotoModel>>(
        future: repository.getAlbumsPhoto(album.id),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final List<PhotoModel> photos = snapshot.data;

          return PhotoItem(photos: photos);
        },
      ),
    );
  }
}
