import 'package:flutter/material.dart';

class BreedIdentificationPage extends StatefulWidget {
  const BreedIdentificationPage({super.key});

  @override
  State<BreedIdentificationPage> createState() =>
      _BreedIdentificationPageState();
}

class _BreedIdentificationPageState
    extends State<BreedIdentificationPage> {
  String? _selectedAnimalType;
  bool _hasImage = false;

  final List<String> _animalTypes = [
    'Dog',
    'Cat',
    'Bird',
    'Cow',
    'Other',
  ];

  void _selectImage() {
    setState(() {
      _hasImage = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Image picker will be connected when storage is added.',
        ),
      ),
    );
  }

  void _identifyBreed() {
    if (!_hasImage || _selectedAnimalType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please add an image and select an animal type.',
          ),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Identification Ready'),
          content: const Text(
            'AI breed identification will be connected when the AI service is integrated.',
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
        title: const Text('Breed Identification'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Identify an Animal',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Upload an image to identify the animal and estimate its likely breed.',
          ),
          const SizedBox(height: 24),
          Card(
            child: InkWell(
              onTap: _selectImage,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: _hasImage
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 64,
                          ),
                          SizedBox(height: 12),
                          Text('Animal image selected'),
                          SizedBox(height: 4),
                          Text('Tap to change image'),
                        ],
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 56,
                          ),
                          SizedBox(height: 12),
                          Text('Add Animal Image'),
                          SizedBox(height: 4),
                          Text('Tap to select an image'),
                        ],
                      ),
              ),
            ),
          ),
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
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _identifyBreed,
              icon: const Icon(Icons.search_outlined),
              label: const Text('Identify Animal'),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'AI identification results are estimates and should not be treated as definitive veterinary or scientific identification.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}