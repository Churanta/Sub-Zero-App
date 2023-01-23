import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sunzero/pages/details.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 8, // horizontal spacing
                mainAxisSpacing: 8, // vertical spacing
                childAspectRatio: 3 / 2, // 3:2 aspect ratio
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    print('Item tapped: $index');
                    // Show progress bar
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    // Wait for 3 seconds
                    await Future.delayed(Duration(seconds: 3));
                    // Dismiss progress bar and navigate to next page
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Remote(index)),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blue[100 * (index + 1 % 9)],
                      child: Center(child: Text('Item $index')),
                    ),
                  ),
                );
              },
            )));
  }

  // ListView _buildListView(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (_, index) {
  //       return Card(
  //         color: Colors.blue[30],
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(15.0),
  //         ),
  //         elevation: 2,
  //         child: ListTile(
  //             title: Text('Device number #$index'),
  //             leading: const Icon(Icons.water),
  //             trailing: const Icon(Icons.arrow_forward_ios),
  //             onTap: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => Remote(index)));
  //             }),
  //       );
  //     },
  //   );

  // }
  // ListView _buildListView(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: 6,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Wrap(
  //         spacing: 8, // gap between adjacent chips
  //         runSpacing: 4, // gap between lines
  //         children: <Widget>[
  //           Container(
  //             width: MediaQuery.of(context).size.width / 2 - 12,
  //             height: 150,
  //             decoration: BoxDecoration(
  //               color: Colors.blue[100 * (index % 9)],
  //             ),
  //             child: Center(child: Text('Item $index')),
  //           ),
  //           // Add other widgets here
  //         ],
  //       );
  //     },
  //   );
  // }
}




// child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       color: Colors.blue[100 * (index + 1 % 9)],
//                       child: Center(child: Text('Item $index')),
//                     ),
//                   ),