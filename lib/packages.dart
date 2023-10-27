import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPackages extends StatefulWidget {
  const MyPackages({Key? key}) : super(key: key);

  @override
  State<MyPackages> createState() => _MyPackagesState();
}

class _MyPackagesState extends State<MyPackages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: CarouselSlider(
            unlimitedMode: true,
            slideTransform: const CubeTransform(),
            slideIndicator: CircularSlideIndicator(
              padding: const EdgeInsets.only(bottom: 20),
              currentIndicatorColor: Colors.white,
              indicatorBackgroundColor: const Color(0xDA2A2A2A),
            ),
            children: const [
              CustomContainer(
                imageAddress: 'images/bodybuilding.webp',
                heading: 'Body Building',
                text:
                    'It is long estabas and many lished fact will been distracted atempts by them content system and looking for its layout.',
              ),
              CustomContainer(
                imageAddress: 'images/cardio.webp',
                heading: 'Cardio Training',
                text:
                    'It is long estabas and many lished fact will been distracted atempts by them content system and looking for its layout.',
              ),
              CustomContainer(
                imageAddress: 'images/strength.jpg',
                heading: 'Strength Training',
                text:
                    'It is long estabas and many lished fact will been distracted atempts by them content system and looking for its layout.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({this.imageAddress, this.heading, this.text});
  final String? imageAddress, heading, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1D1D1D),
      child: Center(
        child: Container(
          height: 700,
          width: 450,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageAddress.toString(),
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                heading.toString(),
                style: GoogleFonts.bebasNeue(fontSize: 52, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text.toString(),
                style: const TextStyle(fontSize: 20, color: Color(0xFF939393)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
