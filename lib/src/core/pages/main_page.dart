import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/core/pages/home/menu_item.dart';
import 'package:isu_chat_system/src/core/pages/chats/chats_page.dart';
import 'package:isu_chat_system/src/core/pages/courses/courses_page.dart';
import 'package:isu_chat_system/src/core/pages/departments/departments_page.dart';
import 'package:isu_chat_system/src/core/pages/global/global_page.dart';
import 'package:isu_chat_system/src/core/pages/home/home_page.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';

import 'home/sample_item.dart';

class DefaultDrawerItems {
  static const schedule = MenuItem('Schedule', Icons.schedule, '/schedule');
  static const notes = MenuItem('Notes', Icons.note_alt_outlined, '/notes');
  static const grades =
      MenuItem('Grades', Icons.grade, '/grades'); // student stats
  static const settings = MenuItem('Settings', Icons.settings, '/settings');

  static const all = <MenuItem>[
    schedule,
    grades,
    notes,
    settings,
  ];
}

/// Displays a list of SampleItems.
class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  final List<SampleItem> items = const [
    SampleItem(1),
    SampleItem(2),
    SampleItem(3)
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final screens = <Widget>[
    HomePage(),
    ChatsPage(),
    DepartmentsPage(),
    CoursesPage(),
    GlobalPage()
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  AppBar appBarData(BuildContext context) {
    return AppBar(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      leading: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            child: const CircleAvatar(),
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      title: const Text('Home'),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Navigate to the settings page. If the user leaves and returns
            // to the app after it has been killed while running in the
            // background, the navigation stack is restored.
          },
        ),
      ],
    );
  }

  BottomNavigationBar bottomNavBarData() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // showSelectedLabels: false,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Chats'),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspaces),
          label: 'Department',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Course'),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email),
          label: 'Global',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        drawer: const SafeArea(child: CustomDrawer()),
        bottomNavigationBar: bottomNavBarData(),
        body: screens[currentIndex],

        // body: ListView.builder(
        //   restorationId: 'sampleItemListView',
        //   itemCount: widget.items.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final item = widget.items[index];
        //     return ListTile(
        //       title: Text('Item ${item.id}'),
        //       leading: const CircleAvatar(
        //         // Display the Flutter Logo image asset.
        //         foregroundImage: AssetImage('assets/icon/icon.png'),
        //       ),
        //       onTap: () {
        //         AutoRouter.of(context).push(
        //           SampleItemDetailsRoute(id: item.id),
        //         );
        //       },
        //     );
        //   },
        // ),
      );
    }
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.scaffoldContext,
  }) : super(key: key);

  final String title;
  final BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: const CircleAvatar(),
          onTap: () {
            Scaffold.of(scaffoldContext).openDrawer();
          },
        ),
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Navigate to the settings page. If the user leaves and returns
            // to the app after it has been killed while running in the
            // background, the navigation stack is restored.
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  ListTile buildItem(BuildContext context, MenuItem item) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        AutoRouter.of(context).pushNamed(item.route);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(settingsControllerProvider.notifier);
    bool isDark = state.isUsingDarkTheme();
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'username',
                  ),
                  accountEmail: const Text(
                    'username@isu.edu.ph',
                  ),
                  currentAccountPicture: InkWell(
                    child: const CircleAvatar(),
                    onTap: () =>
                        AutoRouter.of(context).push(const ProfileRoute()),
                  ),
                ),
                ...DefaultDrawerItems.all
                    .map((item) => buildItem(context, item))
                    .toList()
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const Divider(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.help_outline_sharp),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          isDark
                              ? Icons.brightness_2
                              : Icons.brightness_2_outlined,
                        ),
                        onPressed: () {
                          isDark = !isDark;
                          if (isDark != state.isUsingDarkTheme()) {
                            state.updateThemeMode(
                              isDark ? ThemeMode.dark : ThemeMode.light,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
