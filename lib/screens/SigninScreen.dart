// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miniproject/screens/HomeScreen.dart';
import 'package:miniproject/screens/SignupScreen.dart'; // For social media icons
 // Assuming HomeScreen is where you navigate after login

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80), // Adjust spacing from top as needed
              // Image of woman
              CircleAvatar(
                radius: 80, // Adjust size as needed
                backgroundColor: Colors.grey[200], // Placeholder background
                backgroundImage: const NetworkImage(
                    'https://via.placeholder.com/150/F8BBD0/000000?text=Woman'), // Replace with actual image URL
              ),
              const SizedBox(height: 40),

              Text(
                'Welcome back!', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 30),

              // Username Text Field
              _buildTextField(
                hintText: 'Username', //
                icon: Icons.person_outline, //
              ),
              const SizedBox(height: 20),

              // Password Text Field
              _buildTextField(
                hintText: 'Password', //
                icon: Icons.lock_outline, //
                isPassword: true,
              ),
              const SizedBox(height: 10),

              // Forgot Password?
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print('Forgot Password tapped');
                  },
                  child: Text(
                    'Forgot Password?', //
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Log In Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to HomeScreen after successful login
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                    print('Log In tapped');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Pink color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Log In', //
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Don't have an account? Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ", //
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Sign up tapped');
                      // You might navigate to a registration screen here
                                          Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                    },
                    child: const Text(
                      'Sign up', //
                      style: TextStyle(
                        color: Color(0xFFF672B1), // Pink color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Social Logins
              _buildSocialLoginButton(
                text: 'Log In with Google', //
                icon: FontAwesomeIcons.google, // Using Font Awesome for Google icon
                backgroundColor: const Color(0xFFFCE8F1), // Light pink
                textColor: Colors.black,
                iconColor: Colors.red, // Google's brand color
                onPressed: () {
                  print('Log In with Google tapped');
                },
              ),
              const SizedBox(height: 15),

              _buildSocialLoginButton(
                text: 'Log In with Facebook', //
                icon: FontAwesomeIcons.facebookF, // Using Font Awesome for Facebook icon
                backgroundColor: const Color(0xFF3B5998), // Facebook blue
                textColor: Colors.white,
                iconColor: Colors.white,
                onPressed: () {
                  print('Log In with Facebook tapped');
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(color: Colors.grey[300]!, width: 1.5), // Light border
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(icon, color: Colors.grey[700]), //
          border: InputBorder.none, // Remove default border
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  // Helper widget for social login buttons
  Widget _buildSocialLoginButton({
    required String text,
    required IconData icon,
    required Color backgroundColor,
    required Color textColor,
    required Color iconColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), //
          ),
          elevation: 0,
        ),
        icon: FaIcon(icon, color: iconColor, size: 20), // Using FontAwesomeIcons
        label: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}