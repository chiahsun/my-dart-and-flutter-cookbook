import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_test/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_test/posts/view/posts_list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(FetchPost()),
        child: const PostsList(),
      ),
    );
  }
}

