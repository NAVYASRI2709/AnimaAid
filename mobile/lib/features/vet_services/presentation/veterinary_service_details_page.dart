```dart
import 'package:flutter/material.dart';

class VeterinaryServiceDetailsPage extends StatelessWidget {
  const VeterinaryServiceDetailsPage({
    super.key,
    required this.serviceType,
  });

  final String serviceType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceType),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.local_hospital_outlined,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    serviceType,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Find veterinary services available near your location.',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Nearby Services',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _serviceLocationCard(
            context,
            name: 'City Veterinary Care',
            address: 'Nearby veterinary service',
            distance: '1.2 km',
          ),

          _serviceLocationCard(
            context,
            name: 'Animal Health Centre',
            address: 'Veterinary care and support',
            distance: '2.4 km',
          ),

          _serviceLocationCard(
            context,
            name: 'Pet Wellness Clinic',
            address: 'General veterinary services',
            distance: '3.1 km',
          ),
        ],
      ),
    );
  }

  Widget _serviceLocationCard(
    BuildContext context, {
    required String name,
    required String address,
    required String distance,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          child: Icon(Icons.local_hospital_outlined),
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text('$address\n$distance away'),
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
```
