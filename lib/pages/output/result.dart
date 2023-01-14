import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_hackathon/constants.dart';
import 'package:project_hackathon/ml/summarizer.dart';
import 'package:project_hackathon/pages/output/resultBody.dart';

import '../loading.dart';

class Result extends StatefulWidget {
  // final String text;
  final File file;
  const Result({Key? key, required this.file}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // File file = File('assets/sample.pdf');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        title: const Text(
          'Vorto',
          style:
              TextStyle(color: kTextColor, fontSize: 40, fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
          future: SummarizerRestClient.getSummaryFromPDF(widget.file),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingScreen());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else if (snapshot.hasData) {
              return ResultBody(summary: snapshot.data!);
            } else {
              return const Center(child: Text('No data'));
            }
          }),
    );
  }
}
