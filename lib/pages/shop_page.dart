import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/product_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.gradientBg,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                SizedBox(width: 6),
                Text('Exclusive Care', style: TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (_, i) => ProductCard(
                title: [
                  "Follicle Fortifying Serum","Revitalizing Hair Mask","Growth Factor Shampoo",
                  "Scalp Soothing Conditioner","Healing Balm","Daily Density Foam"
                ][i % 6],
                price: [89.99, 54.99, 29.99, 34.99, 24.99, 59.99][i % 6],
              ),
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}