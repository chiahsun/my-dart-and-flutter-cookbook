import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_test/posts/bloc/post_bloc.dart';
import 'package:infinite_test/posts/models/post.dart';
import 'package:infinite_test/posts/view/posts_list.dart';
import 'package:infinite_test/posts/widgets/bottom_loader.dart';
import 'package:infinite_test/posts/widgets/post_list_item.dart';
import 'package:mocktail/mocktail.dart';

class MockPostsBloc extends MockBloc<PostEvent, PostState>
    implements PostBloc {}

extension on WidgetTester {
  Future<void> pumpPostsList(PostBloc postBloc) {
    return pumpWidget(MaterialApp(
      home: BlocProvider.value(
        value: postBloc,
        child:
            Scaffold(body: const PostsList()), // Need to be wrapped in Scaffold
      ),
    ));
  }
}

List<Post> generatePosts(int count) {
  return List.generate(
      count, (index) => Post(id: index, title: 'title$index', body: 'body$index'));
}

void main() {
  final mockPosts = generatePosts(5);

  late PostBloc postBloc;

  group('PostsList', () {
    setUp(() {
      postBloc = MockPostsBloc();
    });

    testWidgets('Render CircularProgressIndicator when the status is initial',
        (tester) async {
      when(() => postBloc.state).thenReturn(const PostState());
      await tester.pumpPostsList(postBloc);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Render no posts when there is 0 posts', (tester) async {
      when(() => postBloc.state)
          .thenReturn(const PostState(status: PostStatus.success, posts: []));
      await tester.pumpPostsList(postBloc);
      expect(find.text(postListsNoPost), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets(
        'Render ListView with 5 items and a bottom loader when post max is not reached yet',
        (tester) async {
      when(() => postBloc.state)
          .thenReturn(PostState(status: PostStatus.success, posts: mockPosts));
      await tester.pumpPostsList(postBloc);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(mockPosts.length));
      expect(find.byType(PostListItem), findsNWidgets(mockPosts.length));
      expect(find.byType(BottomLoader), findsOneWidget);
    });

    testWidgets(
        'Render ListView with 5 items and no bottom loader when post max is reached',
        (tester) async {
      when(() => postBloc.state).thenReturn(PostState(
          status: PostStatus.success, posts: mockPosts, hasReachedMax: true));
      await tester.pumpPostsList(postBloc);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(mockPosts.length));
      expect(find.byType(PostListItem), findsNWidgets(mockPosts.length));
      expect(find.byType(BottomLoader), findsNothing);
    });
   
    testWidgets('Fetch more posts when scrolled to the bottom', (tester) async {
      const numPosts = 10;
      when(() => postBloc.state).thenReturn(PostState(
          status: PostStatus.success, posts: generatePosts(numPosts), hasReachedMax: false));
      await tester.pumpPostsList(postBloc);
      await tester.drag(find.byType(ListView), const Offset(0, numPosts * (-50)));
      verify(() => postBloc.add(FetchPost())).called(1);
    });

    testWidgets('Render Center with text when the status is failure',
        (tester) async {
      when(() => postBloc.state)
          .thenReturn(const PostState(status: PostStatus.failure));
      await tester.pumpPostsList(postBloc);
      expect(find.byType(Center), findsOneWidget);
      expect(find.text(postListsFailedToFetch), findsOneWidget);
    });
  });
}
