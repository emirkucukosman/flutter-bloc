import 'package:meta/meta.dart';
import 'package:test_app/models/models.dart';
import 'package:test_app/repositories/post_api_client.dart';

class PostRepository {
  final PostApiClient postApiClient;

  const PostRepository({ @required this.postApiClient }) : assert(postApiClient != null);

  Future<List<Post>> fetchPosts() async {
    return await this.postApiClient.fetchPosts();
  }
}