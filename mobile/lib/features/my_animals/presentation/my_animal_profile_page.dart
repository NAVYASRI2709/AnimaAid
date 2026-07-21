import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAnimalProfilePage extends StatelessWidget {
  const MyAnimalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddy'),
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
                    'Buddy',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  const Text('Dog • Golden Retriever'),
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
                const ListTile(
                  leading: Icon(Icons.pets_outlined),
                  title: Text('Species'),
                  trailing: Text('Dog'),
                ),
                const ListTile(
                  leading: Icon(Icons.category_outlined),
                  title: Text('Breed'),
                  trailing: Text('Golden Retriever'),
                ),
                const ListTile(
                  leading: Icon(Icons.monitor_weight_outlined),
                  title: Text('Weight'),
                  trailing: Text('12 kg'),
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
              onTap: () => context.go('/my-animal-health'),
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