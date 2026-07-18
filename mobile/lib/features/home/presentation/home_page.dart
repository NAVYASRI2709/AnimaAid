import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildEmergencyCard(context),
            const SizedBox(height: 28),
            _buildSectionTitle(
              context,
              title: 'Quick Actions',
              action: 'View all',
            ),
            const SizedBox(height: 14),
            _buildQuickActions(context),
            const SizedBox(height: 28),
            _buildSectionTitle(
              context,
              title: 'Care for Every Paw',
            ),
            const SizedBox(height: 14),
            _buildFeatureCard(
              context,
              icon: Icons.smart_toy_outlined,
              title: 'Dr. Paws AI Assistant',
              subtitle: 'Get guidance for your animal companion',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _buildFeatureCard(
              context,
              icon: Icons.location_on_outlined,
              title: 'Nearby Shelters',
              subtitle: 'Find animal shelters and rescue centers',
              onTap: () {},
            ),
            const SizedBox(height: 28),
            _buildSectionTitle(
              context,
              title: 'Help an Animal Today',
              action: 'See more',
            ),
            const SizedBox(height: 14),
            _buildAdoptionPreview(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Animal Hero 👋',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Together, we can make a difference.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
          tooltip: 'Notifications',
        ),
      ],
    );
  }

  Widget _buildEmergencyCard(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animal in danger?',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Create an emergency rescue request and get help quickly.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.emergency_outlined),
                    label: const Text('Request Rescue'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Icon(
              Icons.pets,
              size: 56,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildQuickAction(
            context,
            icon: Icons.pets_outlined,
            label: 'Adopt',
          ),
          _buildQuickAction(
            context,
            icon: Icons.search_rounded,
            label: 'Missing Pets',
            onTap: () => context.go('/missing-pets'),
          ),
          _buildQuickAction(
            context,
            icon: Icons.volunteer_activism_outlined,
            label: 'Volunteer',
          ),
          _buildQuickAction(
            context,
            icon: Icons.favorite_border_rounded,
            label: 'Donate',
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(
  BuildContext context, {
  required IconData icon,
  required String label,
  VoidCallback? onTap,
}) {
  return SizedBox(
    width: 92,
    child: Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 64,
                width: 80,
                child: Icon(icon, size: 30),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}

  Widget _buildSectionTitle(
    BuildContext context, {
    required String title,
    String? action,
  }) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (action != null)
          TextButton(
            onPressed: () {},
            child: Text(action),
          ),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildAdoptionPreview(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 34,
              child: Icon(Icons.pets, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Every animal deserves a loving home.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Explore animals waiting for a second chance.',
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Explore Adoption'),
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