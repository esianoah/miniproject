// lib/screens/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // For BottomNavigationBar
  String _selectedTopTab = 'Rewards'; // For Rewards/Achievements/Badges

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Implement actual page navigation based on index
    print('Bottom nav tapped: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // A lighter background color as in the image
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 140, // Increased height for search bar and header
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Avatar, Name, Notification
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage('https://via.placeholder.com/150/FFC0CB?text=User'), // Replace with actual user image
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Hello Rahrah 👋',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'KNUST, Kumasi',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Colors.black87, size: 30),
                      onPressed: () {
                        print('Notifications tapped');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Search Bar
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Expanded( // Expanded ensures the TextField takes available space
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Games, Videos...',
                            border: InputBorder.none,
                            isDense: true, // Reduce vertical space
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.filter_list, color: Colors.grey),
                        onPressed: () {
                          print('Filter tapped');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView( // Main scroll view for the body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12), // Spacer from AppBar

            // Stats Cards Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  _buildStatCard('23%', 'Progress', Icons.area_chart, Colors.pink),
                  const SizedBox(width: 10),
                  _buildStatCard('8days', 'Streaks', Icons.local_fire_department, Colors.orange),
                  const SizedBox(width: 10),
                  _buildStatCard('12', 'Lessons', Icons.school, Colors.purple),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Welcome Back Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Welcome Back, Queen!👑',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
            const SizedBox(height: 15),

            // Rewards, Achievements, Badges Tabs - Adjusted for potential overflow
            SizedBox( // Use SizedBox to give horizontal space for the SingleChildScrollView
              height: 45, // Approximate height of the tabs
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Apply padding here
                child: Row(
                  children: [
                    _buildTopTab('Rewards', Icons.emoji_events, 'Rewards' == _selectedTopTab),
                    const SizedBox(width: 10),
                    _buildTopTab('Achievements', Icons.military_tech, 'Achievements' == _selectedTopTab),
                    const SizedBox(width: 10),
                    _buildTopTab('Badges', Icons.card_membership, 'Badges' == _selectedTopTab),
                    // Add more tabs here if needed, they will now scroll horizontally
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Gamified Progress Tracker
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
            //   child: Container(
            //     height: 250,
            //     decoration: BoxDecoration(
            //       color: Colors.lightGreen[50],
            //       borderRadius: BorderRadius.circular(20),
            //       border: Border.all(color: Colors.lightGreen, width: 2),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.lightGreen.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 8,
            //           offset: const Offset(0, 4),
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Icon(Icons.flag_circle, size: 60, color: Colors.green),
            //         const SizedBox(height: 10),
            //         Text(
            //           'Quest Progress: Chapter 3',
            //           style: Theme.of(context).textTheme.titleLarge?.copyWith(
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.green[800],
            //               ),
            //         ),
            //         const SizedBox(height: 10),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //           child: LinearProgressIndicator(
            //             value: 0.70,
            //             backgroundColor: Colors.green[100],
            //             valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            //             minHeight: 12,
            //             borderRadius: BorderRadius.circular(6),
            //           ),
            //         ),
            //         const SizedBox(height: 10),
            //         Text(
            //           '70% to next milestone (1200 / 1700 XP)',
            //           style: TextStyle(
            //             fontSize: 14,
            //             color: Colors.green[700],
            //           ),
            //         ),
            //         const SizedBox(height: 15),
            //         ElevatedButton.icon(
            //           onPressed: () {
            //             print('Continue Quest tapped');
            //           },
            //           icon: const Icon(Icons.arrow_forward_ios, size: 18),
            //           label: const Text('Continue Quest'),
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.green,
            //             foregroundColor: Colors.white,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             elevation: 0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 30),

            // Explore Games Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Explore Games',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> games = [
                    {'image': 'https://via.placeholder.com/150/FF69B4/FFFFFF?text=Cooking', 'title': 'Cooking Master'},
                    {'image': 'https://via.placeholder.com/150/87CEEB/FFFFFF?text=Fashion', 'title': 'Fashion Frenzy'},
                    {'image': 'https://via.placeholder.com/150/FFD700/000000?text=Puzzle', 'title': 'Puzzle Paradise'},
                    {'image': 'https://via.placeholder.com/150/32CD32/FFFFFF?text=Adventure', 'title': 'Adventure Quest'},
                  ];
                  return _buildGameCard(games[index]['image']!, games[index]['title']!);
                },
              ),
            ),
            const SizedBox(height: 30),

            // Explore Modules Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'Explore Modules',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 18.0,
                  childAspectRatio: 1.2,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> modules = [
                    {'icon': Icons.menu_book, 'title': 'Stories', 'subtitle': 'Dive into exciting stories'},
                    {'icon': Icons.laptop_mac, 'title': 'Animation Room', 'subtitle': 'Create Animations'},
                    {'icon': Icons.quiz, 'title': 'Quizzes', 'subtitle': 'Test your knowledge'},
                    {'icon': Icons.insights, 'title': 'Progress', 'subtitle': 'Track your progress'},
                  ];
                  return _buildModuleCard(
                    modules[index]['icon']!,
                    modules[index]['title']!,
                    modules[index]['subtitle']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Quirky Quinn Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150/FFC0CB?text=Quinn'),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Quirky Quinn',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Your playful companion',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Level 5 Current Level • 500 XP Experience Points',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          print('Follow Quirky Quinn');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Follow', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Daily Tips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Tips',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 15),
                  _buildDailyTip('Snack on iron-rich foods like red meat', Colors.red),
                  _buildDailyTip('Focus on fresh fruits, veggies', Colors.green),
                  _buildDailyTip('Drink a lot of water', Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 80), // Extra space for bottom nav bar
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: _onBottomItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  // --- Helper Widgets (unchanged) ---

  Widget _buildStatCard(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Icon(icon, color: color, size: 24),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTab(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTopTab = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? Colors.white : Colors.grey[700]),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(String imageUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.pink),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyTip(String tip, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}