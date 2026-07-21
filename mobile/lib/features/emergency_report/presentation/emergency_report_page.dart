import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';


class EmergencyReportPage extends StatefulWidget {
  const EmergencyReportPage({super.key});

  @override
  State<EmergencyReportPage> createState() => _EmergencyReportPageState();
}

class _EmergencyReportPageState extends State<EmergencyReportPage> {
  final _formKey = GlobalKey<FormState>();

  final _descriptionController = TextEditingController();
  final _contactController = TextEditingController();

  LatLng? _selectedRescueLocation;

  String? _selectedAnimalType;
  String? _selectedSeverity;
  bool _isEmergency = true;

  final List<String> _animalTypes = [
    'Dog',
    'Cat',
    'Bird',
    'Cow',
    'Other',
  ];

  final List<String> _severityLevels = [
    'Low',
    'Moderate',
    'Severe',
    'Critical',
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _submitReport() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedAnimalType == null || _selectedSeverity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select the animal type and severity.',
          ),
        ),
      );
      return;
    }

    if (_selectedRescueLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select the rescue location on the map.',
          ),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Submit Rescue Request?'),
          content: const Text(
            'Please confirm that the information provided is correct before submitting this rescue request.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Review'),
            ),
            FilledButton(
              onPressed: () {
  Navigator.pop(dialogContext);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Rescue request submitted successfully.',
      ),
    ),
  );

  context.go('/rescue-tracking');
},
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Rescue'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildImagePlaceholder(context),
                const SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  initialValue: _selectedAnimalType,
                  decoration: const InputDecoration(
                    labelText: 'Animal Type',
                    prefixIcon: Icon(Icons.pets_outlined),
                    border: OutlineInputBorder(),
                  ),
                  items: _animalTypes
                      .map(
                        (animal) => DropdownMenuItem<String>(
                          value: animal,
                          child: Text(animal),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedAnimalType = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _selectedSeverity,
                  decoration: const InputDecoration(
                    labelText: 'Severity',
                    prefixIcon: Icon(Icons.warning_amber_rounded),
                    border: OutlineInputBorder(),
                  ),
                  items: _severityLevels
                      .map(
                        (severity) => DropdownMenuItem<String>(
                          value: severity,
                          child: Text(severity),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSeverity = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Describe the situation',
                    hintText: 'Tell us what happened...',
                    prefixIcon: Icon(Icons.description_outlined),
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please describe the situation.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildLocationSelector(context),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a contact number.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Emergency Situation'),
                  subtitle: const Text(
                    'Mark this request as requiring urgent assistance.',
                  ),
                  value: _isEmergency,
                  onChanged: (value) {
                    setState(() {
                      _isEmergency = value;
                    });
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _submitReport,
                    icon: const Icon(Icons.emergency_outlined),
                    label: const Text('Submit Rescue Request'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationSelector(BuildContext context) {
    final location = _selectedRescueLocation;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.location_on_outlined),
        title: Text(
          location == null
              ? 'Select Rescue Location'
              : 'Rescue Location Selected',
        ),
        subtitle: Text(
          location == null
              ? 'Choose the exact location on the map.'
              : '${location.latitude.toStringAsFixed(4)}, '
                  '${location.longitude.toStringAsFixed(4)}',
        ),
        trailing: const Icon(Icons.map_outlined),
        onTap: () async {
          final selectedLocation = await context.push<LatLng>(
            '/rescue-location',
          );

          if (selectedLocation != null) {
            setState(() {
              _selectedRescueLocation = selectedLocation;
            });
          }
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Report an Animal Emergency',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Provide the details below so rescue volunteers can understand the situation and respond appropriately.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildImagePlaceholder(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Image picker will be connected when storage is added.',
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_a_photo_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              const Text('Add Animal Image'),
              const SizedBox(height: 4),
              Text(
                'Optional',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
