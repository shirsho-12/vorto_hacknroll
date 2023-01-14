import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TextToImage{

  final String docText;

  TextToImage({
    required this.docText,
  });

  static Future<Uint8List> getImageFromText(String text) async {
    final response = await http.post(
      Uri.parse("http://172.31.67.78:2500/main"),
      body : {  
        'text': text,
      },
    );

    return response.bodyBytes;
  }
}

// void main(List<String> args) {
// final text = "Hello";
//   TextToImage.getImageFromText(text).then((value) => print(value));
// }
