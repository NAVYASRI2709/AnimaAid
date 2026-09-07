import 'package:flutter/material.dart';

import 'veterinary_service_details_page.dart';

class VeterinaryServicesPage extends StatelessWidget {
  const VeterinaryServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Veterinary Services'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search veterinary services',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          _serviceCard(
            context,
            icon: Icons.local_hospital_outlined,
            title: 'Emergency Veterinary Hospitals',
            subtitle: 'Find nearby emergency veterinary care',
          ),

          _serviceCard(
            context,
            icon: Icons.medical_services_outlined,
            title: 'Veterinary Clinics',
            subtitle: 'Find veterinary clinics near you',
          ),

          _serviceCard(
            context,
            icon: Icons.vaccines_outlined,
            title: 'Vaccination Centers',
            subtitle: 'Find animal vaccination services',
          ),

          _serviceCard(
            context,
            icon: Icons.medication_outlined,
            title: 'Pet Pharmacies',
            subtitle: 'Find nearby veterinary pharmacies',
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          icon,
          size: 32,
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VeterinaryServiceDetailsPage(
                serviceType: title,
              ),
            ),
          );
        },
      ),
    );
  }
}