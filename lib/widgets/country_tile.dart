import 'package:flutter/material.dart';
import '../models/country_model.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const CountryTile({super.key, required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(country.flagUrl,
                  width: 60, height: 40, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Text(
              country.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
