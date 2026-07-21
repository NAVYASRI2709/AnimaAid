import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAnimalsPage extends StatefulWidget {
  const MyAnimalsPage({super.key});

  @override
  State<MyAnimalsPage> createState() => _MyAnimalsPageState();
}

class _MyAnimalsPageState extends State<MyAnimalsPage> {
  final List<Map<String, String>> _animals = [
    {
      'name': 'Buddy',
      'species': 'Dog',
      'breed': 'Golden Retriever',
    },
    {
      'name': 'Luna',
      'species': 'Cat',
      'breed': 'Domestic Shorthair',
    },
    {
      'name': 'Radha',
      'species': 'Calf',
      'breed': 'Cow',
    },
  ];

  void _openAnimalProfile(Map<String, String> animal) {
    final name = Uri.encodeComponent(animal['name']!);
    final species = Uri.encodeComponent(animal['species']!);
    final breed = Uri.encodeComponent(animal['breed']!);

    context.go(
      '/my-animal-profile'
      '?name=$name'
      '&species=$species'
      '&breed=$breed',
    );
  }

  void _showAddAnimalDialog() {
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
                final name = nameController.text.trim();
                final species = speciesController.text.trim();
                final breed = breedController.text.trim();

                if (name.isEmpty ||
                    species.isEmpty ||
                    breed.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please complete all animal details.',
                      ),
                    ),
                  );
                  return;
                }

                setState(() {
                  _animals.add({
                    'name': name,
                    'species': species,
                    'breed': breed,
                  });
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$name added to My Animals.'),
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

          ..._animals.map(
            (animal) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildAnimalCard(
                animal: animal,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: InkWell(
              onTap: _showAddAnimalDialog,
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

  Widget _buildAnimalCard({
    required Map<String, String> animal,
  }) {
    final name = animal['name']!;
    final species = animal['species']!;
    final breed = animal['breed']!;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          radius: 28,
          child: Icon(
            Icons.pets,
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
          child: Text('$species • $breed'),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => _openAnimalProfile(animal),
      ),
    );
  }
}