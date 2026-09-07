import 'package:flutter/material.dart';

class CommunityPostDetailsPage extends StatefulWidget {
  const CommunityPostDetailsPage({
    super.key,
    this.postTitle = 'Helped a stray dog today',
    this.postContent =
        'Found a stray dog that needed help and connected it with a nearby rescue volunteer.',
    this.authorName = 'Animal Lover',
  });

  final String postTitle;
  final String postContent;
  final String authorName;

  @override
  State<CommunityPostDetailsPage> createState() =>
      _CommunityPostDetailsPageState();
}

class _CommunityPostDetailsPageState
    extends State<CommunityPostDetailsPage> {
  final TextEditingController _commentController = TextEditingController();

  bool _isLiked = false;
  int _likeCount = 12;

  final List<Map<String, String>> _comments = [
    {
      'name': 'Rescue Volunteer',
      'comment': 'Thank you for helping the animal!'
    },
    {
      'name': 'Animal Lover',
      'comment': 'This is what the community is all about.'
    },
  ];

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount += _isLiked ? 1 : -1;
    });
  }

  void _addComment() {
    final comment = _commentController.text.trim();

    if (comment.isEmpty) {
      return;
    }

    setState(() {
      _comments.add({
        'name': 'You',
        'comment': comment,
      });
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Share',
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () {},
            tooltip: 'Report',
            icon: const Icon(Icons.flag_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person_outline),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Photo placeholder for future backend/image upload.
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          size: 52,
                        ),
                        SizedBox(height: 8),
                        Text('Post photo'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    widget.postTitle,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.postContent,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 18),

                  Row(
                    children: [
                      Text(
                        '$_likeCount likes',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${_comments.length} comments',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),

                  const Divider(height: 24),

                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: _toggleLike,
                          icon: Icon(
                            _isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          label: const Text('Like'),
                        ),
                      ),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {
                            FocusScope.of(context).requestFocus();
                          },
                          icon: const Icon(Icons.comment_outlined),
                          label: const Text('Comment'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Comments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ..._comments.map(
            (comment) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                title: Text(
                  comment['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(comment['comment']!),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _commentController,
                  maxLines: 3,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _addComment,
                tooltip: 'Post comment',
                icon: const Icon(Icons.send_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}