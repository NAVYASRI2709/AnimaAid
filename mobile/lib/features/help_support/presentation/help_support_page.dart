import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Frequently Asked Questions'),
              subtitle: const Text(
                'Find answers to common AnimaAid questions',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showMessage(
                  context,
                  'FAQ section will be connected later.',
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.report_problem_outlined),
              title: const Text('Report a Problem'),
              subtitle: const Text(
                'Tell us about an issue with the app',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showMessage(
                  context,
                  'Problem reporting will be connected later.',
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.support_agent_outlined),
              title: const Text('Contact Support'),
              subtitle: const Text(
                'Get help from the AnimaAid support team',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showMessage(
                  context,
                  'Support contact will be connected later.',
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.feedback_outlined),
              title: const Text('Send Feedback'),
              subtitle: const Text(
                'Share your suggestions with AnimaAid',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                _showMessage(
                  context,
                  'Feedback submission will be connected later.',
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'AnimaAid Support',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'We are here to help make animal rescue easier.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}