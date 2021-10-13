import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icon/icon.png'),
              radius: 45,
            ),
            SizedBox(height: 15),
            Text(
              'Hannma Baki',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text(
              'Bio ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum imperdiet luctus. Integer neque metus, fermentum et mi a, maximus pretium nunc. Morbi sed congue justo. Integer ultricies massa et ante accumsan malesuada. Sed rutrum venenatis tortor id tristique. Vestibulum malesuada aliquam turpis non tincidunt. Aliquam bibendum cursus arcu vitae pharetra. Duis faucibus erat sit amet elit fermentum, non bibendum elit blandit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum imperdiet luctus. Integer neque metus, fermentum et mi a, maximus pretium nunc. Morbi sed congue justo. Integer ultricies massa et ante accumsan malesuada. Sed rutrum venenatis tortor id tristique. Vestibulum malesuada aliquam turpis non tincidunt. Aliquam bibendum cursus arcu vitae pharetra. Duis faucibus erat sit amet elit fermentum, non bibendum elit blandit.'),
            ),
            Divider(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'School info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('ID number: 19-28xx'),
            Divider(height: 15),
            Text(
              'Contact info',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Email: hannma.baki@isu.edu.ph'),
            Divider(height: 15),
            Text(
              'Basic info',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Gender: Male'),
            Divider(height: 15)
          ],
        ),
      ),
    );
  }
}
