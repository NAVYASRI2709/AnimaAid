import 'package:flutter/material.dart';

class DonationsPage extends StatelessWidget {
  const DonationsPage({super.key});

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Donation backend coming soon'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Support Animal Rescue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Your donation helps rescue, treat, and care for animals in need.',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _showComingSoon(context),
              child: const Text('Donate ₹250'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon(context),
              child: const Text('Donate ₹500'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon(context),
              child: const Text('Donate ₹1000'),
            ),
          ],
        ),
      ),
    );
  }
}