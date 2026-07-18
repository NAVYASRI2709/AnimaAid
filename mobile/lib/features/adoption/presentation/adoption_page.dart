import 'package:flutter/material.dart';

class AdoptionPage extends StatelessWidget {
  const AdoptionPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                hintText: 'Search animals...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () {},
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
            _buildAnimalCard(
              context,
              name: 'Buddy',
              details: 'Friendly dog • 2 years old',
            ),
            const SizedBox(height: 14),
            _buildAnimalCard(
              context,
              name: 'Luna',
              details: 'Playful cat • 1 year old',
            ),
            const SizedBox(height: 14),
            _buildAnimalCard(
              context,
              name: 'Max',
              details: 'Gentle dog • 3 years old',
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
                    onPressed: () {},
                    child: const Text('View Profile'),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
              tooltip: 'Add to favorites',
            ),
          ],
        ),
      ),
    );
  }
}