import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadLocalStorage extends StatefulWidget {
  const ReadLocalStorage({Key? key}) : super(key: key);
  static const routeName = '/read';

  @override
  State<ReadLocalStorage> createState() => _ReadLocalStorageState();
}

class _ReadLocalStorageState extends State<ReadLocalStorage> {
  final bool _isLoading = false;
  List? displayName;
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
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("User Sign In Details from device")),
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
                child: ListView.builder(
                    itemCount: displayName?.length ?? 0,
                    itemBuilder: (ctx, i) =>
                        Center(child: Text('${displayName![i]}'))),
              )),
    );
  }
}
