```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../adoption/presentation/adoption_application_page.dart';

class AnimalProfilePage extends StatelessWidget {
  const AnimalProfilePage({
    super.key,
    this.name = 'Buddy',
  });

  final String name;

  static const Map<String, Map<String, String>> animalData = {
    'Buddy': {
      'breed': 'Golden Retriever',
      'age': '2 years old',
      'description':
          'A friendly and playful companion who loves spending time with people.',
    },
    'Luna': {
      'breed': 'Indie Dog',
      'age': '1 year old',
      'description':
          'An energetic and loving dog who enjoys exploring and playing outdoors.',
    },
    'Max': {
      'breed': 'Gentle Dog',
      'age': '3 years old',
      'description':
          'A calm and affectionate dog who enjoys peaceful environments and attention.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final animal = animalData[name] ?? animalData['Buddy']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 64,
                child: const Icon(
                  Icons.pets,
                  size: 56,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                '${animal['breed']} • ${animal['age']}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            const SizedBox(height: 28),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About $name',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text(animal['description']!),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.medical_information_outlined,
                ),
                title: const Text('Health Records'),
                subtitle: const Text(
                  'View vaccinations and medical history',
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
                onTap: () => context.go('/health-records'),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdoptionApplicationPage(
                        animalName: name,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite_outline,
                ),
                label: const Text(
                  'Apply for Adoption',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```