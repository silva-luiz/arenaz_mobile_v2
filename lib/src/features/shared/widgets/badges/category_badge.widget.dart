import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class CategoryBadge extends StatelessWidget {
  final String category;

  const CategoryBadge(this.category, {super.key});

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'society':
        return AppColors.success;
      case 'tênis':
        return AppColors.accentColor;
      case 'beach sports':
        return AppColors.primaryColor;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getCategoryColor(category),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
