import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';
import 'package:wheather_app/config/helper/helper.dart';

import 'package:wheather_app/models/forecast_model.dart';

class ForecastWeatherCard extends StatefulWidget {
  final ForecastModel? forecastModel;
  const ForecastWeatherCard({super.key, this.forecastModel});

  @override
  State<ForecastWeatherCard> createState() => _ForecastWeatherCardState();
}

class _ForecastWeatherCardState extends State<ForecastWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return widget.forecastModel == null
        ? Center(child: Text('No Forecast Data Available'))
        : Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '5-Day Forecast',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 2.h),
              Wrap(
                runSpacing: 20,
                spacing: 80,
                children:
                    widget.forecastModel?.list?.map((item) {
                      final date =
                          DateTime.tryParse(item.dtTxt ?? '') ?? DateTime.now();

                      final day = DateFormat('EEEE').format(date);
                      final time = DateFormat('hh:mm a').format(date);

                      // Emoji based on weather
                      String emoji = Helper.getWeatherEmoji(
                        item.weather?[0].main,
                      );

                      // Temperature string
                      final temp =
                          '${item.main?.temp?.toInt() ?? '--'}° '
                          '${item.main?.tempMax?.toInt() ?? '--'}°';

                      return Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  day,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  emoji,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            Text(
                              temp,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList() ??
                    [],
              ),
            ],
          ),
        );
  }
}
