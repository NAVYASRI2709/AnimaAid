import 'package:flutter/material.dart';

class HealthRecordsPage extends StatefulWidget {
  const HealthRecordsPage({super.key});

  @override
  State<HealthRecordsPage> createState() => _HealthRecordsPageState();
}

class _HealthRecordsPageState extends State<HealthRecordsPage> {
  final List<String> _vaccinations = [];
  final List<String> _medicalHistory = [];

  String _healthStatus = 'Healthy';

  void _addVaccination() {
    setState(() {
      _vaccinations.add('Vaccination record ${_vaccinations.length + 1}');
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Vaccination record added.'),
      ),
    );
  }

  void _addMedicalRecord() {
    setState(() {
      _medicalHistory.add(
        'Medical record ${_medicalHistory.length + 1}',
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Medical record added.'),
      ),
    );
  }

  void _updateHealthStatus() {
    setState(() {
      _healthStatus = _healthStatus == 'Healthy'
          ? 'Needs Attention'
          : 'Healthy';
    });
  }

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
                subtitle: Text('Current status: $_healthStatus'),
                trailing: IconButton(
                  onPressed: _updateHealthStatus,
                  icon: Icon(
                    _healthStatus == 'Healthy'
                        ? Icons.check_circle_outline
                        : Icons.warning_amber_outlined,
                  ),
                  tooltip: 'Update health status',
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vaccinations',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: _addVaccination,
                  icon: const Icon(Icons.add),
                  tooltip: 'Add vaccination',
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_vaccinations.isEmpty)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.vaccines_outlined),
                  title: const Text('Vaccination Records'),
                  subtitle: const Text(
                    'No vaccination records available yet.',
                  ),
                ),
              )
            else
              ..._vaccinations.map(
                (vaccination) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.vaccines_outlined),
                    title: Text(vaccination),
                    trailing: const Icon(
                      Icons.check_circle_outline,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Medical History',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: _addMedicalRecord,
                  icon: const Icon(Icons.add),
                  tooltip: 'Add medical record',
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_medicalHistory.isEmpty)
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
              )
            else
              ..._medicalHistory.map(
                (record) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.medical_information_outlined,
                    ),
                    title: Text(record),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}