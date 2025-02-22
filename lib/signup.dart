import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person, color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Email Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email, color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password Field
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Handle signup logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Sign Up Successful!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}