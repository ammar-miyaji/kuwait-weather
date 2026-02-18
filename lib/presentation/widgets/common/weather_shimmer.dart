import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmer extends StatelessWidget {
  const WeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 24,
              width: 150,
              decoration: _boxDecor(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: _boxDecor(),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 60,
                  width: 100,
                  decoration: _boxDecor(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 16,
              width: 120,
              decoration: _boxDecor(),
            ),
            const SizedBox(height: 24),
            Row(
              children: List.generate(
                3,
                (_) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: 80,
                      decoration: _boxDecor(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecor() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      );
}
