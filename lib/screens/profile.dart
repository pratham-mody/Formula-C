import 'package:flutter/material.dart';
import 'payment_page.dart'; // Import the PaymentPage class
import 'help_page.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              // Add action for settings button
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/professional.jpeg'),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pratham Oza',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            '4.5', // Replace with user's rating
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProfileTile(
                      context, Icons.help_outline, 'Help', HelpPage()),
                  _buildProfileTile(context, Icons.payment_outlined, 'Payment',
                      PaymentPage()),
                  _buildProfileTile(context, Icons.account_circle_outlined,
                      'Account', AccountPage()),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildPromoCodeSection(),
            SizedBox(height: 20),
            _buildBlankBox('Blank 1'),
            SizedBox(height: 20),
            _buildBlankBox('Blank 2'),
            SizedBox(height: 20),
            _buildFeatureTile(Icons.settings, 'Settings'),
            _buildFeatureTile(Icons.security, 'Security'),
            _buildFeatureTile(Icons.language, 'Language'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(
      BuildContext context, IconData icon, String title, Widget page) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.white),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoCodeSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promo Code',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 200, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'assets/promo.jpeg', // Path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          // Add promo code input field and apply button
        ],
      ),
    );
  }

  Widget _buildBlankBox(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Page'),
      ),
      body: Center(
        child: Text('This is the help page.'),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: Text('This is the account page.'),
      ),
    );
  }
}
