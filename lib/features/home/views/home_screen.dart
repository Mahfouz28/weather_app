import 'package:flutter/material.dart';
import 'package:weather_app/features/home/views/widgets/daliy_forcast_card.dart';
import 'package:weather_app/features/home/views/widgets/section_titel.dart';
import 'package:weather_app/features/home/views/widgets/statas_grid.dart';
import 'package:weather_app/features/home/views/widgets/wither_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              transform: GradientRotation(0.1),
              colors: [Color(0xFF5C2D91), Color.fromARGB(255, 70, 28, 219)],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WeatherCard(
                  locationCity: 'San Francisco',
                  locationRegion: 'California, USA',
                  temperature: '24',
                  condition: 'Partly Cloudy',
                  wind: '12 km/h',
                  humidity: '65%',
                  visibility: '10 km',
                  weatherIconAsset: 'assets/images/cloud.png',
                ),
                const SizedBox(height: 24),
                const SectionTitle(title: '7-Day Forecast'),
                const SizedBox(height: 16),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return const DailyForecastCard(
                      dayName: 'Monday',
                      date: 'Mar 15',
                      highTemp: '26',
                      lowTemp: '18',
                      averageTemp: 23,
                    );
                  },
                ),
                const SizedBox(height: 24),
                const SectionTitle(title: 'Today\'s Stats'),
                const SizedBox(height: 24),

                const StatsGrid(
                  windSpeed: '12 km/h',
                  humidity: '65%',
                  visibility: '10 km',
                  pressure: '1013 mb',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
