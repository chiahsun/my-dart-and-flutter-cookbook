import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_test/posts/bloc/post_bloc.dart';
import 'package:infinite_test/posts/models/post.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('PostBloc', () {
    late http.Client httpClient;

    final mockPosts = List.generate(20,
        (index) => Post(id: index, title: 'title$index', body: 'body$index'));

    // Bad state: A test tried to use `any` or `captureAny` on a parameter of type `Uri`, but
    // registerFallbackValue was not previously called to register a fallback value for `Uri`.
    // To use any or captureAny on a parameter of type `Uri`, call registerFallbackValue(Uri).
    setUpAll((){
      registerFallbackValue(Uri());
    });

    setUp(() {
      httpClient = MockHttpClient();
    });

    test('Initial state', () {
      final postBloc = PostBloc(httpClient: httpClient);
      expect(postBloc.state, const PostState());
    });

    blocTest<PostBloc, PostState>(
      'emits nothing when maximum posts are reached',
      build: () => PostBloc(httpClient: httpClient),
      seed: () => const PostState(hasReachedMax: true),
      act: (bloc) => bloc.add(FetchPost()),
      expect: () => const <PostState>[],
    );

    blocTest<PostBloc, PostState>(
      'emits successfully when posts are fetched initially',
      setUp: () {
        when(() => httpClient.get(any()))
            .thenAnswer((_) async => http.Response('''
          [
            ${mockPosts.map((post) => '''
              {
                "id": ${post.id},
                "title": "${post.title}",
                "body": "${post.body}"
              }
            ''').join(',')}
          ]
        ''', 200));
      },
      build: () => PostBloc(httpClient: httpClient),
      act: (bloc) => bloc.add(FetchPost()),
      expect: () =>
          <PostState>[PostState(status: PostStatus.success, posts: mockPosts)],
    );
  });
}
