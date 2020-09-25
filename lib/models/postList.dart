import 'package:equatable/equatable.dart';
import 'package:test_app/models/models.dart';

class PostList extends Equatable {
  final List<Post> postList;

  const PostList({ this.postList });

  @override
  List<Object> get props => postList;

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> postList = parsedJson.map((e) => Post.fromJson(e)).toList();
    return PostList(postList: postList);
  }
}