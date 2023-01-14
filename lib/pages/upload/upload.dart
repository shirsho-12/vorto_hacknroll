import 'package:flutter/material.dart';
import 'package:project_hackathon/constants.dart';
import 'package:project_hackathon/pages/upload/uploadBody.dart';


class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Vorto', style: TextStyle(color: kTextColor, fontSize: 40, fontFamily: 'Poppins'), ),
      ),
      body: UploadBody(),
    );
  }
}