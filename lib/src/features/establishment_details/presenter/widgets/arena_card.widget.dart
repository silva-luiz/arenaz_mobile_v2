import 'package:arenaz_mobile_v2/src/features/shared/widgets/badges/category_badge.widget.dart';
import 'package:arenaz_mobile_v2/src/features/shared/widgets/buttons/generic_button.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';

class ArenaCard extends StatelessWidget {
  final Map<String, dynamic> arena;

  const ArenaCard({super.key, required this.arena});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                arena['image'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/arena_placeholder.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    arena['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CategoryBadge(arena['type']),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'R\$ ${arena['value'].toStringAsFixed(2).replaceAll('.', ',')}/hora',
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GenericButton(
                    label: 'Ver detalhes',
                    onPressed: () {
                      print('Ir para detalhes da arena');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
