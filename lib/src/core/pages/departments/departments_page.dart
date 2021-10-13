import 'package:flutter/material.dart';
import 'package:isu_chat_system/src/core/pages/main_page.dart';
import 'package:isu_chat_system/src/core/pages/page_flip_builder.dart';

class DepartmentsPage extends StatelessWidget {
  DepartmentsPage({Key? key}) : super(key: key);
  final pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Department',
        scaffoldContext: context,
      ),
      body: Center(
        child: Text('Departments listview'),
      ),
    );
  }
}
