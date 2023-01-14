import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  // startTime() async {
  //   var duration = const Duration(seconds: 3);
  //   return Timer(duration, route);
  // } route() {
  //   Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) => Result()
  //     )
  //   );
  // }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Vorto",
              style: TextStyle(
                  fontSize: 50.0, color: Colors.black, fontFamily: 'Poppins'),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            SpinKitFoldingCube(
              color: Colors.black,
              size: 50.0,
            ),
            SizedBox(height: 20.0),
            Text('Your file is being processed',
                style: TextStyle(
                    color: kTextColor, fontSize: 20.0, fontFamily: 'Poppins')),
          ],
        ),
      ),
    );
  }
}
