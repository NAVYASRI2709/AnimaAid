import 'package:flutter/material.dart';

class MissingPetsPage extends StatefulWidget {
  const MissingPetsPage({super.key});

  @override
  State<MissingPetsPage> createState() => _MissingPetsPageState();
}

class _MissingPetsPageState extends State<MissingPetsPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _missingPets = [
    {
      'name': 'Bruno',
      'species': 'Dog',
      'location': 'Chennai',
      'details': 'Brown Labrador • Missing recently',
    },
    {
      'name': 'Milo',
      'species': 'Cat',
      'location': 'Chennai',
      'details': 'Orange tabby • Missing recently',
    },
  ];

  String _searchQuery = '';
  String? _selectedSpecies;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('All animals'),
                onTap: () {
                  setState(() {
                    _selectedSpecies = null;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Dogs'),
                onTap: () {
                  setState(() {
                    _selectedSpecies = 'dog';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Cats'),
                onTap: () {
                  setState(() {
                    _selectedSpecies = 'cat';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showReportConfirmation() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Missing pet reporting will be connected to the backend soon.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPets = _missingPets.where((pet) {
      final name = pet['name']!.toLowerCase();
      final species = pet['species']!.toLowerCase();
      final details = pet['details']!.toLowerCase();
      final query = _searchQuery.toLowerCase();

      final matchesSearch = name.contains(query) ||
          species.contains(query) ||
          details.contains(query);

      final matchesSpecies = _selectedSpecies == null ||
          species == _selectedSpecies;

      return matchesSearch && matchesSpecies;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Missing Pets'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help bring pets home',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Search for missing pets or report an animal that has gone missing.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search missing pets...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: _showFilterSheet,
                    icon: const Icon(Icons.tune),
                    tooltip: 'Filter',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _showReportConfirmation,
                  icon: const Icon(Icons.add_alert),
                  label: const Text('Report Missing Pet'),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recently Reported',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filteredPets.isEmpty
                    ? Center(
                        child: Text(
                          'No missing pets found.',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      )
                    : ListView.separated(
                        itemCount: filteredPets.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final pet = filteredPets[index];

                          return _buildPetCard(
                            context,
                            name: pet['name']!,
                            species: pet['species']!,
                            location: pet['location']!,
                            details: pet['details']!,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetCard(
    BuildContext context, {
    required String name,
    required String species,
    required String location,
    required String details,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          radius: 30,
          child: Icon(Icons.pets, size: 28),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$details\nLast seen: $location'),
        isThreeLine: true,
        trailing: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Contact options for $name coming soon.'),
              ),
            );
          },
          icon: const Icon(Icons.contact_phone_outlined),
          tooltip: 'Contact',
        ),
      ),
    );
  }
}