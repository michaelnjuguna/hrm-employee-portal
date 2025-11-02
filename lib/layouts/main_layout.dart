import 'package:employee_portal/app/constants.dart';
import 'package:employee_portal/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLayout extends ConsumerWidget {
  final Widget child;

  // final String title;
  const MainLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppFontSizes.xl,
          ),
        ),
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
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),

        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight * 2,
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: const DividerThemeData(
                    color: Colors.transparent,
                  ),
                ),
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Portal',
                        style: TextStyle(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSizes.xl,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              onTap: () {},
            ),
            SwitchListTile(
              title: const Text(
                'Dark theme',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              value: isDark,
              secondary: const Icon(Icons.dark_mode),
              onChanged: (value) {
                ref.read(themeProvider.notifier).toggleTheme(value);
              },
            ),
            const Spacer(),
            ListTile(title: Text('v1.2.9', textAlign: TextAlign.center)),
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
