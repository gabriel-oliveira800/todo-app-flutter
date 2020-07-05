import 'package:todoApp/models/albums.dart';
import 'package:todoApp/models/photo.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/models/todos.dart';
import 'package:todoApp/models/users.dart';

abstract class RepositoryI {
  Future<List<TodoModel>> getTodos();
  Future<List<PostModel>> getPosts();

  Future<List<UserModel>> getUsers();
  Future<List<TodoModel>> getUsersTodos(int userId);
  Future<UserModel> getUserId(int id);

  Future<Photo> getAlbumsPhoto(int id);
  Future<List<AlbumModel>> getAlbums();
}
