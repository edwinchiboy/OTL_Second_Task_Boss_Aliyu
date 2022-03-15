import 'package:flutter/material.dart';

class RecoverPasswordScreen extends StatelessWidget {
  const RecoverPasswordScreen({Key? key}) : super(key: key);
  static const routeName = 'RecoverPasswordScreen';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Recover Password here")),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        height: deviceHeight,
        width: deviceWidth,
        child: const Center(
          child: Text('Recover password page'),
        ),
      ),
    );
  }
}
