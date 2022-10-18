import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/screens/slider_dot.dart';
import 'package:weather_app/screens/weather_app.dart';
// import 'package:weather_app/screens/weather_app.dart';
import '../models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  String bgImg = "";

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (locationList[_currentPage].weatherType == "Night") {
      bgImg = "assets/night.jpg";
    } else if (locationList[_currentPage].weatherType == "Cloudy") {
      bgImg = "assets/cloudy.jpeg";
    } else if (locationList[_currentPage].weatherType == "Sunny") {
      bgImg = "assets/sunny.jpg";
    } else if (locationList[_currentPage].weatherType == "Rainy") {
      bgImg = "assets/rainy.jpg";
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white, size: 30),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/menu.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
          )
        ],
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black38),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.fromLTRB(14, 135, 0, 0),
              child: Row(
                children: [
                  for (int i = 0; i < locationList.length; i++)
                    if (i == _currentPage) SliderDot(true) else SliderDot(false)
                ],
              ),
            ),
            PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: _onPageChanged,
                itemCount: locationList.length,
                itemBuilder: (ctx, i) => WeatherApp(i))
          ],
        ),
      ),
    );
  }
}
