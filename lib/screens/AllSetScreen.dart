// lib/screens/all_set_screen.dart
import 'package:flutter/material.dart';
import 'package:miniproject/screens/SigninScreen.dart';

// You will likely have a LoginScreen or HomeScreen after this.
// For now, let's use a placeholder.
// import 'package:my_app/screens/login_screen.dart'; // Uncomment and replace with your actual login screen

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Checkmark Icon
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.lightGreen, // Green background for the checkmark
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const SizedBox(height: 30.0),

              // Title "You're All Set!" with Emoji
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "You're All Set!",
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10), // Space between text and emoji
                  // Party Popper Emoji - Ensure your app's font supports emojis
                  Text(
                    '🎉',
                    style: TextStyle(fontSize: 28.0),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Description
              const Text(
                'Your profile is ready. Dive into Ticket Master and join the party train.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60.0), // Spacer before the button

              // "Go to Login" Button
              TextButton(
                onPressed: () {
                  // Navigate to your actual LoginScreen or HomeScreen
                  // This typicaly clears the entire onboarding stack.
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Text('This is your Login/Home Screen'), // <<< REPLACE WITH YOUR ACTUAL LOGIN/HOME SCREEN WIDGET
                    ),
                    (Route<dynamic> route) => false, // This predicate removes all previous routes
                  );
                  print('Go to Login tapped!');
                },
                     child: SizedBox(
                        height: 55.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to your actual LoginScreen or HomeScreen
                                                                    Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                            print('Go to Login tapped!');
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
                            'Go to Login',
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
        ),
      ),
    );
  }
}