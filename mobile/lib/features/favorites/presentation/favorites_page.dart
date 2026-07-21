import 'package:flutter/material.dart';

import '../../../core/services/favorites_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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

  @override
  void initState() {
    super.initState();
    FavoritesService.instance.favorites.addListener(
      _onFavoritesChanged,
    );
  }

  @override
  void dispose() {
    FavoritesService.instance.favorites.removeListener(
      _onFavoritesChanged,
    );
    super.dispose();
  }

  void _onFavoritesChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteAnimals = _animals.where((animal) {
      final name = animal['name']!;
      return FavoritesService.instance.isFavorite(name);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: favoriteAnimals.isEmpty
          ? _buildEmptyState(context)
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteAnimals.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final animal = favoriteAnimals[index];

                return _buildFavoriteCard(
                  context,
                  name: animal['name']!,
                  details: animal['details']!,
                );
              },
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'No Favorite Animals Yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Animals you favorite from the Adoption page will appear here.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(
    BuildContext context, {
    required String name,
    required String details,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          radius: 30,
          child: Icon(
            Icons.pets,
            size: 28,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(details),
        ),
        trailing: IconButton(
          onPressed: () {
            FavoritesService.instance.removeFavorite(name);
          },
          icon: const Icon(Icons.favorite),
          tooltip: 'Remove from favorites',
        ),
      ),
    );
  }
}