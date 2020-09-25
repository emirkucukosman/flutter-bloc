import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/models.dart';

class PostApiClient {
  final _apiUrl = "https://jsonplaceholder.typicode.com/posts";
  final http.Client httpClient;

  const PostApiClient({ @required this.httpClient })
    : assert(httpClient != null);

  Future<List<Post>> fetchPosts() async {
    final response = await this.httpClient.get(_apiUrl);

    if (response.statusCode != 200) {
      throw new Exception("error");
    }

    final List parsedList = jsonDecode(response.body);
    List<Post> postList = parsedList.map((e) => Post.fromJson(e)).toList();
    return postList;
  }
}