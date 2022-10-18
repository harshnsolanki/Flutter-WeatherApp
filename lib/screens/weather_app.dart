import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/models.dart';

class WeatherApp extends StatefulWidget {
  final int index;
  // ignore: use_key_in_widget_constructors
  const WeatherApp(this.index);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        // Main Outer Column
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              // Main Innner Column
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Text(locationList[widget.index].city,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(locationList[widget.index].dateTime,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(locationList[widget.index].temparature,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 85,
                            fontWeight: FontWeight.w300)),
                    Row(
                      children: [
                        SvgPicture.asset(
                          locationList[widget.index].iconUrl,
                          height: 30,
                          width: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(locationList[widget.index].weatherType,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            // Last Weather Info Column
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white30)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Wind",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(locationList[widget.index].wind.toString(),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("km/h",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Stack(children: [
                        Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38)),
                        ),
                        Container(
                          height: 4,
                          width: 15,
                          color: Colors.blue[300],
                        )
                      ])
                    ],
                  ),
                  Column(
                    children: [
                      Text("Rain",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(locationList[widget.index].rain.toString(),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("%",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Stack(children: [
                        Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38)),
                        ),
                        Container(
                          height: 4,
                          width: 15,
                          color: Colors.blue[900],
                        )
                      ])
                    ],
                  ),
                  Column(
                    children: [
                      Text("Humidity",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(locationList[widget.index].humidity.toString(),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("%",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 3,
                      ),
                      Stack(children: [
                        Container(
                          height: 4,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white38)),
                        ),
                        Container(
                          height: 4,
                          width: 4,
                          color: Colors.red[900],
                        )
                      ])
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
