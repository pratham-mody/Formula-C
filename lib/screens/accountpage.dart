import 'package:flutter/material.dart';

class AccountDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class AccountSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update the UI when the tab changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Account', style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Details'),
            Tab(text: 'Security'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AccountDetailsPage(),
          AccountSecurityPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: AccountPage(),
  ));
}
