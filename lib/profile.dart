import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/Images/profile_picture.png"), // Replace with your image asset
            ),
            const SizedBox(height: 20),

            // User Name
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // User Email
            const Text(
              "johndoe@example.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Health Stats Section
            _buildHealthStats(),
            const SizedBox(height: 30),

            // About Section
            _buildAboutSection(),
          ],
        ),
      ),
    );
  }

  // Health Stats Widget
  Widget _buildHealthStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _statItem("Steps", "8,450"),
          _statItem("Calories", "2,350 kcal"),
          _statItem("Heart Rate", "78 bpm"),
        ],
      ),
    );
  }

  // Stat Item Widget
  Widget _statItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  // About Section Widget
  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "About Me",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "I am a fitness enthusiast who loves to stay active and healthy. My goal is to inspire others to lead a healthy lifestyle.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 20),
          const Text(
            "Interests",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              _interestChip("Running"),
              _interestChip("Yoga"),
              _interestChip("Weightlifting"),
              _interestChip("Meditation"),
            ],
          ),
        ],
      ),
    );
  }

  // Interest Chip Widget
  Widget _interestChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.teal.shade50,
      labelStyle: const TextStyle(color: Colors.teal),
    );
  }
}