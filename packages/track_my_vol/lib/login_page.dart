import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              buildUsernameField(),
              buildPasswordField(),
              buildImageContainer(),
              buildCodeField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUsernameField() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Username: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.purple,
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Password: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget buildImageContainer() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        padding: const EdgeInsets.all(8),
        child: const Image(
          image: NetworkImage(
            'https://drive.google.com/uc?id=1LY-hNRrVc_eTT1L_MamYB0Z8D2jIp-EA',
          ),
        ),
      ),
    );
  }

  Widget buildCodeField() {
    return Card(
      elevation: 10,
      child: Container(
        width: 350,
        height: 150,
        color: Colors.pink[200],
        padding: const EdgeInsets.all(8),
        child: const Text(
          'Code: ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
