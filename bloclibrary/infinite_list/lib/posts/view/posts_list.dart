import 'package:flutter/material.dart';
import 'package:infinite_list/posts/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/posts/widgets/bottom_loader.dart';
import 'package:infinite_list/posts/widgets/post_list_item.dart'; // For context.read<PostBloc>()


const postListsNoPost = 'No posts';
const postListsFailedToFetch = 'Failed to fetch posts';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(builder: (context, state){
      switch (state.status) {
        case PostStatus.failure:
          return const Center(child: Text(postListsFailedToFetch));
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return const Center(child: Text(postListsNoPost));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                ? BottomLoader()
                : PostListItem(post: state.posts[index]);
            },
            itemCount: state.hasReachedMax
              ? state.posts.length
              : state.posts.length + 1,
            controller: _scrollController,
          );
        case PostStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PostBloc>().add(FetchPost());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
