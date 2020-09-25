import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/bloc/post_bloc.dart';
import 'package:test_app/repositories/post_api_client.dart';
import 'package:test_app/repositories/repository.dart';
import 'package:test_app/views/home_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final PostRepository repository = PostRepository(
    postApiClient: PostApiClient(
      httpClient: http.Client()
    )
  );

  runApp(MyApp(
    repository: repository,
  ));
}

class MyApp extends StatelessWidget { 
  final PostRepository repository;

  MyApp({ Key key, @required this.repository })
    : assert(repository != null), super(key : key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts App"),
        ),
        body: BlocProvider(
          create: (context) => PostBloc(repository: repository),
          child: HomePage(),
        ),
      )
    );
  }
}