import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_hackathon/constants.dart';

import '../output/result.dart';

class UploadBody extends StatefulWidget {
  const UploadBody({Key? key}) : super(key: key);

  @override
  _UploadBodyState createState() => _UploadBodyState();
}

class _UploadBodyState extends State<UploadBody> {
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Notes to Slides',
            style: TextStyle(
                fontSize: 50,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 50,
          ),

          const Text(
            'Upload your file here',
            style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
          ),

          const SizedBox(height: 20),

          TextButton(
            onPressed: () async {
              FilePickerResult? inputFile =
                  await FilePicker.platform.pickFiles();
              if (inputFile != null) {
                setState(() {
                  result = inputFile;
                });
                File file = File(inputFile.files.single.path!);
                print('File inputted');
              } else {
                // User canceled the picker
              }
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: kTextColor, width: 2),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(
                      fontSize: 20, color: kTextColor, fontFamily: 'Poppins'),
                )),
          ),

          //display file name
          if (result != null)
            Text(
              result!.files.single.name,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 12, fontFamily: 'Poppins'),
            ),

          const SizedBox(height: 40),

          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Result()));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.black, Color(0xFF434343)],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: kTextColor, width: 2),
                ),
                child: const Text(
                  'Generate',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: 'Poppins'),
                )),
          ),
        ],
      ),
    );
  }
}
