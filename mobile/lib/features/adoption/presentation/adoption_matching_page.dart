import 'package:flutter/material.dart';

class AdoptionMatchingPage extends StatefulWidget {
  const AdoptionMatchingPage({super.key});

  @override
  State<AdoptionMatchingPage> createState() => _AdoptionMatchingPageState();
}

class _AdoptionMatchingPageState extends State<AdoptionMatchingPage> {
  String _animalType = 'Any';
  String _agePreference = 'Any Age';
  String _sizePreference = 'Any Size';
  String _energyLevel = 'Any';
  bool _goodWithChildren = false;
  bool _goodWithOtherAnimals = false;

  void _findMatches() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Finding animals that match your preferences...',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Matching'),
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
                    Icons.favorite_outline,
                    size: 42,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Find Your Match',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tell us what you are looking for and AnimaAid can help you discover suitable animals for adoption.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Your Preferences',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _dropdown(
            label: 'Animal Type',
            value: _animalType,
            items: const [
              'Any',
              'Dog',
              'Cat',
              'Cow',
              'Other',
            ],
            onChanged: (value) {
              setState(() {
                _animalType = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          _dropdown(
            label: 'Age',
            value: _agePreference,
            items: const [
              'Any Age',
              'Young',
              'Adult',
              'Senior',
            ],
            onChanged: (value) {
              setState(() {
                _agePreference = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          _dropdown(
            label: 'Size',
            value: _sizePreference,
            items: const [
              'Any Size',
              'Small',
              'Medium',
              'Large',
            ],
            onChanged: (value) {
              setState(() {
                _sizePreference = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          _dropdown(
            label: 'Energy Level',
            value: _energyLevel,
            items: const [
              'Any',
              'Low',
              'Moderate',
              'High',
            ],
            onChanged: (value) {
              setState(() {
                _energyLevel = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Good with children'),
                  subtitle: const Text(
                    'Prefer animals comfortable around children',
                  ),
                  value: _goodWithChildren,
                  onChanged: (value) {
                    setState(() {
                      _goodWithChildren = value;
                    });
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  title: const Text('Good with other animals'),
                  subtitle: const Text(
                    'Prefer animals comfortable around other pets',
                  ),
                  value: _goodWithOtherAnimals,
                  onChanged: (value) {
                    setState(() {
                      _goodWithOtherAnimals = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _findMatches,
              icon: const Icon(Icons.search),
              label: const Text(
                'Find Matching Animals',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_awesome_outlined),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Matching can later use AnimaAid AI to consider animal behavior, compatibility and your preferences.',
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

  Widget _dropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
