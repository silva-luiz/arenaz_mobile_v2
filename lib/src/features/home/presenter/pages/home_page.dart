import 'package:arenaz_mobile_v2/src/features/home/presenter/widgets/establishment_card.dart';
import 'package:arenaz_mobile_v2/src/features/home/presenter/widgets/category_carousel.dart';
import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:arenaz_mobile_v2/src/features/shared/scaffold/home_scaffold_widget.dart';
import 'package:flutter/material.dart';

class Establishment {
  final int id;
  final String name;
  final List<String> category;
  final String city;
  final String value;
  final String image;
  final String address;
  final String description;

  Establishment({
    required this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.value,
    required this.image,
    required this.address,
    this.description = '',
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
      category: ['Society'],
      address: 'Avenida São Paulo, 1234',
      city: 'Taubaté',
      value: 'R\$ 100.00 - R\$ 150.00',
      image: 'assets/images/arenaz_logo.png',
      description:
          'O local oferece uma quadra poliesportiva coberta, estacionamento gratuito e área kids para os acompanhantes.',
    ),
    Establishment(
      id: 2,
      name: 'Beach Master',
      category: ['Beach Sports'],
      address: 'Rua do Mar, 456',
      city: 'Ubatuba',
      value: 'R\$ 120.00 - R\$ 140.00',
      image: 'assets/images/arenaz_logo.png',
      description:
          'O complexo possui duas quadras de areia iluminadas, vestiários completos e uma lanchonete com opções saudáveis para os atletas.',
    ),
    Establishment(
      id: 3,
      name: 'Tênis Clube',
      category: ['Tênis', 'Society'],
      address: 'Rua do Tênis, 789',
      city: 'São Paulo',
      value: 'R\$ 90.00 - R\$130.00',
      image: 'assets/images/arenaz_logo.png',
      description:
          'A arena conta com campo de grama sintética, arquibancada coberta, espaço para eventos e aluguel de materiais esportivos.',
    ),
    Establishment(
      id: 4,
      name: 'Arena 360',
      category: ['Outra'],
      address: 'Rua do Esporte, 101',
      city: 'Campinas',
      value: 'R\$ 110.00 - R\$ 150.00',
      image: 'assets/images/arenaz_logo.png',
      description:
          'A estrutura dispõe de três quadras de tênis, loja de artigos esportivos e um café com vista para os jogos.',
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
                        modularRoute: '/establishment/details',
                        arguments: {
                          'id': establishment.id,
                          'name': establishment.name,
                          'value': establishment.value,
                          'address': establishment.address,
                          'city': establishment.city,
                          'category': establishment.category,
                          'image': establishment.image,
                          'description': establishment.description,
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
