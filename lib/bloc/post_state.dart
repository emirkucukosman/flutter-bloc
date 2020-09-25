import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/models/models.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [throw UnimplementedError()];
}

class PostsEmpty extends PostState {}
class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<Post> postList;

  const PostsLoaded({ @required this.postList }) : assert(postList != null);

  @override
  List<Object> get props => postList;
}

class PostsError extends PostState {}