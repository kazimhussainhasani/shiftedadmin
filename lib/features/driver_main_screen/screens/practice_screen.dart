import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Container(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffFFFFFF),
                      border: Border.all(color: Colors.grey, width: 0.25),
                    ),
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                "Large Truck",
                                style: GoogleFonts.kadwa(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "up to 5 ton",
                                style: GoogleFonts.kadwa(
                                    fontSize: 20, color: Color(0xff503E9D)),
                              ),
                              Image.asset("assets/images/EmptyBox.png")
                            ]),
                        SizedBox(
                          width: 20,
                        ),
                        // Wrap(
                        //   direction: Axis.vertical,
                        //   children: [
                        //     Row(
                        //       children: [
                        //         CardItemWidget(name: "Sofas"),
                        //         SizedBox(
                        //           width: 6,
                        //         ),
                        //         CardItemWidget(name: "Refrigerator"),
                        //       ],
                        //     ),
                        //     SizedBox(
                        //       height: 8,
                        //     ),
                        //     CardItemWidget(name: "Washing Machine"),
                        //     SizedBox(
                        //       height: 8,
                        //     ),
                        //     Row(
                        //       children: [
                        //         CardItemWidget(name: "Tables"),
                        //         SizedBox(
                        //           width: 6,
                        //         ),
                        //         CardItemWidget(name: "Dryers"),
                        //         SizedBox(
                        //           width: 6,
                        //         ),
                        //         CardItemWidget(name: "Pallets"),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  left: 100,
                  child: Container(
                    clipBehavior: Clip.none,
                    height: 100,
                    color: Colors.red,
                    child: Text("data"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
