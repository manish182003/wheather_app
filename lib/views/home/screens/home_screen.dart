import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wheather_app/config/common/app_colors.dart';
import 'package:wheather_app/config/utils/loader.dart';
import 'package:wheather_app/config/utils/snackbar.dart';
import 'package:wheather_app/controllers/weather_controller.dart';
import 'package:wheather_app/views/home/widgets/current_weather_card.dart';
import 'package:wheather_app/views/home/widgets/forecast_weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherController = Get.find<WeatherController>();
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.bgGradientColor1, AppColors.bgGradientColor2],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Weather App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          actionsPadding: EdgeInsets.symmetric(horizontal: 16),

          actions: [
            IconButton(
              onPressed: () {},
              icon: Text('🔍', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: 55,

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        weatherController.searchCityName(value);
                      } else {
                        showSnackBar(context, 'Please Enter City Name.');
                      }
                    },

                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Search City',
                      hintStyle: TextStyle(color: AppColors.primaryTextColor),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Obx(() {
                  if (weatherController.isloading.value) {
                    return CustomLoader();
                  }
                  if (weatherController.error.isNotEmpty) {
                    return Center(child: Text(weatherController.error.value));
                  }
                  final weather = weatherController.weather.value;

                  final forecast = weatherController.forecast.value;

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWideScreen =
                          constraints.maxWidth >
                          600; // Adjust threshold as needed

                      return isWideScreen
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CurrentWeatherCard(wheatherModel: weather),
                              SizedBox(width: 4.w),
                              ForecastWeatherCard(forecastModel: forecast),
                            ],
                          )
                          : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CurrentWeatherCard(wheatherModel: weather),
                              SizedBox(height: 4.h),
                              ForecastWeatherCard(forecastModel: forecast),
                              SizedBox(height: 5.h),
                            ],
                          );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
