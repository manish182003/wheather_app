import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wheather_app/config/common/app_colors.dart';
import 'package:wheather_app/models/wheather_model.dart';

class ForecastWeatherCard extends StatefulWidget {
  final WheatherModel wheatherModel;
  const ForecastWeatherCard({super.key, required this.wheatherModel});

  @override
  State<ForecastWeatherCard> createState() => _ForecastWeatherCardState();
}

class _ForecastWeatherCardState extends State<ForecastWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Text(
                      'Today',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '☀️',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '32° 64°',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Text(
                      'Tommorow',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '☀️',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '32° 64°',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Text(
                      'Saturday',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '☀️',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '32° 64°',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Text(
                      'Sunday',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '☀️',
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '32° 64°',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
