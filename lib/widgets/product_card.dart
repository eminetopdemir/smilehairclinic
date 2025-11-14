import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  const ProductCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0B2537),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF133549),
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(image: AssetImage('assets/images/product.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text("\$" + price.toStringAsFixed(2), style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Theme.of(context).colorScheme.primary),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: (){},
                  child: const Text('Buy Now'),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_border_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}