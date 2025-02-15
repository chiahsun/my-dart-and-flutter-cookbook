

import 'package:flutter/material.dart';
import 'package:infinite_test/posts/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  
  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.bodySmall),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}