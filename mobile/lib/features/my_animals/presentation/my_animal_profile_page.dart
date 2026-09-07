import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAnimalProfilePage extends StatelessWidget {
  const MyAnimalProfilePage({
    required this.name,
    required this.species,
    required this.breed,
    super.key,
  });

  final String name;
  final String species;
  final String breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    child: Icon(
                      Icons.pets,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    name,
                    style:
                        Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  const SizedBox(height: 6),
                  Text('$species • $breed'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Basic Information',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.pets_outlined),
                  title: const Text('Species'),
                  trailing: Text(species),
                ),
                ListTile(
                  leading: const Icon(Icons.category_outlined),
                  title: const Text('Breed'),
                  trailing: Text(breed),
                ),
                const ListTile(
                  leading: Icon(Icons.monitor_weight_outlined),
                  title: Text('Weight'),
                  trailing: Text('Not added'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.health_and_safety_outlined),
              ),
              title: const Text(
                'Health Records',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'View vaccinations and medical history',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/health-records'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.smart_toy_outlined),
              ),
              title: const Text(
                'Ask Dr. Paws AI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                'Get general guidance for your animal companion',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go('/ai-assistant'),
            ),
          ),
        ],
      ),
    );
  }
}