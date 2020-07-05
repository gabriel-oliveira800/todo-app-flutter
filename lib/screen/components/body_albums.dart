import 'package:flutter/material.dart';
import 'package:todoApp/models/albums.dart';
import 'package:todoApp/repository/repository.dart';

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
            final AlbumModel model = snapshot.data[index];

            return ListTile(
              onTap: () {},
              leading: CircleAvatar(
                child: Text(model.id.toString()),
              ),
              title: Text(model.title),
              trailing: Icon(Icons.arrow_forward),
            );
          },
        );
      },
    );
  }
}
