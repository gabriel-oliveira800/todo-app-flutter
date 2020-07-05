import 'package:flutter/material.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/repository/repository.dart';

class BodyPosts extends StatelessWidget {
  final Repository repository;
  final Future<List<PostModel>> future;

  const BodyPosts({@required this.future, @required this.repository});

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return FutureBuilder<List<PostModel>>(
      future: future,
      builder: (_, snapshot) {
        if (snapshot.hasError) return Center(child: Text('Erro Desconhecido'));

        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          addRepaintBoundaries: false,
          itemCount: snapshot.data.length,
          itemBuilder: (_, index) {
            final PostModel model = snapshot.data[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Title: ',
                        style: theme.subtitle2.copyWith(fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(
                            text: model.title,
                            style: theme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Content: ',
                      style: theme.subtitle2.copyWith(fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: model.body,
                          style: theme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
