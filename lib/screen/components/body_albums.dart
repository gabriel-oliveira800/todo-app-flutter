import 'package:flutter/material.dart';
import 'package:todoApp/models/albums.dart';
import 'package:todoApp/repository/repository.dart';

import '../details_albums_screen.dart';

class BodyAlbums extends StatelessWidget {
  final Repository repository;
  final Future<List<AlbumModel>> future;

  const BodyAlbums({@required this.future, @required this.repository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AlbumModel>>(
      future: future,
      builder: (_, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            final AlbumModel albumModel = snapshot.data[index];

            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailsAlbum(
                      album: albumModel,
                      repository: repository,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                child: Text(albumModel.id.toString()),
              ),
              title: Text(albumModel.title),
              trailing: Icon(Icons.arrow_forward),
            );
          },
        );
      },
    );
  }
}
