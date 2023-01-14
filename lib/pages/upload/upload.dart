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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kTextColor, size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: UploadBody(),
    );
  }
}