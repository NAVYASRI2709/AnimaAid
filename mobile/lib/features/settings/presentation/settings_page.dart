import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Account'),
            subtitle: Text('Manage your profile'),
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            subtitle: const Text('Notification preferences'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              context.go('/notifications');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.palette_outlined),
            title: Text('Appearance'),
            subtitle: Text('Theme settings'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Language'),
            subtitle: Text('English'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About AnimaAid'),
            subtitle: Text('Version 1.0.0'),
          ),
        ],
      ),
    );
  }
}