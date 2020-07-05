import 'package:todoApp/models/albums.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/models/users.dart';

abstract class RepositoryI {
  Future<List<PostModel>> getPosts();
  Future<List<UserModel>> getUsers();
  Future<List<AlbumModel>> getAlbums(int id);
}
