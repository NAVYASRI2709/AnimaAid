import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AiAssistantPage extends StatelessWidget {
  const AiAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dr. Paws AI Assistant'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Icon(
                      Icons.smart_toy_outlined,
                      size: 72,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'How can I help your animal today?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Ask about symptoms, animal care, or general welfare guidance.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Animal First Aid
                    Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.health_and_safety_outlined,
                          ),
                        ),
                        title: const Text(
                          'Animal First Aid',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'Get quick guidance for common animal emergencies.',
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () => context.go('/first-aid'),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Breed Identification
                    Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.image_search_outlined,
                          ),
                        ),
                        title: const Text(
                          'Breed Identification',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'Upload an image to identify an animal and estimate its breed.',
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () => context.go(
                          '/breed-identification',
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // AI Symptom Analysis
                    Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.medical_information_outlined,
                          ),
                        ),
                        title: const Text(
                          'AI Symptom Analysis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'Describe symptoms and receive AI-assisted health guidance.',
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () => context.go(
                          '/symptom-checker',
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Disease Prediction Guidance
                    Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.biotech_outlined,
                          ),
                        ),
                        title: const Text(
                          'Disease Prediction Guidance',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text(
                          'Explore possible health concerns based on observed symptoms.',
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                        onTap: () => context.go(
                          '/disease-prediction',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Ask Dr. Paws input
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ask Dr. Paws...',
                  suffixIcon: const Icon(
                    Icons.send,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}