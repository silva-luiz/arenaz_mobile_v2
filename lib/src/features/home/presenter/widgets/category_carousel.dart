import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';

class CategoryCarousel extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryCarousel({super.key, required this.onCategorySelected});

  @override
  State<CategoryCarousel> createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  int selectedIndex = 0;

  final List<String> categories = [
    'Todas',
    'Society',
    'Beach Sports',
    'Tênis',
    'Outras',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: isSelected,
              selectedColor: AppColors.primaryColor,
              onSelected: (_) {
                setState(() {
                  selectedIndex = index;
                });
                widget.onCategorySelected(categories[index]);
              },
              labelStyle: TextStyle(color: AppColors.defaultBlack),
            ),
          );
        },
      ),
    );
  }
}
