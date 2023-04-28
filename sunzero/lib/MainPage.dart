// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:login_register/Dashboard.dart';
import 'package:login_register/about_user.dart';
import 'package:login_register/providers/authProvider.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heater-Controller'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserProvider>().deleteUser();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLogin()),
                );
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.blue[200],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        animationDuration: const Duration(milliseconds: 1000),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // NavigationDestination(
          //   selectedIcon: Icon(Icons.contact_page),
          //   icon: Icon(Icons.contact_page_outlined),
          //   label: 'Contact us',
          // ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'User',
          ),
        ],
      ),
      body: <Widget>[
        const UserProfile(),
        // const ContactUs(),
        const AboutUser()
      ][currentPageIndex],
    );
  }
}
