import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/home/menu_item.dart';
import 'package:isu_chat_system/src/routes/app_router.gr.dart';

import 'sample_item.dart';

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
class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  final List<SampleItem> items = const [
    SampleItem(1),
    SampleItem(2),
    SampleItem(3)
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return Scaffold(
          appBar: appBarData(context),
          drawer: SafeArea(
            child: drawerData(context),
          ),
          bottomNavigationBar: bottomNavBarData(),

          // To work with lists that may contain a large number of items, it’s best
          // to use the ListView.builder constructor.
          //
          // In contrast to the default ListView constructor, which requires
          // building all Widgets up front, the ListView.builder constructor lazily
          // builds Widgets as they’re scrolled into view.
          body: ListView.builder(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'sampleItemListView',
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = widget.items[index];
              return ListTile(
                title: Text('Item ${item.id}'),
                leading: const CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage('assets/icon/icon.png'),
                ),
                onTap: () {
                  AutoRouter.of(context).push(
                    SampleItemDetailsRoute(id: item.id),
                  );
                },
              );
            },
          ),
        );
      },
    );
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

  Drawer drawerData(BuildContext context) {
    final state = context.read(settingsControllerProvider.notifier);
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
                  accountName: Text(
                    'username',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  accountEmail: const Text(
                    'username@isu.edu.ph',
                  ),
                  currentAccountPicture: const CircleAvatar(),
                ),
                ...DefaultDrawerItems.all
                    .map((item) => buildItem(item))
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
                        icon: const Icon(Icons.settings),
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

  BottomNavigationBar bottomNavBarData() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // showSelectedLabels: false,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Chats'),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspaces),
          label: 'Departments',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Courses'),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email),
          label: 'Global',
        ),
      ],
    );
  }

  ListTile buildItem(MenuItem item) {
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
}
