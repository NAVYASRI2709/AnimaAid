import 'package:flutter/material.dart';

class FoundPetsPage extends StatefulWidget {
  const FoundPetsPage({super.key});

  @override
  State<FoundPetsPage> createState() => _FoundPetsPageState();
}

class _FoundPetsPageState extends State<FoundPetsPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _foundPets = [
    {
      'name': 'Unknown Dog',
      'species': 'Dog',
      'location': 'Chennai',
      'details': 'Friendly brown dog found near a residential area.',
    },
    {
      'name': 'Unknown Cat',
      'species': 'Cat',
      'location': 'Chennai',
      'details': 'Small white and grey cat found nearby.',
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
          'Found pet reporting will be connected to the backend soon.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPets = _foundPets.where((pet) {
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
        title: const Text('Found Pets'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help reunite pets with their families',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Search for found animals and help identify their owners.',
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
                  hintText: 'Search found pets...',
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
                  icon: const Icon(Icons.add_location_alt_outlined),
                  label: const Text('Report Found Pet'),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Recently Found',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: filteredPets.isEmpty
                    ? Center(
                        child: Text(
                          'No found pets available.',
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
        subtitle: Text('$details\nFound near: $location'),
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