import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_text/pdf_text.dart';

class SummarizerRestClient {
  // MeaningCloud Summarization API 1.0

  final Map<String, String> data;
  final String docText;

  SummarizerRestClient({
    required this.docText,
    this.data = const {},
  });

  // static final _client = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://api.meaningcloud.com/',
  //     followRedirects: false,
  //     validateStatus: (status) {
  //       return status! < 500;
  //     },
  //     // headers: {

  //     // },
  //   ),
  // );

  static Future<String> getSummaryFromFile(String text) async {
    final response = await http.post(
      Uri.parse("https://api.meaningcloud.com/summarization-1.0"),
      body: {        
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'txt': text,
        'lang': "en",
        'sentences': '6',
      },
    );
    print(response);

    return response.body;
  }

  static Future<String> getSummaryFromPDF(File file) async {
    PDFDoc doc = await PDFDoc.fromFile(file);
                String text = await doc.text;
    final response = await http.post(
      Uri.parse("https://api.meaningcloud.com/summarization-1.0"),
      body: {        
        'key': "cfabb09ccf4d02cbe647f19c0593fc35",
        'txt': text,
        'lang': "en",
        'sentences': '6',
      },
    );
    print(response);

    return response.body;
  }
}

  

// void main(List<String> args) {
//   final summarizer = SummarizerRestClient(docText: args[0]);
//   summarizer
//       .getSummaryFromFile(
//           docText)
//       .then((summary) {
//     print(summary);
//   });
// }
