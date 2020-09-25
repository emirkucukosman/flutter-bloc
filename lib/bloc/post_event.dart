import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class FetchPosts extends PostEvent {
  const FetchPosts();

  @override
  List<Object> get props => [];
}