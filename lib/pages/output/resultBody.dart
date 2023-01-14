import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResultBody extends StatefulWidget {
  final String summary;
  const ResultBody({Key? key, required this.summary}) : super(key: key);

  @override
  State<ResultBody> createState() => _ResultBodyState();
}

class _ResultBodyState extends State<ResultBody> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    const Text(
                      'Topic',
                      style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.summary,
                      // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style:
                          const TextStyle(fontSize: 15, fontFamily: 'Poppins'),
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

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
