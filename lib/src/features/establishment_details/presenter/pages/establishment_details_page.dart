import 'package:flutter/material.dart';

import '../../../shared/colors/colors.dart';
import '../../../shared/widgets/badges/category_badge.widget.dart';
import '../widgets/arena_card.widget.dart';

class EstablishmentDetailsPage extends StatelessWidget {
  final String id;
  final Map<String, dynamic> arguments;

  const EstablishmentDetailsPage({
    super.key,
    required this.id,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes de ${arguments['name'] ?? 'Estabelecimento $id'}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset(arguments['image']),

                Text(
                  arguments['name'],
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                Text(
                  '${arguments['address']}, ${arguments['city']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                Divider(thickness: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        (arguments['category'] as List<String>).map((cat) {
                          return CategoryBadge(cat);
                        }).toList(),
                  ),
                ),
                Text(
                  '${arguments['value'].replaceAll('.', ',')}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleColor,
                  ),
                ),
                Divider(thickness: 3),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sobre o lugar',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  arguments['description'],
                  style: TextStyle(color: AppColors.textColor, fontSize: 16),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Arenas',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confira as Arenas disponíveis neste estabelecimento.',
                    style: TextStyle(color: AppColors.textColor, fontSize: 16),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        [
                              ArenaCard(
                                arena: {
                                  'id': '1',
                                  'name': 'Arena Tênis Top',
                                  'type': 'Tênis',
                                  'value': 120.00,
                                  'image': 'assets/images/arena1.jpg',
                                },
                              ),
                              ArenaCard(
                                arena: {
                                  'id': '2',
                                  'name': 'Arena Master',
                                  'type': 'Outra',
                                  'value': 100.00,
                                  'image': 'assets/images/arena2.jpg',
                                },
                              ),
                              ArenaCard(
                                arena: {
                                  'id': '3',
                                  'name': 'Arena Beach Pro',
                                  'type': 'Beach Sports',
                                  'value': 90.00,
                                  'image': 'assets/images/arena3.jpg',
                                },
                              ),
                              ArenaCard(
                                arena: {
                                  'id': '4',
                                  'name': 'Arena Society Luxo',
                                  'type': 'Society',
                                  'value': 150.0,
                                  'image': 'assets/images/arena4.jpg',
                                },
                              ),
                            ]
                            .map(
                              (card) => Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: card,
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
