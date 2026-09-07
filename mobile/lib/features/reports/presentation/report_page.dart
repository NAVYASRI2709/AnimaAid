```dart
import 'package:flutter/material.dart';

import 'found_pet_report_page.dart';
import 'missing_pet_report_page.dart';
import 'welfare_report_page.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report an Issue'),
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
                    Icons.report_problem_outlined,
                    size: 42,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'How can we help?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose the type of issue you want to report.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          _reportOption(
            context,
            icon: Icons.pets_outlined,
            title: 'Missing Pet',
            subtitle: 'Report an animal that is missing',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MissingPetReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.pets,
            title: 'Found Pet',
            subtitle: 'Report an animal you have found',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FoundPetReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.warning_amber_outlined,
            title: 'Animal Welfare Issue',
            subtitle: 'Report neglect, abuse or other welfare concerns',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelfareReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.person_outline,
            title: 'Report a Person',
            subtitle: 'Report behaviour that may harm animals',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelfareReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.local_hospital_outlined,
            title: 'Report a Veterinary Service',
            subtitle: 'Report a concern about a veterinary service',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelfareReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.home_work_outlined,
            title: 'Report a Shelter',
            subtitle: 'Report a concern about an animal shelter',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelfareReportPage(),
                ),
              );
            },
          ),

          _reportOption(
            context,
            icon: Icons.more_horiz,
            title: 'Other Issue',
            subtitle: 'Report another animal welfare related issue',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WelfareReportPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _reportOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
```
