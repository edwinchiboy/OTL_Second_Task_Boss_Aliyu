import 'package:flutter/material.dart';
import 'package:sign_in_screen_2/screens/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("User Sign In Details")),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
          ),
          height: deviceHeight,
          width: deviceWidth,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('User Email: ' + user.emailAdress),
                Text('User Password: ' + user.password),
                Text('User Gender: ' + user.gender),
                Text('User DOB: ' + user.dOB),
                Text('User Location: ' + user.location),
              ],
            ),
          )),
    );
  }
}
