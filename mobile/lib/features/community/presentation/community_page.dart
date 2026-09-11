import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'community_post_details_page.dart';
import 'create_post_page.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _posts = [
    {
      'name': 'Animal Lover',
      'time': '2 hours ago',
      'title': 'Helped a stray dog today',
      'content':
          'Found a stray dog that needed help and connected it with a nearby rescue volunteer.',
      'category': 'Rescue',
      'icon': Icons.pets,
      'likes': 12,
      'liked': false,
    },
    {
      'name': 'Rescue Volunteer',
      'time': '5 hours ago',
      'title': 'Animal welfare awareness',
      'content':
          'Sharing information about responsible animal care and how we can help animals in our communities.',
      'category': 'Welfare',
      'icon': Icons.volunteer_activism,
      'likes': 8,
      'liked': false,
    },
    {
      'name': 'Pet Parent',
      'time': 'Yesterday',
      'title': 'Vaccination reminder',
      'content':
          'Regular vaccinations are an important part of keeping our animals healthy.',
      'category': 'Health',
      'icon': Icons.health_and_safety,
      'likes': 15,
      'liked': false,
    },
    {
      'name': 'Animal Friend',
      'time': 'Yesterday',
      'title': 'Looking for adoption advice',
      'content':
          'I am preparing to adopt an animal and would love to learn from other pet parents about the experience.',
      'category': 'Adoption',
      'icon': Icons.favorite,
      'likes': 6,
      'liked': false,
    },
  ];

  final List<String> _categories = [
    'All',
    'Rescue',
    'Adoption',
    'Health',
    'Welfare',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleLike(int index) {
    setState(() {
      final post = _posts[index];

      if (post['liked'] == true) {
        post['likes'] = (post['likes'] as int) - 1;
        post['liked'] = false;
      } else {
        post['likes'] = (post['likes'] as int) + 1;
        post['liked'] = true;
      }
    });
  }

  void _openPost(Map<String, dynamic> post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommunityPostDetailsPage(
          postTitle: post['title'] as String,
          postContent: post['content'] as String,
          authorName: post['name'] as String,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPosts = _posts.where((post) {
      final query = _searchQuery.toLowerCase();

      final matchesSearch =
          (post['title'] as String).toLowerCase().contains(query) ||
          (post['content'] as String).toLowerCase().contains(query) ||
          (post['name'] as String).toLowerCase().contains(query);

      final matchesCategory =
          _selectedCategory == 'All' ||
          post['category'] == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          // Shared Community Live Chat
          IconButton(
            onPressed: () {
              context.push('/chat');
            },
            tooltip: 'Live Chat',
            icon: const Icon(Icons.chat_outlined),
          ),

          // Community Search
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: _CommunitySearchDelegate(_posts),
              );
            },
            tooltip: 'Search',
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animal Welfare Community',
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Connect with people who care about animals, share helpful information, and support animal welfare.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreatePostPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Create a Post'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search community posts...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchQuery = '';
                        });
                      },
                      icon: const Icon(Icons.clear),
                    ),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final selected = _selectedCategory == category;

                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Community Posts',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 12),

          if (filteredPosts.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    'No community posts found.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          else
            ...filteredPosts.map((post) {
              final originalIndex = _posts.indexOf(post);

              return _postCard(
                context,
                post: post,
                index: originalIndex,
              );
            }),
        ],
      ),
    );
  }

  Widget _postCard(
    BuildContext context, {
    required Map<String, dynamic> post,
    required int index,
  }) {
    final liked = post['liked'] as bool;
    final likes = post['likes'] as int;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _openPost(post),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Icon(post['icon'] as IconData),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post['name'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          post['time'] as String,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Chip(
                    label: Text(post['category'] as String),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Text(
                post['title'] as String,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 6),

              Text(post['content'] as String),

              const SizedBox(height: 14),

              const Divider(),

              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => _toggleLike(index),
                    icon: Icon(
                      liked ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: Text('$likes'),
                  ),
                  TextButton.icon(
                    onPressed: () => _openPost(post),
                    icon: const Icon(Icons.comment_outlined),
                    label: const Text('Comment'),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sharing will be connected later.',
                          ),
                        ),
                      );
                    },
                    tooltip: 'Share',
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommunitySearchDelegate extends SearchDelegate<String> {
  _CommunitySearchDelegate(this.posts);

  final List<Map<String, dynamic>> posts;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = posts.where((post) {
      final search = query.toLowerCase();

      return (post['title'] as String).toLowerCase().contains(search) ||
          (post['content'] as String).toLowerCase().contains(search) ||
          (post['name'] as String).toLowerCase().contains(search);
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text('No posts found.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final post = results[index];

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(post['icon'] as IconData),
            ),
            title: Text(post['title'] as String),
            subtitle: Text(post['name'] as String),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunityPostDetailsPage(
                    postTitle: post['title'] as String,
                    postContent: post['content'] as String,
                    authorName: post['name'] as String,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}