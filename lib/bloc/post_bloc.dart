import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/bloc/bloc.dart';
import 'package:test_app/models/models.dart';
import 'package:test_app/repositories/repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc({ @required this.repository }) : assert(repository != null);

  @override
  PostState get initialState => PostsEmpty();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPosts) {
      yield PostsLoading();
      try {
        final List<Post> postList = await this.repository.fetchPosts();
        yield PostsLoaded(postList: postList);
      } catch (_) {
        yield PostsError();
      }
    }
  }
}