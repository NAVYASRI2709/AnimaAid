import 'package:flutter/material.dart';

class HealthRecordsPage extends StatelessWidget {
  const HealthRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Records'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.health_and_safety_outlined),
                ),
                title: const Text('Overall Health'),
                subtitle: const Text('Health status information'),
                trailing: const Icon(Icons.check_circle_outline),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Vaccinations',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.vaccines_outlined),
                title: const Text('Vaccination Records'),
                subtitle: const Text(
                  'No vaccination records available yet.',
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Medical History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'No medical history recorded yet.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}