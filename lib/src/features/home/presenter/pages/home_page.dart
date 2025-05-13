import 'package:arenaz_mobile_v2/src/features/home/presenter/widgets/establishment_card.dart';
import 'package:arenaz_mobile_v2/src/features/home/presenter/widgets/category_carousel.dart';
import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:arenaz_mobile_v2/src/features/shared/scaffold/home_scaffold_widget.dart';
import 'package:flutter/material.dart';

class Establishment {
  final int id;
  final String name;
  final String category;
  final String city;
  final double value;
  final String image;

  Establishment({
    required this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.value,
    required this.image,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Todas';

  final List<Establishment> allEstablishments = [
    Establishment(
      id: 1,
      name: 'São Paulinho',
      category: 'Society',
      city: 'Taubaté',
      value: 100.0,
      image: 'assets/images/arenaz_logo.png',
    ),
    Establishment(
      id: 2,
      name: 'Beach Master',
      category: 'Beach Sports',
      city: 'Ubatuba',
      value: 120.0,
      image: 'assets/images/arenaz_logo.png',
    ),
    Establishment(
      id: 3,
      name: 'Tênis Clube',
      category: 'Tênis',
      city: 'São Paulo',
      value: 90.0,
      image: 'assets/images/arenaz_logo.png',
    ),
    Establishment(
      id: 4,
      name: 'Arena 360',
      category: 'Outras',
      city: 'Campinas',
      value: 110.0,
      image: 'assets/images/arenaz_logo.png',
    ),
  ];

  List<Establishment> get filteredEstablishments {
    if (selectedCategory == 'Todas') {
      return allEstablishments;
    }
    return allEstablishments
        .where((establishment) => establishment.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return HomeScaffoldWidget(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoryCarousel(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              const SizedBox(height: 20),
              filteredEstablishments.isEmpty
                  ? const Center(
                    child: Column(
                      children: [
                        Icon(Icons.warning, size: 50, color: AppColors.warning),
                        SizedBox(height: 10),
                        Text(
                          'Nenhum estabelecimento encontrado.',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  )
                  : ListView.builder(
                    shrinkWrap:
                        true, // Permite que o ListView ocupe apenas o espaço necessário
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: filteredEstablishments.length,
                    itemBuilder: (context, index) {
                      final establishment = filteredEstablishments[index];
                      return EstablishmentCard(
                        name: establishment.name,
                        category: establishment.category,
                        city: establishment.city,
                        value: establishment.value,
                        image: establishment.image,
                        modularRoute: '/detalhes-arena',
                        arguments: {
                          'id': establishment.id,
                          'name': establishment.name,
                          'value': establishment.value,
                          'city': establishment.city,
                          'category': establishment.category,
                        },
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
