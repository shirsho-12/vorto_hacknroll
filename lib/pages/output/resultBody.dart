import 'dart:io';

import 'package:flutter/material.dart';

import 'package:project_hackathon/constants.dart';



class ResultBody extends StatefulWidget {
  const ResultBody({Key? key}) : super(key: key);

  @override
  _ResultBodyState createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          TextButton(
            onPressed: () {

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kTextColor, width: 2),
              ),

              child: const Text('Download', style: TextStyle(fontSize: 20, color: kTextColor, fontFamily: 'Poppins'),)
              ),
          ),

        ],
      ),
    );
  }    
  
}