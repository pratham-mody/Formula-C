import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need Help?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildContactInfo(context),
            SizedBox(height: 30),
            _buildFAQSection(),
            SizedBox(height: 30),
            _buildContactForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.email),
          title: Text('support@example.com'),
          onTap: () {
            // Implement email functionality
          },
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('+1234567890'),
          onTap: () {
            // Implement phone call functionality
          },
        ),
        ListTile(
          leading: Icon(Icons.chat),
          title: Text('Live Chat'),
          onTap: () {
            // Implement live chat functionality
          },
        ),
      ],
    );
  }

  Widget _buildFAQSection() {
    return ExpansionTile(
      title: Text(
        'Frequently Asked Questions',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        _buildFAQItem('How do I reset my password?',
            'To reset your password, go to the login page and click on "Forgot Password." Follow the instructions provided to reset your password.'),
        _buildFAQItem('Can I change my username?',
            'Currently, it is not possible to change your username. However, you can contact support for further assistance.'),
        _buildFAQItem('What payment methods do you accept?',
            'We accept various payment methods, including credit cards, PayPal, and bank transfers. You can choose your preferred payment method during checkout.'),
        // Add more FAQ items as needed
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            answer,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Still Need Assistance?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Fill out the form below, and we\'ll get back to you shortly:',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 20),
        // Add a contact form here
        ElevatedButton(
          onPressed: () {
            // Implement submit functionality
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
