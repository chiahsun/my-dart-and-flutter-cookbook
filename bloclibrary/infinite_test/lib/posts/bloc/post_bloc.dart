import 'dart:convert'; // For json

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_test/posts/models/post.dart';

import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<FetchPost>(_onFetched);
  }

  Future<void> _onFetched(FetchPost event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts(startIndex: state.posts.length, );

        if (posts.isEmpty) return emit(state.copyWith(hasReachedMax: true));

        emit(state.copyWith(
          status: PostStatus.success,
          posts: [...state.posts, ...posts,],
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts({required int startIndex, }) async {
    final response = await httpClient.get(Uri.https('jsonplaceholder.typicode.com', 'posts', <String, String>{
      '_start': '$startIndex',
      '_limit': '$_postLimit',
    }));


    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}