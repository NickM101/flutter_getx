import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:weather_flutter_getx/controllers/global_controller.dart';
import 'package:weather_flutter_getx/models/weather_data_hourly.dart';
import 'package:weather_flutter_getx/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12
              ? 12
              : weatherDataHourly.hourly.length,
          itemBuilder: ((context, index) {
            return Obx(() => GestureDetector(
                  onTap: (() {
                    cardIndex.value = index;
                  }),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0.5, 0),
                            blurRadius: 20,
                            spreadRadius: 1,
                            color: CustomColors.dividerLine.withAlpha(150))
                      ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(colors: [
                              CustomColors.firstGradientColor,
                              CustomColors.secondGradientColor
                            ])
                          : null,
                    ),
                    child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      temp: weatherDataHourly.hourly[index].temp!,
                      timestamp: weatherDataHourly.hourly[index].dt!,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon!,
                    ),
                  ),
                ));
          }),
        ));
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int timestamp;
  int cardIndex;
  int index;
  String weatherIcon;

  String getTime(final timestamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails(
      {Key? key,
      required this.timestamp,
      required this.temp,
      required this.index,
      required this.cardIndex,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timestamp),
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack,
              )),
        ),
        Container(
          child: Image.asset('assets/weather/$weatherIcon.png',
              height: 40, width: 40),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text('$temp',
              style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack,
              )),
        )
      ],
    );
  }
}
