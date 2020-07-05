import 'package:flutter/material.dart';
import 'package:todoApp/models/photo.dart';

class PhotoItem extends StatelessWidget {
  final List<PhotoModel> photos;
  const PhotoItem({@required this.photos});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(6.0),
      itemCount: photos.length,
      itemBuilder: (_, index) {
        final PhotoModel photo = photos[index];
        final double radius = 36;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: radius,
                      backgroundImage: NetworkImage(photo.url),
                    ),
                    SizedBox(width: 4),
                    CircleAvatar(
                      radius: radius,
                      backgroundImage: NetworkImage(photo.thumbnailUrl),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  photo.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
