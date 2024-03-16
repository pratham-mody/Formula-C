import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add action to change profile picture
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Email: john.doe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: +1234567890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Add action to edit account info
              },
              child: Text(
                'Edit',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Security'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '••••••••••••••••••••',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Last Changed: January 1, 2023',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Two-step Verification:',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: true, // Change this value based on user preference
                  onChanged: (value) {
                    // Add action for two-step verification toggle
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Account', style: TextStyle(color: Colors.white)),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Security'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AccountDetailsPage(),
            AccountSecurityPage(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountPage(),
  ));
}
