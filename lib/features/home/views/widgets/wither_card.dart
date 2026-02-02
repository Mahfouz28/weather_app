import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherCard extends StatelessWidget {
  final String locationCity;
  final String locationRegion;
  final int temperature;
  final String condition;
  final String wind;
  final String humidity;
  final String visibility;
  final String? weatherIconAsset;
  final IconData? largeIcon;

  const WeatherCard({
    super.key,
    required this.locationCity,
    required this.locationRegion,
    required this.temperature,
    required this.condition,
    required this.wind,
    required this.humidity,
    required this.visibility,
    this.weatherIconAsset,
    this.largeIcon = Icons.cloud_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: temperature > 20
            ? Colors.yellowAccent.withOpacity(0.25)
            : temperature < 20
            ? Colors.lightBlueAccent.withOpacity(0.18)
            : Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.28), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          weatherIconAsset != null
              ? Image.asset(
                  weatherIconAsset!,
                  height: 64,
                  width: 64,
                  fit: BoxFit.contain,
                )
              : const Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.white70,
                  size: 64,
                ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.white.withOpacity(0.9),
                size: 22,
              ),
              const SizedBox(width: 6),
              Text(
                '$locationCity,',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              locationRegion,
              style: TextStyle(
                color: Colors.white.withOpacity(0.70),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$temperature',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 72,
                            fontWeight: FontWeight.w700,
                            height: 0.9,
                          ),
                        ),
                        const TextSpan(
                          text: '°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    condition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.22),
                  shape: BoxShape.circle,
                ),
                child: temperature > 20
                    ? Icon(
                        WeatherIcons.sunrise,
                        color: Colors.yellow.withOpacity(.85),
                        size: 68,
                      )
                    : temperature < 20
                    ? Icon(
                        WeatherIcons.rain_wind,
                        color: Colors.lightBlue.withOpacity(.85),
                        size: 68,
                      )
                    : Icon(
                        WeatherIcons.day_haze,
                        color: Colors.white,
                        size: 68,
                      ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.white30, thickness: 0.6),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatItem(icon: Icons.air, label: 'Wind', value: wind),
              _StatItem(
                icon: Icons.water_drop_outlined,
                label: 'Humidity',
                value: humidity,
              ),
              _StatItem(
                icon: Icons.visibility_outlined,
                label: 'Visibility',
                value: visibility,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.60), size: 28),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
