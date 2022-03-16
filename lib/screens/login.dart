// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_screen_2/screens/recover_password_screen.dart';
import 'package:sign_in_screen_2/screens/welcome_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _loginAuthMode = true;
  bool _showEmailError = false;
  bool _showPasswordError = false;
  bool _showConfirmPasswordError = false;
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  dynamic _groupValue = -1;

  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
    if (!_showEmailError && !_showPasswordError) {
      Navigator.pushReplacementNamed(context, WelcomeScreen.routeName,
          arguments: User(
            emailAdress: _emailController.text.toString(),
            password: _passwordController.text.toString(),
          ));
    }
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
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
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
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 40,
                              ),
                              child: Text(
                                _loginAuthMode ? 'Login' : 'Sign Up',
                                style: const TextStyle(
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
                  height: deviceHeight * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: deviceHeight * 0.54,
                  width: deviceWidth * 0.9,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: _loginAuthMode
                          ? deviceHeight * 0.06
                          : deviceHeight * 0.03,
                    ),
                    child: SingleChildScrollView(
                      child: Column(children: [
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
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            style: const TextStyle(fontSize: 10),
                            decoration: InputDecoration(
                              //labelText: ' Enter your Email',

                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: greyMinStyle,
                              contentPadding: const EdgeInsets.all(0),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              filled: false,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                setState(() {
                                  _showEmailError = true;
                                });
                              } else {
                                setState(() {
                                  _showEmailError = false;
                                });
                              }
                              return null;
                            },
                          ),
                        ),
                        Visibility(
                            visible: _showEmailError,
                            child: const Text(
                              "invalid email",
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            )),
                        SizedBox(
                          height: deviceHeight * 0.03,
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
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            controller: _passwordController,
                            style: const TextStyle(fontSize: 10),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: greyMinStyle,
                              contentPadding: const EdgeInsets.all(0),
                              prefixIcon: const Icon(
                                Icons.key_outlined,
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              filled: false,
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                setState(() {
                                  _showPasswordError = true;
                                });
                              } else {
                                setState(() {
                                  _showPasswordError = false;
                                });
                              }

                              return null;
                            },
                          ),
                        ),
                        Visibility(
                            visible: _showPasswordError,
                            child: const Text(
                              "Incorrect Password!",
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            )),
                        Visibility(
                          visible: !_loginAuthMode,
                          child: SizedBox(
                            height: deviceHeight * 0.03,
                          ),
                        ),
                        Visibility(
                          visible: !_loginAuthMode,
                          child: Container(
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
                                ]),
                            width: deviceWidth * 0.8,
                            height: deviceHeight * 0.06,
                            child: TextFormField(
                              maxLines: 1,
                              obscureText: true,
                              style: const TextStyle(fontSize: 10),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: greyMinStyle,
                                contentPadding: const EdgeInsets.all(0),
                                prefixIcon: Icon(
                                  !_loginAuthMode ? Icons.key_outlined : null,
                                  size: 15,
                                ),
                                fillColor: Colors.white,
                                filled: false,
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    value != _passwordController.text) {
                                  setState(() {
                                    _showConfirmPasswordError = true;
                                  });
                                } else {
                                  setState(() {
                                    _showConfirmPasswordError = false;
                                  });
                                }

                                return null;
                              },
                            ),
                          ),
                        ),
                        Visibility(
                            visible: _showConfirmPasswordError,
                            child: const Text(
                              "Passwords do not match!",
                              style: TextStyle(color: Colors.red, fontSize: 10),
                            )),
                        SizedBox(
                          height: !_loginAuthMode ? deviceHeight * 0.03 : 02,
                        ),
                        Visibility(
                            visible: !_loginAuthMode,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: deviceWidth * 0.06,
                                right: deviceWidth * 0.03,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Gender :',
                                      style: greyMinStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Transform.scale(
                                      scale: 0.5,
                                      child: RadioListTile(
                                        value: 0,
                                        groupValue: _groupValue,
                                        title: const Text("Male",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15,
                                            )),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _groupValue = newValue;
                                          });
                                        },
                                        selected: true,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: RadioListTile(
                                      visualDensity:
                                          const VisualDensity(horizontal: -4.0),
                                      value: 1,
                                      groupValue: _groupValue,
                                      title: Text(
                                        "Female",
                                        style: greyMinStyle,
                                      ),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _groupValue = newValue;
                                        });
                                      },
                                      selected: false,
                                    ),
                                  )
                                ],
                              ),
                            )),
                        Visibility(
                          visible: !_loginAuthMode,
                          child: SizedBox(
                            height: deviceHeight * 0.03,
                          ),
                        ),
                        Visibility(
                            visible: !_loginAuthMode, child: Text('drop down')),
                        Visibility(
                          visible: !_loginAuthMode,
                          child: SizedBox(
                            height: deviceHeight * 0.03,
                          ),
                        ),
                        Visibility(
                            visible: !_loginAuthMode, child: Text('DOB')),
                        Visibility(
                          visible: _loginAuthMode,
                          child: SizedBox(
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
                                  Navigator.pushNamed(
                                      context, RecoverPasswordScreen.routeName);
                                },
                              )),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.06,
                        ),
                        Container(
                          height: deviceHeight * 0.06,
                          width: deviceWidth * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: borderRadiusSize,
                            color: Colors.black,
                          ),
                          child: ElevatedButton(
                            onPressed: _submit,
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
                                child: Text(
                                  _loginAuthMode ? 'Log In' : 'Sign Up',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.035,
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                          child: Center(
                            child: _loginAuthMode
                                ? RichText(
                                    text: TextSpan(
                                        style: greyMinStyle,
                                        children: [
                                          const TextSpan(
                                            text: 'Don\'t have an account ? ',
                                          ),
                                          TextSpan(
                                            text: ' Register',
                                            style: orangeMinStyle,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                setState(() {
                                                  _loginAuthMode = false;
                                                });
                                              },
                                          ),
                                        ]),
                                  )
                                : RichText(
                                    text: TextSpan(
                                        style: greyMinStyle,
                                        children: [
                                          const TextSpan(
                                            text: 'Have an account ? ',
                                          ),
                                          TextSpan(
                                            text: ' Login',
                                            style: orangeMinStyle,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                setState(() {
                                                  _loginAuthMode = true;
                                                });
                                              },
                                          ),
                                        ]),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.04,
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                  child: const Center(
                      child: Text(
                    'Chiboy @ Copyright',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  String emailAdress;
  String password;
  User({required this.emailAdress, required this.password});
}
