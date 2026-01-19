import 'package:flutter/material.dart';

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
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
            subtitle: Text('Manage your account settings'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            subtitle: Text('Configure notification preferences'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy & Security'),
            subtitle: Text('Manage your privacy settings'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            subtitle: Text('App information and version'),
          ),
        ],
      ),
    );
  }
}
