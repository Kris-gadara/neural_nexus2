import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginScreen
import 'aibot.dart'; // Import AI Chatbot page
import 'profile.dart'; // Import ProfileScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index for the bottom navigation bar

  // List of screens corresponding to each bottom navigation item
  final List<Widget> _screens = [
    const HomeContent(), // Home screen content
    const AIBotScreen(), // AI Bot screen
    const PlaceholderScreen("Lab Report"), // Lab Report screen
    const PlaceholderScreen("Content"), // Content screen
    const ProfileScreen(), // Profile screen
  ];

  // Handle bottom navigation bar item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Neural-Nexus"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          // Nearby Doctors Button
          IconButton(
            icon: const Icon(Icons.location_on, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Nearby Doctors Button Pressed")),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context), // Drawer Menu
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: 'AI Bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Lab Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Content',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Drawer Menu
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.health_and_safety, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Health App",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
          _drawerItem("Profile", Icons.person, context, const ProfileScreen()),
          const Divider(),
          _drawerItem("Settings", Icons.settings, context, const PlaceholderScreen("Settings")),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.teal),
            title: const Text("Logout", style: TextStyle(fontSize: 18)),
            onTap: () {
              // Navigate back to LoginScreen and clear the navigation stack
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false, // Clear the stack
              );
            },
          ),
        ],
      ),
    );
  }

  // Drawer Item Widget
  Widget _drawerItem(String title, IconData icon, BuildContext context, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context); // Close the drawer first
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

// Home Content Widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.05,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Health-Related Image at the Top
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/health_image.jpg"), // Add your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Welcome Section
          const Text(
            "Welcome Back!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            "Please log in to continue.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),

          // Grid of Small Buttons
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3, // 3 columns for smaller buttons
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              _buildSmallButton(Icons.dashboard, "Dashboard"),
              _buildSmallButton(Icons.fitness_center, "Workout"),
              _buildSmallButton(Icons.fastfood, "Diet"),
              _buildSmallButton(Icons.favorite, "Heart"),
              _buildSmallButton(Icons.nightlight_round, "Sleep"),
              _buildSmallButton(Icons.rocket_launch, "AI Bot"),
            ],
          ),
          const SizedBox(height: 30),

          // Doctors List Section
          const Text(
            "Nearby Doctors",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),
          _buildDoctorsList(),
        ],
      ),
    );
  }

  // Small Button Widget
  Widget _buildSmallButton(IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsList() {
    final List<String> doctors = [
      "Dr. Gadara Krishna",
      "Dr. Dharmik",
      "Dr. Fitness Fi...",
      "Dr. Yash",
      "Dr. Bharat Na...",
      "Dr. Tej",
      "Dr. Ayub",
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person, color: Colors.teal),
          title: Text(doctors[index]),
          onTap: () {
            // Handle doctor selection
          },
        );
      },
    );
  }
}

// PlaceholderScreen Widget to prevent error
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          '$title Content Here',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}