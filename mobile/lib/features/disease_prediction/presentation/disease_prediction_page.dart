import 'package:flutter/material.dart';

class DiseasePredictionPage extends StatefulWidget {
  const DiseasePredictionPage({super.key});

  @override
  State<DiseasePredictionPage> createState() =>
      _DiseasePredictionPageState();
}

class _DiseasePredictionPageState
    extends State<DiseasePredictionPage> {
  final _formKey = GlobalKey<FormState>();

  final _symptomsController = TextEditingController();

  String? _selectedAnimalType;
  String? _selectedDuration;

  final List<String> _animalTypes = [
    'Dog',
    'Cat',
    'Bird',
    'Cow',
    'Other',
  ];

  final List<String> _durations = [
    'Less than 24 hours',
    '1–3 days',
    '4–7 days',
    'More than a week',
  ];

  @override
  void dispose() {
    _symptomsController.dispose();
    super.dispose();
  }

  void _analyzePossibleConditions() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedAnimalType == null ||
        _selectedDuration == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete all required details.',
          ),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'AI Health Analysis',
          ),
          content: const Text(
            'AI disease prediction guidance will be connected when the AI service is integrated. The system will provide possible health concerns for further veterinary evaluation.',
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('OK'),
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
        title: const Text(
          'Disease Prediction Guidance',
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Explore Possible Health Concerns',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Provide information about the animal and its symptoms to receive AI-assisted guidance about possible health concerns.',
            ),
            const SizedBox(height: 24),

            DropdownButtonFormField<String>(
              initialValue: _selectedAnimalType,
              decoration: const InputDecoration(
                labelText: 'Animal Type',
                prefixIcon: Icon(
                  Icons.pets_outlined,
                ),
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
              validator: (value) {
                if (value == null) {
                  return 'Please select an animal type.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _symptomsController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Observed Symptoms',
                hintText:
                    'Describe the symptoms or changes you have noticed...',
                prefixIcon: Icon(
                  Icons.medical_information_outlined,
                ),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Please describe the symptoms.';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _selectedDuration,
              decoration: const InputDecoration(
                labelText: 'How long has this been happening?',
                prefixIcon: Icon(
                  Icons.schedule_outlined,
                ),
                border: OutlineInputBorder(),
              ),
              items: _durations
                  .map(
                    (duration) => DropdownMenuItem<String>(
                      value: duration,
                      child: Text(duration),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDuration = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select the duration.';
                }
                return null;
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _analyzePossibleConditions,
                icon: const Icon(
                  Icons.psychology_outlined,
                ),
                label: const Text(
                  'Analyze Possible Conditions',
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'This feature provides AI-assisted informational guidance only. It does not confirm a disease or replace professional veterinary diagnosis and treatment.',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}