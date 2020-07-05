import 'package:dio/dio.dart';
import 'package:todoApp/client/client_dio.dart';
import 'package:todoApp/models/photo.dart';
import 'package:todoApp/models/todos.dart';
import 'package:todoApp/models/users.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/models/albums.dart';

import 'repository_i.dart';

class Repository implements RepositoryI {
  final CustomDio dio;
  Repository(this.dio);

  @override
  Future<List<TodoModel>> getTodos() async {
    Response res = await dio.instance.get('/todos');
    if (res.statusCode != 200) return null;

    return (res.data as List)
        .map((todos) => TodoModel.fromJson(todos))
        .toList();
  }

  @override
  Future<List<TodoModel>> getUsersTodos(int userId) async {
    Response res = await dio.instance.get('/users/$userId/todos');
    if (res.statusCode != 200) return null;

    return (res.data as List)
        .map((todos) => TodoModel.fromJson(todos))
        .toList();
  }

  @override
  Future<UserModel> getUserId(int id) async {
    Response res = await dio.instance.get('/users/$id');
    if (res.statusCode != 200) return null;

    return UserModel.fromJson(res.data);
  }

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

    return (res.data as List)
        .map((posts) => PostModel.fromJson(posts))
        .toList();
  }

  @override
  Future<List<AlbumModel>> getAlbums() async {
    Response res = await dio.instance.get('/albums');
    if (res.statusCode != 200) return null;

    return (res.data as List)
        .map((album) => AlbumModel.fromJson(album))
        .toList();
  }

  @override
  Future<List<PhotoModel>> getAlbumsPhoto(int id) async {
    Response res = await dio.instance.get('/albums/$id/photos');
    if (res.statusCode != 200) return null;

    return (res.data as List)
        .map((photos) => PhotoModel.fromJson(photos))
        .toList();
  }
}
