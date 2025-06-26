// lib/screens/language_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:miniproject/screens/AgeGroupsScreen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage; // To hold the currently selected language

  final List<String> _languages = [
    'English',
    'Twi',
    'Ewe',
    'Dagbani',
    'Fante',
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align "Language" to the start
          children: [
            // Top progress indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: index == 1 ? 30.0 : 15.0, // Second one is longer, as per image
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: index == 1 ? Colors.pink : Colors.pink[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40.0), // Spacer

            // Language Title
            const Text(
              'Language',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20.0),

            // Language Options (RadioListTiles)
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Padding between list tiles
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: _selectedLanguage == language ? Colors.pink : Colors.grey[300]!,
                          width: _selectedLanguage == language ? 2.0 : 1.0,
                        ),
                      ),
                      child: RadioListTile<String>(
                        title: Text(
                          language,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: _selectedLanguage == language ? Colors.pink : Colors.black87,
                          ),
                        ),
                        value: language,
                        groupValue: _selectedLanguage,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedLanguage = value;
                          });
                        },
                        activeColor: Colors.pink, // Color of the selected radio button
                        controlAffinity: ListTileControlAffinity.trailing, // Radio button on the right
                        // No padding between title and radio, set overall container padding
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                onPressed: _selectedLanguage != null
                    ? () {
                        // Handle next button press, e.g., navigate to next screen
                        print('Selected Language: $_selectedLanguage');
                        // Example: Navigator.of(context).push(MaterialPageRoute(builder: (_) => NextScreen()));
                                                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AgeGroupsScreen(),
                          ),
                        );
                      }
                    : null, // Disable button if no language is selected
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