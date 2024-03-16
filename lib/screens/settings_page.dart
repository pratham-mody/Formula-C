import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSettingsItem('Dark Mode', Icons.dark_mode),
            _buildSettingsItem('Notifications', Icons.notifications),
            _buildSettingsItem('Language', Icons.language),
            SizedBox(height: 20),
            Text(
              'Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSettingsItem('Edit Profile', Icons.account_circle),
            _buildSettingsItem('Change Password', Icons.lock),
            SizedBox(height: 20),
            Text(
              'Privacy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSettingsItem('Privacy Policy', Icons.privacy_tip),
            _buildSettingsItem('Terms of Service', Icons.assignment),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Add action for each settings item
      },
    );
  }
}
