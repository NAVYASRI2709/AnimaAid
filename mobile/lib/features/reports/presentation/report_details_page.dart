```dart
import 'package:flutter/material.dart';

class ReportDetailsPage extends StatelessWidget {
  const ReportDetailsPage({
    super.key,
    this.reportType = 'Animal Welfare Issue',
  });

  final String reportType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Details'),
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
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        child: Icon(
                          Icons.report_problem_outlined,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Report #RP-2048',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text('Submitted recently'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    reportType,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your report has been received and will be reviewed by the AnimaAid team.',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Report Status',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _statusStep(
            title: 'Report Submitted',
            subtitle: 'Your report was successfully submitted.',
            icon: Icons.check_circle_outline,
            isCompleted: true,
          ),

          _statusStep(
            title: 'Under Review',
            subtitle: 'The report is being reviewed.',
            icon: Icons.rate_review_outlined,
            isCurrent: true,
          ),

          _statusStep(
            title: 'Action Taken',
            subtitle: 'Appropriate action will be taken when required.',
            icon: Icons.shield_outlined,
          ),

          _statusStep(
            title: 'Resolved',
            subtitle: 'The reported issue has been resolved.',
            icon: Icons.task_alt_outlined,
            showLine: false,
          ),

          const SizedBox(height: 20),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.notifications_none),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You will receive a notification when there is an important update to your report.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusStep({
    required String title,
    required String subtitle,
    required IconData icon,
    bool isCompleted = false,
    bool isCurrent = false,
    bool showLine = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            if (showLine)
              Container(
                width: 2,
                height: 50,
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isCompleted || isCurrent
                            ? FontWeight.bold
                            : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```
