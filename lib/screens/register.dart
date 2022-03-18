import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Register here")),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        height: deviceHeight,
        width: deviceWidth,
        child: const Center(
          child: Text('Register page'),
        ),
      ),
    );
  }
}
