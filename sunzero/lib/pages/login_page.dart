import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sunzero/components/my_button.dart';
import 'package:sunzero/components/my_textfield.dart';
import 'package:sunzero/pages/MainPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //signin user
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                //logo
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 120,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                //welcome User
                Text(
                  'Hey There Welcome!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                //username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                //password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'password/otp',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                //button
                // MyButton(
                //   onTap: signUserIn,
                // ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150.0, vertical: 20.0),
                  ),
                  child: const Text('SignIn'),
                ),

                const SizedBox(height: 70),

                //contact us
                // Text("Contact us")
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.7,
                      color: Colors.grey[400],
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Contact us',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.7,
                        color: Colors.grey[400],
                      ),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
