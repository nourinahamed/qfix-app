import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qfixapp/home/widgets/best-offers.dart';
import 'package:qfixapp/home/widgets/home-page-slider.dart';
import 'package:qfixapp/home/widgets/service-category-icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QFix',
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
              fontSize: 39,
              fontWeight: FontWeight.bold,
              color: Color(0xff022C43),
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 170,
            width: 375,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD700),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(65),
                bottomRight: Radius.circular(65),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search for service..',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Service Location near - '),
                        Text(
                          'Jaipur 302019',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ServiceCategoryIcon(
                iconpath: 'assets/images/service-icon-hygiene.png',
                title: 'Hygiene',
              ),
              ServiceCategoryIcon(
                iconpath: 'assets/images/service-icon-electrical.png',
                title: 'Electrical',
              ),
              ServiceCategoryIcon(
                iconpath: 'assets/images/service-icon-appliances.png',
                title: 'Appliances',
              ),
              ServiceCategoryIcon(
                iconpath: 'assets/images/service-icon-plumbing.png',
                title: 'Plumbing',
              ),
              ServiceCategoryIcon(
                iconpath: 'assets/images/service-icon-air-conditioner.png',
                title: 'AC Repair',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 200,
            child: MyHomePage(),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best Offers',
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff383838),
                    ),
                  ),
                ),
                Text(
                  'Hygienic & single-use products | low-contact services',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 11,
                      color: Color(0xff383838),
                    ),
                  ),
                ),
                SizedBox(height: 179, child: BestOffers()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
