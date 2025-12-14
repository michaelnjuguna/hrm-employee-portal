import 'package:employee_portal/core/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

class MainLayout extends ConsumerStatefulWidget {
  final Widget child;
  final Widget? floatingActionButton;
  final String? appBarTitle;
  const MainLayout({
    super.key,
    required this.child,
    this.appBarTitle,
    this.floatingActionButton,
  });
  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  String _version = '';
  int currentIndex = 0;
  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      _version = info.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;

    final currentLocation = GoRouterState.of(context).uri.path;
    int currentIndex = 0;
    if (currentLocation == '/') {
      currentIndex = 0;
    } else if (currentLocation.startsWith('/taskboard')) {
      currentIndex = 1;
    } else if (currentLocation.startsWith('/inbox')) {
      currentIndex = 2;
    } else if (currentLocation.startsWith('/profile')) {
      currentIndex = 3;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarTitle ?? 'Portal',
          style: textScheme.titleLarge,
        ),

        iconTheme: IconThemeData(color: colorScheme.onSurface),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),

            onPressed: () {},

            // style: TextButton.styleFrom(
            //   shape: const CircleBorder(),
            //   foregroundColor: colorScheme.surface,
            //   backgroundColor: colorScheme.onSurface,
            // ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),

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
                      Text('Portal', style: textScheme.titleLarge),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile', style: textScheme.bodyLarge),
              onTap: () {},
            ),
            SwitchListTile(
              title: Text('Dark theme', style: textScheme.bodyLarge),
              value: isDark,
              secondary: const Icon(Icons.dark_mode),
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).toggleTheme(value);
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  SharePlus.instance.share(
                    ShareParams(
                      title: 'Check out my app',
                      text: '// TODO: Add an actual link',
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: Row(
                  children: [
                    Icon(Icons.share, color: colorScheme.surface),
                    const SizedBox(width: 8),
                    Text(
                      'Share',
                      style: textScheme.labelLarge!.copyWith(
                        color: colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Log out', style: textScheme.bodyLarge),
              onTap: () {},
            ),
            const Spacer(),

            ListTile(
              title: Text(
                'v$_version',
                textAlign: TextAlign.center,
                style: textScheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: widget.child,
          ),
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/taskboard');
              break;
            case 2:
              context.go('/inbox');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            activeIcon: Icon(Icons.task_alt),
            label: 'Task board',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_outlined),
            activeIcon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
