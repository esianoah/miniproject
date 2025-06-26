// lib/screens/create_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:miniproject/screens/ChooseAvatarScreen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _nicknameController = TextEditingController();
  String? _selectedAgeGroup; // To hold the selected age group
  // You might want to pre-fill the avatar if it's already chosen, or handle it later.
  // For now, it's just a button to navigate.

  // Sample age groups (you might get these from an API or a fixed list)
  final List<String> _ageGroups = [
    'Under 18',
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55+',
  ];

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  // Function to show the age group selection dialog
  Future<void> _showAgeGroupPicker() async {
    final String? picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent, // To allow custom shape
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select Age Group',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded( // Use Expanded to make the ListView fill available space
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _ageGroups.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ageGroup = _ageGroups[index];
                    return ListTile(
                      title: Text(ageGroup),
                      onTap: () {
                        Navigator.pop(context, ageGroup); // Return the selected age group
                      },
                      selected: _selectedAgeGroup == ageGroup,
                      selectedTileColor: Colors.pink[50], // Light pink when selected
                      trailing: _selectedAgeGroup == ageGroup
                          ? const Icon(Icons.check, color: Colors.pink)
                          : null,
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom), // Space for safe area
            ],
          ),
        );
      },
    );

    if (picked != null && picked != _selectedAgeGroup) {
      setState(() {
        _selectedAgeGroup = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            Navigator.of(context).pop(); // Go back
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Center the top avatar and title
              children: [
                // Top placeholder for Avatar
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.pink[50], // Light pink background
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(height: 20.0),

                // Title
                const Text(
                  'Create Your Profile',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0), // Spacer

                // Nickname Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nickname',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Create your profile', // Helper text
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.grey[300]!, width: 1.0),
                        ),
                        child: TextField(
                          controller: _nicknameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter nickname',
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.grey),
                            border: InputBorder.none, // Remove default TextField border
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          ),
                          style: const TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),

                // Age Group Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Age Group',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Select your age group',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: _showAgeGroupPicker,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.grey[300]!, width: 1.0),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.people_alt_outlined, color: Colors.grey),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  _selectedAgeGroup ?? 'Select age group',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: _selectedAgeGroup == null ? Colors.grey : Colors.black87,
                                  ),
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down, color: Colors.grey), // Dropdown icon
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),

                // Avatar Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Avatar',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        'Customize your avatar',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the Choose Avatar screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ChooseAvatarScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.grey[300]!, width: 1.0),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.image_outlined, color: Colors.grey), // Avatar icon
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Text(
                                  'Choose avatar',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20), // Forward arrow
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Add enough space at the bottom to prevent the keyboard from covering content
                const SizedBox(height: 100.0),
              ],
            ),
          ),
          // Next button positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement logic for "Next" button.
                    // You might want to validate inputs here before proceeding.
                    print('Nickname: ${_nicknameController.text}');
                    print('Age Group: $_selectedAgeGroup');
                    // Navigate to the Language Selection Screen
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ChooseAvatarScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    foregroundColor: Colors.white,
                    elevation: 0,
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}