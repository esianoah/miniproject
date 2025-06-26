// lib/screens/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:miniproject/screens/CreateProfileScreen.dart';
import 'package:miniproject/screens/SigninScreen.dart'; // For social media icons
 // Assuming LoginScreen exists for navigation

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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

              Text(
                'Sign Up', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 30),

              Text(
                'Welcome to the community!', //
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: 30),

              // Full name Text Field
              _buildTextField(
                hintText: 'Full name', //
                icon: Icons.person_outline, //
              ),
              const SizedBox(height: 20),

              // Email Address Text Field
              _buildTextField(
                hintText: 'Email Address', //
                icon: Icons.email_outlined, //
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password Text Field
              _buildTextField(
                hintText: 'Password', //
                icon: Icons.lock_outline, //
                isPassword: true,
              ),
              const SizedBox(height: 20),

              // Confirm Password Text Field
              _buildTextField(
                hintText: 'Confirm Password', //
                icon: Icons.lock_outline, //
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    print('Sign Up tapped');
                    // Typically, after sign up, you might navigate to a profile setup or home screen
                    // For now, let's navigate back to Login as a simple flow
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const CreateProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink, // Pink color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded corners
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign Up', //
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Already have an account? Log In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ", //
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Log In tapped from Sign Up');
                                          Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    ); // Go back to LoginScreen
                    },
                    child: const Text(
                      'Log In', //
                      style: TextStyle(
                        color: Color(0xFFF672B1), // Pink color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Social Sign Up Buttons

              _buildSocialLoginButton(
                text: 'Sign Up with Google', //
                icon: FontAwesomeIcons.google,
                backgroundColor: const Color(0xFFFCE8F1), // Light pink
                textColor: Colors.black,
                iconColor: Colors.red,
                onPressed: () {
                  print('Sign Up with Google tapped');
                },
              ),
              const SizedBox(height: 15),

              _buildSocialLoginButton(
                text: 'Sign Up with Facebook', //
                icon: FontAwesomeIcons.facebookF,
                backgroundColor: const Color(0xFF3B5998), // Facebook blue
                textColor: Colors.white,
                iconColor: Colors.white,
                onPressed: () {
                  print('Sign Up with Facebook tapped');
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for text fields (reused from LoginScreen)
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), //
        border: Border.all(color: Colors.grey[300]!, width: 1.5), //
      ),
      child: TextField(
        obscureText: isPassword,
        keyboardType: keyboardType,
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

  // Helper widget for social login/signup buttons (reused from LoginScreen)
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
        icon: FaIcon(icon, color: iconColor, size: 20),
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