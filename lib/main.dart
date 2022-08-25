import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';

// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    title: "Weather App",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;
  late VideoPlayerController _controller;
  String url =
      "https://api.openweathermap.org/data/2.5/weather?lat=23.0225&lon=72.5714&units=imperial&appid=eb9794fa468f160a17473c8e18e23e97";

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(url));
    var results = jsonDecode(response.body);
    setState(() {
      temp = results['main']['temp'];
      description = results['weather'][0]['description'];
      currently = results['weather'][0]['main'];
      humidity = results['main']['humidity'];
      windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather();
    _controller = VideoPlayerController.asset("Assets/cloudy.mp4")
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller)),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                    ],
                        stops: const [
                      0.0,
                      1.0,
                    ])),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Currently in Ahmedabad",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          temp != null
                              ? "${((temp - 32) * 5 / 9).floor()}\u00B0 C"
                              : "Loading",
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          currently != null ? currently.toString() : "Loading",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    // ignore: deprecated_member_use
                    leading: const FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: const Text("Temprature"),
                    trailing: Text(temp != null
                        ? "${((temp - 32) * 5 / 9).floor()}\u00B0 C"
                        : "Loading"),
                  ),
                  ListTile(
                    // ignore: deprecated_member_use
                    leading: const FaIcon(FontAwesomeIcons.cloud),
                    title: const Text("Weather"),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                  ),
                  ListTile(
                    // ignore: deprecated_member_use
                    leading: const FaIcon(FontAwesomeIcons.sun),
                    title: const Text("Humidity"),
                    trailing:
                        Text(humidity != null ? "$humidity %" : "Loading"),
                  ),
                  ListTile(
                    // ignore: deprecated_member_use
                    leading: const FaIcon(FontAwesomeIcons.wind),
                    title: const Text("Wind Speed"),
                    trailing:
                        Text(windspeed != null ? "$windspeed km/h" : "Loading"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
