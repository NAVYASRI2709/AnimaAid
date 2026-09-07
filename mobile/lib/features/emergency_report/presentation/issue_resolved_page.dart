```dart
import 'package:flutter/material.dart';

class IssueResolvedPage extends StatefulWidget {
  const IssueResolvedPage({
    super.key,
    this.caseId = '#ER-1024',
  });

  final String caseId;

  @override
  State<IssueResolvedPage> createState() => _IssueResolvedPageState();
}

class _IssueResolvedPageState extends State<IssueResolvedPage> {
  bool _confirmed = false;

  void _confirmResolution() {
    setState(() {
      _confirmed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rescue Resolution'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _confirmed
            ? _buildConfirmedView(context)
            : _buildConfirmationView(context),
      ),
    );
  }

  Widget _buildConfirmationView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Rescue Resolution',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Case ${widget.caseId}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const Icon(
                  Icons.verified_outlined,
                  size: 52,
                ),
                const SizedBox(height: 16),
                Text(
                  'Has this rescue issue been resolved?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Confirming helps AnimaAid keep the rescue case status accurate.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _confirmResolution,
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('Confirm Issue Resolved'),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmedView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 72,
          ),
          const SizedBox(height: 20),
          Text(
            'Issue Resolved',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Case ${widget.caseId} has been marked as resolved.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}
```
