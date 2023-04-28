//This page is for user details
import 'package:flutter/material.dart';
import 'package:login_register/Password.dart';
import 'package:login_register/providers/authProvider.dart';
import 'package:provider/provider.dart';

class AboutUser extends StatefulWidget {
  const AboutUser({super.key});

  @override
  State<AboutUser> createState() => _AboutUserState();
}

class _AboutUserState extends State<AboutUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(20),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      fit: BoxFit.fill))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(children: [
              Expanded(
                  child: Divider(
                thickness: 0.9,
                color: Colors.grey[400],
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  context.watch<UserProvider>().user.uname ?? "",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.9,
                  color: Colors.grey[400],
                ),
              )
            ]),
          ),
          Text('Email: ${context.watch<UserProvider>().user.uemail ?? ""}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

          const SizedBox(height: 70),
          //card
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Mobile Number'),
                  subtitle: Text(
                    context.watch<UserProvider>().user.uphone ?? "",
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Area'),
                  subtitle: Text(
                    context.watch<UserProvider>().user.city ?? "",
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.devices),
                  title: Text('Number of Devices'),
                  subtitle: Text(
                      context.watch<UserProvider>().user.totaldev.toString()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  textStyle: const TextStyle(fontSize: 15),
                  // minimumSize: Size.fromHeight(75),
                  shape: const StadiumBorder()),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPassword()),
                );
              },
              child: const Text('Update Password'))
        ],
      ),
    ));
  }
}
