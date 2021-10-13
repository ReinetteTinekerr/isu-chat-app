import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/auth_required_state.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:isu_chat_system/src/core/pages/home/menu_item.dart';
import 'package:supabase/supabase.dart';

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
class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  // final List<SampleItem> items = const [
  //   SampleItem(1),
  //   SampleItem(2),
  //   SampleItem(3)
  // ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends AuthRequiredState<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void onAuthenticated(Session session) {
    final user = session.user;
    print('hey user~~~~~ ${user!.id}');
  }

  @override
  void onUnauthenticated() {
    AutoRouter.of(context).pushAndPopUntil(
      const AuthRoute(),
      predicate: (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    {
      return AutoTabsScaffold(
        animationCurve: Curves.easeIn,
        routes: [
          HomeRoute(),
          ChatsRoute(),
          DepartmentsRoute(),
          CoursesRoute(),
          GlobalRoute()
        ],
        drawer: const SafeArea(child: CustomDrawer()),
        bottomNavigationBuilder: (_, tabsRouter) {
          return bottomNavigationBarBuilder(tabsRouter);
        },

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

  BottomNavigationBar bottomNavigationBarBuilder(TabsRouter tabsRouter) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: tabsRouter.setActiveIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        BottomNavigationBarItem(
          icon: Icon(Icons.workspaces),
          label: 'Department',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alternate_email),
          label: 'Global',
        ),
      ],
    );
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
                        icon: const Icon(Icons.help_outline_sharp),
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'ISU Chat App',
                            applicationIcon: Image.asset(
                              'assets/icon/icon.png',
                              width: 32,
                              height: 32,
                            ),
                            children: [
                              const Text(
                                'Developers:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(developers),
                            ],
                          );
                        },
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
