import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostsEmpty) {
          BlocProvider.of<PostBloc>(context).add(FetchPosts());
        }
        if (state is PostsError) {
          return Center(
            child: Text("ERROR"),
          );
        }
        if (state is PostsLoaded) {
          final posts = state.postList;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
                contentPadding: EdgeInsets.all(24),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}