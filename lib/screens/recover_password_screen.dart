import 'package:flutter/material.dart';
import 'package:sign_in_screen_2/screens/login.dart';

// ignore: must_be_immutable
class RecoverPasswordScreen extends StatefulWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);
  static const routeName = 'RecoverPasswordScreen';

  @override
  State<RecoverPasswordScreen> createState() => _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends State<RecoverPasswordScreen> {
  final bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    LogIn userLogin = ModalRoute.of(context)!.settings.arguments as LogIn;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("user's Log In Details")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
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
                    Text('User Email: ' + userLogin.emailAdress),
                    Text('User Password: ' + userLogin.password),
                  ],
                ),
              )),
    );
  }
}
