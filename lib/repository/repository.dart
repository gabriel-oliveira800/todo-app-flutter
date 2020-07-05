import 'package:dio/dio.dart';
import 'package:todoApp/client/client_dio.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/models/albums.dart';

import 'repository_i.dart';

class Repository implements RepositoryI {
  final CustomDio dio;
  Repository(this.dio);

  @override
  Future<List<UserModel>> getUsers() async {
    Response res = await dio.instance.get('/users');
    if (res.statusCode != 200) return null;

    return (res.data as List).map((user) => UserModel.fromJson(user)).toList();
  }

  @override
  Future<List<PostModel>> getPosts() async {
    Response res = await dio.instance.get('/posts');
    if (res.statusCode != 200) return null;

    print(res.data[0]);

    return (res.data as List)
        .map((posts) => PostModel.fromJson(posts))
        .toList();
  }

  @override
  Future<List<AlbumModel>> getAlbums(int id) {
    return null;
  }
}
