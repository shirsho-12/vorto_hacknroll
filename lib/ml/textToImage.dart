import 'dart:convert';
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


class GPT3Model {
   static String apiEndPoint = "v1/images/generations";
  static String base = "api.openai.com";
  
  static Future<String> generateImage(String text) async {
    final response = await http.post(Uri.https(base, apiEndPoint), 
    headers: {
      // "apiKey" : "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",
      // "organization" : "org-n1MyOltHgsrGrpEmAOQXBYG1",
       'Authorization': 'Bearer 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',
        'Accept': 'application/json',
        'content-type': 'application/json',
    },
    body: jsonEncode({
      "prompt": text,
      "n" : 2,
      "size" : "256x256",
      "response_format" : "url",
    }));
    print(response);
    return response.body;
  }
}


void main(List<String> args) {
final text = "Delectable Bowl Resonated";
  // TextToImage.getImageFromText(text).then((value) => print(value));
  GPT3Model.generateImage(text).then((value) => print(value));
}