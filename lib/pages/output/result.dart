import 'package:flutter/material.dart';
import 'package:project_hackathon/constants.dart';
import 'package:project_hackathon/pages/output/resultBody.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Vorto',
          style:
              TextStyle(color: kTextColor, fontSize: 40, fontFamily: 'Poppins'),
        ),
      ),
      body: const ResultBody(),
    );
  }
}
