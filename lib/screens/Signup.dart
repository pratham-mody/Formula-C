import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  Future<void> _saveUserName(String userName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', userName);
}
Future<void> _saveEmail(String userEmail) async {
  final prefs2 = await SharedPreferences.getInstance();
  await prefs2.setString('userEmail', userEmail);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 50,
                // backgroundImage: AssetImage('assets/images/profile_image.jpg'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText:'Enter Password',
                )
              ),
              SizedBox(height: 10.0,),
              ElevatedButton(
                  onPressed: () async {
                  Navigator.pushNamed(
                  context,'/home'
                );
                final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                           sharedPreferences.setString('name', name.text);
                           sharedPreferences.setString('email', email.text);
                             _saveUserName(name.text);
                        _saveEmail(email.text);
              },
              child: Text('Sign Up'),
              ),  
            ]
          ),
        ),
      ),
    );
  }
}