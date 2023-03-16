import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BestOffers extends StatefulWidget {
  const BestOffers({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BestOffers> {
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
        child: CarouselSlider(
          carouselController: _controller,
          items: items
              .map(
                (image) => Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(image.toString()),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Bathroom Cleaning',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF1D1D1D),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            'Free Fan Cleaning & More',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF1D1D1D),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.9,
            // autoPlay: true,
          ),
        ),
      ),
    );
  }
}
