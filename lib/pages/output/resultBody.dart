import 'dart:convert';

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rake/rake.dart';

class ResultBody extends StatefulWidget {
  final String summary;
  const ResultBody({Key? key, required this.summary}) : super(key: key);

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  @override
  Widget build(BuildContext context) {
    Map valueMap = jsonDecode(widget.summary);
    // print(valueMap);
    // print(valueMap['summary']);
    List<String> summaryList = valueMap['summary'].split('.');
    List<String> outputList = [];
    for (int i = 0; i < summaryList.length; i++) {
      summaryList[i] = summaryList[i].trim();
      summaryList[i] = summaryList[i].replaceAll(']', '');
      summaryList[i] = summaryList[i].replaceAll('[', '');
      summaryList[i] = summaryList[i].replaceAll('\n', '');
      if (summaryList[i].length > 7) {
        outputList.add(summaryList[i]);
      }
    }
    summaryList = outputList;
    List<String> titleList = [];
    final rake = Rake();
    for (int i = 0; i < 6; i+= 2) {
      final keywords = rake.rank('${summaryList[i]} ${summaryList[i + 1]}');
      titleList.add(keywords[0].toTitleCase());
      print(keywords);
    }
    // for (var v in summaryList) {
    //   print(v);
    // }
    return ListView(
      children: [
        CarouselSlider(
            items: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                // child: Column(
                //   children: [
                //     const Text(
                //       'Topic',
                //       style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                //     ),
                //     const SizedBox(height: 20),
                //     Text(
                //       valueMap['summary'],
                //       // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                //       style:
                //           const TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                //     ),
                //   ],
                // ),
                child: Column(
                  children: [
                     Text(
                      titleList[0],
                      style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return UnorderedListItem(text: summaryList[index]);
                      }, itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                // child: Column(
                //   children: [
                //     const Text(
                //       'Topic',
                //       style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                //     ),
                //     const SizedBox(height: 20),
                //     Text(
                //       valueMap['summary'],
                //       // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                //       style:
                //           const TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                //     ),
                //   ],
                // ),
                child: Column(
                  children: [
                    Text(
                      titleList[1],
                      style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return UnorderedListItem(text: summaryList[2 + index]);
                      }, itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                // child: Column(
                //   children: [
                //     const Text(
                //       'Topic',
                //       style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                //     ),
                //     const SizedBox(height: 20),
                //     Text(
                //       valueMap['summary'],
                //       // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                //       style:
                //           const TextStyle(fontSize: 15, fontFamily: 'Poppins'),
                //     ),
                //   ],
                // ),
                child: Column(
                  children: [
                    Text(
                      titleList[2],
                      style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(itemBuilder: (context, index) {
                        return UnorderedListItem(text: summaryList[4 + index]);
                      }, itemCount: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height - 100,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ))
      ],
    );
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• ",
            style: TextStyle(fontSize: 15, fontFamily: 'Poppins')),
        Expanded(
          child: Text(text,
              style:
                 const TextStyle(fontSize: 15, fontFamily: 'Poppins')),
        ),
      ],
    );
  }
}
