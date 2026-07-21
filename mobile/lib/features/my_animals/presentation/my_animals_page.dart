import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAnimalsPage extends StatelessWidget {
  const MyAnimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Animals'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Your animal companions',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage your animals and keep their care information organized.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          _buildAnimalCard(
            context,
            name: 'Buddy',
            details: 'Dog • Golden Retriever',
            icon: Icons.pets,
          ),
          const SizedBox(height: 12),

          _buildAnimalCard(
            context,
            name: 'Luna',
            details: 'Cat • Domestic Shorthair',
            icon: Icons.pets_outlined,
          ),
          const SizedBox(height: 12),

          _buildAnimalCard(
            context,
            name: 'Radha',
            details: 'Calf • Cow',
            icon: Icons.agriculture_outlined,
          ),
          const SizedBox(height: 24),

          Card(
            child: InkWell(
              onTap: () {
                _showAddAnimalDialog(context);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add an Animal',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Create a profile for your animal companion.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalCard(
    BuildContext context, {
    required String name,
    required String details,
    required IconData icon,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          child: Icon(
            icon,
            size: 30,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(details),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go('/my-animal-profile'),
      ),
    );
  }

  void _showAddAnimalDialog(BuildContext context) {
    final nameController = TextEditingController();
    final speciesController = TextEditingController();
    final breedController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add an Animal'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Animal Name',
                    hintText: 'e.g. Bruno',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: speciesController,
                  decoration: const InputDecoration(
                    labelText: 'Species',
                    hintText: 'e.g. Dog',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: breedController,
                  decoration: const InputDecoration(
                    labelText: 'Breed',
                    hintText: 'e.g. Golden Retriever',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Animal profile will be saved when backend storage is connected.',
                    ),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}