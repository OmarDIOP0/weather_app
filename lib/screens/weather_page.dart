import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_application/service/weather_model.dart';
import '../service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherPage> {
  final _weatherService= WeatherService('931bbd50296db1017f89a6c789f625a0');
  Weather? _weather;
  _fetchWeather() async{
    String cityName =await _weatherService.getCurrentCity();
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Weather APP'), centerTitle: true,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color(0xffffabd40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dakar', style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 8),
                    const Text('Good Morning', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    ),
                    Image.asset('assets/1.png'),
                    const Center(
                      child: Text('21°C', style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 50),
                      ),
                    ),
                    const Center(
                        child: Text('THUNDERSTORM', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25),
                        )
                    ),
                    const Center(
                        child: Text('Friday - 09,41am', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 26),
                        )
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('11.png', scale: 8),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunrise', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                                Text('5:34 am', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('12.png', scale: 8),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunset', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                                Text('5:34 pm', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Divider(color: Colors.grey,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('13.png', scale: 8),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Max', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                                Text('12°C', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('14.png', scale: 8),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Min', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300)),
                                Text('8°C', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
