import 'dart:convert';

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_hackathon/ml/textToImage.dart';
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
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      titleList[0],
                      style: const TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: GPT3Model.generateImage(titleList[0]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Image.network(jsonDecode(snapshot.data!)["data"][0]["url"].toString(), height: 200, width: 200,);
                        }
                        else if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        else {
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                         
                        );
                        }
                      }
                    ),
                    const SizedBox(height: 20),
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
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
          
                  children: [
                    Text(
                      titleList[1],
                      style: const TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                   FutureBuilder(
                      future: GPT3Model.generateImage(titleList[1]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Image.network(jsonDecode(snapshot.data!)["data"][0]["url"].toString(), height: 200, width: 200,);
                        }
                        else if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        else {
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                         
                        );
                        }
                      }
                    ),
                   const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: 
                          ListView.builder(itemBuilder: (context, index) {
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
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titleList[2],
                      style: const TextStyle(fontSize: 25, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                   FutureBuilder(
                      future: GPT3Model.generateImage(titleList[2]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          return Image.network(jsonDecode(snapshot.data!)["data"][0]["url"].toString(), height: 200, width: 200,);
                        }
                        else if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        else {
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                         
                        );
                        }
                      }
                    ),
                    const SizedBox(height: 20),
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
