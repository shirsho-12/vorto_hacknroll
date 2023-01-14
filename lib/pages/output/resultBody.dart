import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_hackathon/constants.dart';



class ResultBody extends StatefulWidget {
  const ResultBody({Key? key}) : super(key: key);

  @override
  _ResultBodyState createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(items: [
          Container(
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 2),
              
            ),

            child: Text('Page 1'),
          )
        ], 
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height- 100,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        )
        )
      ],
    );
  }    
  
}