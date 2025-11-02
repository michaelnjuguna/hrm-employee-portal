import 'package:employee_portal/app/constants.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  // final String title;
  const MainLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Portal'),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: colorScheme.onSurface,
              foregroundColor: colorScheme.surface,
            ),
            child: Text('LB', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text(
                'Portal',
                style: (TextStyle(
                  fontSize: AppFontSizes.xxl,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
            ListTile(title: Text('Dashboard')),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppFontSizes.lg),
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
