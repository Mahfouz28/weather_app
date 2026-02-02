import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  final String windSpeed;
  final String humidity;
  final String visibility;
  final String pressure;

  const StatsGrid({
    super.key,
    required this.windSpeed,
    required this.humidity,
    required this.visibility,
    required this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.4,
        children: [
          _StatCard(icon: Icons.air, label: 'Wind Speed', value: windSpeed),
          _StatCard(
            icon: Icons.water_drop_outlined,
            label: 'Humidity',
            value: humidity,
          ),
          _StatCard(
            icon: Icons.visibility_outlined,
            label: 'Visibility',
            value: visibility,
          ),
          _StatCard(
            icon: Icons.compress_outlined,
            label: 'Pressure',
            value: pressure,
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.22),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.90), size: 32),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.75),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
