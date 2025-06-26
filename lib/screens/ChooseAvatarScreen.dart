// lib/screens/choose_avatar_screen.dart
import 'package:flutter/material.dart';
import 'package:miniproject/screens/LanguageSelectionScreen.dart';

class ChooseAvatarScreen extends StatefulWidget {
  const ChooseAvatarScreen({super.key});

  @override
  State<ChooseAvatarScreen> createState() => _ChooseAvatarScreenState();
}

class _ChooseAvatarScreenState extends State<ChooseAvatarScreen> {
  int? _selectedIndex; // To keep track of the selected avatar

  final List<String> _avatarImages = [
    'https://via.placeholder.com/150/FFC0CB/000000?text=Avatar1', // Placeholder for your avatar images
    'https://via.placeholder.com/150/FFC0CB/000000?text=Avatar2',
    'https://via.placeholder.com/150/FFC0CB/000000?text=Avatar3',
    'https://via.placeholder.com/150/FFC0CB/000000?text=Avatar4',
  ];

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
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                // Handle Skip action
                print('Skip tapped');
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        // Title and progress indicators in AppBar are custom, so adding them in body
        // Or you can create a custom AppBar widget
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top progress indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: index == 0 ? 30.0 : 15.0, // Make the first one longer
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: index == 0 ? Colors.pink : Colors.pink[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40.0), // Spacer

            // Title
            const Text(
              'Choose Your Avatar',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),

            // Description
            const Text(
              'Select your team size to customize your Sonic AI experience.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),

            // Avatar Grid
            Expanded(
              child: GridView.builder(
                shrinkWrap: true, // Important for fitting inside Column
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.0, // Make items square
                ),
                itemCount: _avatarImages.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[50], // Light pink background
                        borderRadius: BorderRadius.circular(20.0),
                        border: isSelected
                            ? Border.all(color: Colors.pink, width: 3.0)
                            : null, // Pink border if selected
                      ),
                      child: Center(
                        child: CircleAvatar(
                          radius: 50, // Adjust radius as needed
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(_avatarImages[index]),
                          // For local assets: AssetImage('assets/avatar${index + 1}.png'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30.0),

            // Next Button
            SizedBox(
              width: double.infinity,
              height: 55.0,
              child: ElevatedButton(
                onPressed: _selectedIndex != null
                    ? () {
                        // Handle next button press, e.g., navigate to next screen
                        print('Selected Avatar Index: $_selectedIndex');
                                                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LanguageSelectionScreen(),
                          ),
                        );
                      }
                    : null, // Disable button if no avatar is selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  foregroundColor: Colors.white, // Text color
                  elevation: 0, // No shadow
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
            const SizedBox(height: 20.0), // Bottom padding
          ],
        ),
      ),
    );
  }
}