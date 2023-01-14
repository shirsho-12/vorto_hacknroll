import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_hackathon/constants.dart';

import '../output/result.dart';

class UploadBody extends StatefulWidget {
  const UploadBody({Key? key}) : super(key: key);

  @override
  State<UploadBody> createState() => _UploadBodyState();
}

class _UploadBodyState extends State<UploadBody> {
  // FilePickerResult? result;
  // String docText = "";
  File? Afile;

  // // method to get the text from pdf
  // Future<String> getSummaryFromFile() async {
  //   final summarizer = SummarizerRestClient(docText: docText);
  //   final summary = await summarizer.getSummaryFromFile();
  //   return summary;
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Vorto',
            style: TextStyle(
                fontSize: 70,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),

          const Text(
            'Notes to slides',
            style: TextStyle(
                fontSize: 20, color: Colors.grey, fontFamily: 'Poppins'),
          ),

          const SizedBox(
            height: 90,
          ),

          const Text(
            'Upload your file here',
            style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
          ),

          const SizedBox(height: 40),

          TextButton(
            onPressed: () async {
              FilePickerResult? inputFile =
                  await FilePicker.platform.pickFiles();
              if (inputFile != null) {
                File file = File(inputFile.files.single.path!);

                // PDFDoc doc = await PDFDoc.fromFile(file);
                // String text = await doc.text;

                setState(() {
                  // result = inputFile;
                  // docText = text;
                  Afile = file;
                });

                // print(docText);
                // print(doc.length);
                // print('File inputted');
              } else {
                // User canceled the picker
              }
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 2),
                ),
                child: const Text(
                  'Select...',
                  style: TextStyle(
                      fontSize: 20, color: kTextColor, fontFamily: 'Poppins',),
                )),
          ),

          //display file name
          if (Afile != null)
            Text(
              // result!.files.single.name,
              Afile!.path.split('/').last,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 12, fontFamily: 'Poppins'),
            ),

          const SizedBox(height: 45),

          TextButton(
            onPressed: () async {
              // print(docText);
              // final summarizer = SummarizerRestClient(docText: docText);
              // final summary = await summarizer.getSummaryFromFile();
              // print(summary);
              if (Afile != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(file: Afile!)));
              } else {
                // devtoo('No file selected');
              }
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 122, 122, 122)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: kPrimaryColor, width: 2),
                ),
                child: const Text(
                  'Generate ',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white, fontFamily: 'Poppins'),
                )),
          ),
        ],
      ),
    );
  }
}
