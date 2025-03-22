import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("General Settings"),
            _buildSettingItem(Icons.language, "Language Preference"),
            _buildSettingItem(Icons.dark_mode, "Dark / Light Mode"),
            _buildSettingItem(Icons.notifications, "Enable / Disable app notification"),
            
            const SizedBox(height: 20),
            _buildSectionTitle("Support & Legal"),
            _buildSettingItem(Icons.help, "Help & FAQs"),
            _buildSettingItem(Icons.feedback, "Report a Problem / Feedback"),
            _buildSettingItem(Icons.description, "Terms & conditions"),
            _buildSettingItem(Icons.privacy_tip, "Privacy Policy"),
            
            const SizedBox(height: 20),
            _buildSectionTitle("App Info"),
            _buildSettingItem(Icons.info, "App Version"),
          ],
        ),
      ),
    );
  }

  // Widget for Section Titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Widget for Individual Settings Items
  Widget _buildSettingItem(IconData icon, String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        onTap: () {
          // Handle setting option click
        },
      ),
    );
  }
}
