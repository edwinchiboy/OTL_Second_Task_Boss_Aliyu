import 'package:flutter/material.dart';
import 'package:sign_in_screen_2/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //final Helper _helper = Helper();

  final bool _isLoading = false;
  late final List displayName;
  // Function read = LogInScreen.readContent();

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getStringList('displayName')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("User Sign In Details")),
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
                    Text('User Email: ' + user.emailAdress),
                    Text('User Password: ' + user.password),
                    Text('User Gender: ' + user.gender),
                    Text('User DOB: ' + user.dOB),
                    Text('User Location: ' + user.location),
                    Text('Read from device: ${displayName[0]}'),
                    Text('Read from device: ${displayName[1]}'),
                    Text('Read from device: ${displayName[2]}'),
                    Text('Read from device: ${displayName[3]}'),
                    Text('Read from device: ${displayName[4]}'),
                  ],
                ),
              )),
    );
  }
}
