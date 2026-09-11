import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController =
      TextEditingController();

  String _query = '';

  final List<Map<String, String>> _items = [
    {
      'title': 'Buddy',
      'type': 'Animal',
      'location': 'Chennai',
    },
    {
      'title': 'Animal Health Centre',
      'type': 'Veterinary Service',
      'location': 'Chennai',
    },
    {
      'title': 'City Animal Shelter',
      'type': 'Shelter',
      'location': 'Bangalore',
    },
    {
      'title': 'Luna',
      'type': 'Animal for Adoption',
      'location': 'Chennai',
    },
    {
      'title': 'Missing Dog Report',
      'type': 'Missing Pet',
      'location': 'Mumbai',
    },
    {
      'title': 'Community Rescue Support',
      'type': 'Community',
      'location': 'Chennai',
    },
  ];

  List<Map<String, String>> get _results {
    if (_query.trim().isEmpty) {
      return _items;
    }

    final query = _query.toLowerCase();

    return _items.where((item) {
      return item.values.any(
        (value) => value.toLowerCase().contains(query),
      );
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search AnimaAid'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search animals, shelters, services...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _query.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _query = '';
                        });
                      },
                    )
                  : null,
              border: const OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _query = value;
              });
            },
          ),

          const SizedBox(height: 20),

          if (_query.isEmpty)
            Text(
              'Explore AnimaAid',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )
          else
            Text(
              '${results.length} result${results.length == 1 ? '' : 's'}',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

          const SizedBox(height: 12),

          if (results.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 48,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'No results found.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Try searching for another animal, service, shelter, or report.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          else
            ...results.map(
              (item) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      _iconForType(item['type']!),
                    ),
                  ),
                  title: Text(item['title']!),
                  subtitle: Text(
                    '${item['type']} • ${item['location']}',
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${item['title']} details will be connected later.',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'Animal':
      case 'Animal for Adoption':
        return Icons.pets;
      case 'Veterinary Service':
        return Icons.local_hospital;
      case 'Shelter':
        return Icons.home_work;
      case 'Missing Pet':
        return Icons.search;
      case 'Community':
        return Icons.people;
      default:
        return Icons.search;
    }
  }
}