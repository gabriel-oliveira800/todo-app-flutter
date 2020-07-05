import 'package:todoApp/models/users.dart';
import 'package:todoApp/models/posts.dart';
import 'package:todoApp/models/albums.dart';

import 'repository_i.dart';

class Repository implements RepositoryI {
  @override
  Future<List<PostModel>> getPosts() {
    return null;
  }

  @override
  Future<List<UserModel>> getUsers() {
    return null;
  }

  @override
  Future<List<AlbumModel>> getAlbums(int id) {
    return null;
  }
}
