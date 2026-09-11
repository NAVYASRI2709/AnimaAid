import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      child: Icon(
                        Icons.person_outline,
                        size: 44,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Animal Lover',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Welcome to AnimaAid',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Account
            Card(
              child: ListTile(
                leading: const Icon(Icons.login_outlined),
                title: const Text('Account'),
                subtitle: const Text(
                  'Sign in or create your AnimaAid account',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/auth'),

              ),
            ),

            const SizedBox(height: 16),

            // Personal Features
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.pets_outlined),
                    title: const Text('My Animals'),
                    subtitle: const Text('Manage your animal profiles'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go('/my-animals'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.volunteer_activism_outlined,
                    ),
                    title: const Text('My Volunteer Activities'),
                    subtitle: const Text(
                      'View your volunteering activity',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go('/my-volunteer-activities'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.favorite_outline),
                    title: const Text('My Favorites'),
                    subtitle: const Text('View saved animals'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go('/favorites'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Settings and Support
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings_outlined),
                    title: const Text('Settings'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.go('/settings'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/help-support'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}