import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wheather_app/config/common/app_colors.dart';
import 'package:wheather_app/config/helper/helper.dart';
import 'package:wheather_app/models/wheather_model.dart';

class CurrentWeatherCard extends StatelessWidget {
  final WheatherModel? wheatherModel;
  const CurrentWeatherCard({super.key, this.wheatherModel});

  @override
  Widget build(BuildContext context) {
    String emoji = Helper.getWeatherEmoji(wheatherModel?.weather?[0].main);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child:
          wheatherModel == null
              ? Center(child: Text('No Weather Data Available'))
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    wheatherModel?.name ?? '',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${wheatherModel?.main?.temp}°C',
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    emoji,
                    style: const TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    wheatherModel?.weather?[0].description ?? '',
                    style: const TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  SizedBox(height: 2.h),
                  Wrap(
                    runSpacing: 20,
                    spacing: 80,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'FEELS LIKE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '${wheatherModel?.main?.feelsLike}°C',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'HUMIDITY',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '${wheatherModel?.main?.humidity}%',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'WIND SPEED',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '${wheatherModel?.wind?.speed} km/h',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'PRESSURE',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            '${wheatherModel?.main?.feelsLike} hPa',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
    );
  }
}
