// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  // String? get _errorText {
  //   final enteredEmail = emailController.value.toString();
  //   final enteredPasssword = passwordController.value.toString();
  //   if (enteredEmail.isEmpty || enteredPasssword.isEmpty) {
  //     return 'Either password or email is empty';
  //   }
  //   if (enteredPasssword.length < 8 || enteredEmail.length < 9) {
  //     return 'fill the right details';
  //   }
  //   return null;
  // }

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String? _email;
  String? _password;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    var borderRadiusSize = BorderRadius.circular(30);
    TextStyle greyMinStyle = TextStyle(
        color: Colors.grey[500], fontSize: 10.0, fontWeight: FontWeight.bold);
    TextStyle orangeMinStyle = const TextStyle(
        color: Colors.orange, fontSize: 10.0, fontWeight: FontWeight.bold);

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.grey[50],
          ),
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.red, Color.fromARGB(255, 255, 163, 59)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0, 1],
                    )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: deviceHeight * 0.12,
                            bottom: deviceWidth * 0.12,
                            left: deviceWidth * 0.3,
                            right: deviceWidth * 0.3,
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(
                                  'lib/assets/images/product-placeholder.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 40,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: deviceHeight * 0.06,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: borderRadiusSize,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(1, 4),
                      ),
                    ]
                    // boxShadow: :
                    ),
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: ' Enter your Email',
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: greyMinStyle,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      size: 15,
                    ),
                    fillColor: Colors.white,
                    filled: false,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: borderRadiusSize, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(1, 4),
                  ),
                ]),
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.06,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: ' Enter your Email',
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: greyMinStyle,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    prefixIcon: const Icon(
                      Icons.key_outlined,
                      size: 15,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Container(
                  height: deviceHeight * 0.03,
                  child: GestureDetector(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: deviceWidth * 0.1,
                        ),
                        child: Text(
                          'Forgot Password ?',
                          style: greyMinStyle,
                        ),
                      ),
                    ),
                    onTap: () {
                      print('Chiboy');
                    },
                  )),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Container(
                height: deviceHeight * 0.06,
                width: deviceWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: borderRadiusSize,
                  color: Colors.black,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //print('Hi there');
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: borderRadiusSize)),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.red, Colors.yellow]),
                        borderRadius: borderRadiusSize),
                    child: Container(
                      // width: 00,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
              ),
              Container(
                height: deviceHeight * 0.03,
                child: Center(
                  child: RichText(
                    text: TextSpan(style: greyMinStyle, children: [
                      const TextSpan(
                        text: 'Don\'t have an account ? ',
                      ),
                      TextSpan(
                        text: ' Register',
                        style: orangeMinStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('Register Page');
                          },
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.04,
              )
            ],
          ),
        ),
      ),
    );
  }
}
