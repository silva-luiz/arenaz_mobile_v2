import 'package:arenaz_mobile_v2/src/features/shared/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EstablishmentCard extends StatefulWidget {
  final String name;
  final String category;
  final String city;
  final double value;
  final String image;
  final String modularRoute;
  final Map<String, dynamic>? arguments;

  const EstablishmentCard({
    super.key,
    required this.name,
    required this.category,
    required this.city,
    required this.value,
    required this.image,
    required this.modularRoute,
    this.arguments,
  });

  @override
  State<EstablishmentCard> createState() => _EstablishmentCardState();
}

class _EstablishmentCardState extends State<EstablishmentCard> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(widget.modularRoute, arguments: widget.arguments);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  widget.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    icon: Icon(
                      isFavorited ? Icons.star : Icons.star_outline,
                      color:
                          isFavorited
                              ? AppColors.warning
                              : AppColors.defaultBlack,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Text(widget.category, style: const TextStyle(fontSize: 18)),
              Text(widget.city, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 6),
              Text(
                'R\$ ${widget.value.toStringAsFixed(2).replaceAll('.', ',')}/hora',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
