// lib/screens/age_groups_screen.dart
import 'package:flutter/material.dart';
import 'package:miniproject/screens/AllSetScreen.dart';

// Assuming there's a next screen, e.g., WelcomeScreen or Dashboard
// import 'package:my_app/screens/next_flow_screen.dart'; // Placeholder for the next screen

class AgeGroupsScreen extends StatefulWidget {
  const AgeGroupsScreen({super.key});

  @override
  State<AgeGroupsScreen> createState() => _AgeGroupsScreenState();
}

class _AgeGroupsScreenState extends State<AgeGroupsScreen> {
  String? _selectedAgeGroup; // To hold the currently selected age group

  final List<String> _ageGroups = [
    '12-17',
    '18-25',
    '26-35',
    '36-44',
    // Add more if needed to match the image layout if it scrolls
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
            Navigator.of(context).pop(); // Go back to the previous screen (LanguageSelectionScreen)
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                // Handle Skip action
                print('Skip tapped from Age Groups');
                // You might navigate to a different part of the app
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
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3.0),
                  width: index == 2 ? 30.0 : 15.0, // Second one is longer, as per image
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: index == 2 ? Colors.pink : Colors.pink[100],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                );
              }),
            ),
            const SizedBox(height: 40.0),
                // Title
                const Text(
                  'Age Groups',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30.0),

                // Age Group Selection Buttons
                // Using Wrap for flowing layout, and GestureDetector for custom button style
                Wrap(
                  spacing: 16.0, // Horizontal spacing
                  runSpacing: 16.0, // Vertical spacing
                  children: _ageGroups.map((group) {
                    final bool isSelected = _selectedAgeGroup == group;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAgeGroup = isSelected ? null : group; // Toggle selection
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.pink[100] : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: isSelected ? Colors.pink : Colors.grey[300]!,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          group,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.pink : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40.0),

                // Reset and Apply Buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55.0,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _selectedAgeGroup = null; // Clear selection
                            });
                            print('Age Group selection reset.');
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.pink, width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            foregroundColor: Colors.pink, // Text color
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: SizedBox(
                        height: 55.0,
                        child: ElevatedButton(
                          onPressed: _selectedAgeGroup != null
                              ? () {
                                  print('Age Group Applied: $_selectedAgeGroup');
                                  // You might want to save this selection
                                                            Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const AllSetScreen(),
                            ),
                            (Route<dynamic> route) => false, // This predicate removes all previous routes
                          );

                                }
                              : null, // Disable if no selection
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            foregroundColor: Colors.white,
                            elevation: 0,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Provide enough space at the bottom for the fixed Next button
                const SizedBox(height: 120.0),
              ],
            ),
          ),
          // Next button fixed at the bottom
        ],
      ),
    );
  }
}