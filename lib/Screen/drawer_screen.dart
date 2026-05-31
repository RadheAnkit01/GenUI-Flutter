import 'package:flutter/material.dart';
import 'package:gen_ui/Data/App/appdata.dart';
import 'package:gen_ui/Screen/about_screen.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(radius: 35, child: Icon(Icons.person, size: 35)),
                  const SizedBox(height: 12),
                  Text(
                    Appdata().appName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Quiz Learning App',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),

            const Divider(),

            // Navigation
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _drawerItem(
                    context,
                    icon: Icons.home_rounded,
                    title: 'Home',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.quiz_rounded,
                    title: 'My Quizzes',
                    onTap: () {},
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.history_rounded,
                    title: 'History',
                    onTap: () {},
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.favorite_rounded,
                    title: 'Favorites',
                    onTap: () {},
                  ),

                  const Divider(),

                  _drawerItem(
                    context,
                    icon: Icons.settings_rounded,
                    title: 'Settings',
                    onTap: () {},
                  ),

                  _drawerItem(
                    context,
                    icon: Icons.info_outline_rounded,
                    title: 'About',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Footer
            Padding(
              padding: const EdgeInsets.all(12),
              child: ListTile(
                leading: const Icon(Icons.logout_rounded),
                title: const Text('Logout'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: onTap,
    );
  }
}
