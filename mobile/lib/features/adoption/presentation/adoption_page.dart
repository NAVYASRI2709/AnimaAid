import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdoptionPage extends StatefulWidget {
  const AdoptionPage({super.key});

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _animals = [
    {
      'name': 'Buddy',
      'details': 'Friendly dog • 2 years old',
    },
    {
      'name': 'Luna',
      'details': 'Playful cat • 1 year old',
    },
    {
      'name': 'Max',
      'details': 'Gentle dog • 3 years old',
    },
  ];

  final Set<String> _favoriteAnimals = {};
  String _searchQuery = '';
  String? _selectedType;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterSheet() {
  showModalBottomSheet<void>(
    context: context,
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All animals'),
              onTap: () {
                setState(() {
                  _selectedType = null;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Dogs'),
              onTap: () {
                setState(() {
                  _selectedType = 'dog';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Cats'),
              onTap: () {
                setState(() {
                  _selectedType = 'cat';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final filteredAnimals = _animals.where((animal) {
        final name = animal['name']!.toLowerCase();
        final details = animal['details']!.toLowerCase();
        final query = _searchQuery.toLowerCase();

        final matchesSearch =
      name.contains(query) || details.contains(query);

        final matchesType = _selectedType == null ||
      details.contains(_selectedType!);

        return matchesSearch && matchesType;
    }).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find a Companion',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Give an animal a loving home and a second chance.',
              style: Theme.of(context).textTheme.bodyMedium,
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
                hintText: 'Search animals...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: _showFilterSheet,
                  icon: const Icon(Icons.tune),
                  tooltip: 'Filter',
                ),
              ),
            ),
            const SizedBox(height: 28),
            Text(
              'Featured Animals',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            if (filteredAnimals.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text('No animals found.'),
                ),
              )
            else
              ...filteredAnimals.map(
                (animal) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _buildAnimalCard(
                    context,
                    name: animal['name']!,
                    details: animal['details']!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalCard(
    BuildContext context, {
    required String name,
    required String details,
  }) {
    final isFavorite = _favoriteAnimals.contains(name);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 36,
              child: Icon(
                Icons.pets,
                size: 34,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(details),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () => context.go('/animal-profile'),
                    child: const Text('View Profile'),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (isFavorite) {
                    _favoriteAnimals.remove(name);
                  } else {
                    _favoriteAnimals.add(name);
                  }
                });
              },
              icon: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              tooltip: isFavorite
                  ? 'Remove from favorites'
                  : 'Add to favorites',
            ),
          ],
        ),
      ),
    );
  }
}