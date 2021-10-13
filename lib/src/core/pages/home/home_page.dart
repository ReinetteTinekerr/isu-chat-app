import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isu_chat_system/src/authentication/provider/providers.dart';
import 'package:isu_chat_system/src/constants.dart';
import 'package:isu_chat_system/src/core/pages/main_page.dart';
import 'package:isu_chat_system/src/core/pages/page_flip_builder.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        scaffoldContext: context,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Chats',
        child: const Icon(Icons.chat_bubble_outline, size: 32),
        onPressed: () {
          // print(ref.watch(supabaseClientProvider).auth.currentUser);
          print(
              'from authnotifier: ${ref.watch(authUserNotifierProvider.notifier).isSignedIn}');
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Chats'),
                      SizedBox(height: 8),
                      Text('Chats'),
                      SizedBox(height: 8),
                      Text('Chats'),
                      SizedBox(height: 8),
                      Text('Chats'),
                      SizedBox(height: 8),
                      Text('Chats'),
                      SizedBox(height: 8),
                      TextFormField(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      body: Center(
        child: Text('Pages'),
      ),
    );
  }
}
