import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  //add the image urls here
  List items = [
    'https://thumbs.dreamstime.com/b/love-birds-colorful-background-61784122.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxRdld8vauUUwUShzG94eNfH6MsOJbWDY6w&usqp=CAU',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-pet-birds-lead-1572839035.jpg?crop=0.666xw:1.00xh;0,0&resize=640:*',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: items
                  .map(
                    (image) => Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(image.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                // autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),

            //use animated dots indicator
            // DotsIndicator(dotsCount: items.length),
            DotsIndicator(
              dotsCount: items.length,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            // SmoothPageIndicator(
            //     controller: _controller,
            //     count: items.length,
            //     effect: const WormEffect(
            //       dotHeight: 16,
            //       dotWidth: 16,
            //       type: WormType.thin,
            //       // strokeWidth: 5,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
