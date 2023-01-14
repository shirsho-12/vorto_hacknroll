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
      Uri.parse("https://api.meaningcloud.com/summarization-1.0"),
      body: {        
      },
    );

    return response.bodyBytes;
  }

}