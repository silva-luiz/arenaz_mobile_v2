import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text(arguments['name'] ?? 'Estabelecimento $id')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('Establishment ID: ${arguments['id']}'),
              Image.asset(arguments['image']),
              Text(
                arguments['name'],
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              Text(
                '${arguments['address']}, ${arguments['city']}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(arguments['category'], style: TextStyle(fontSize: 16)),
              Text(
                'R\$ ${arguments['value'].toStringAsFixed(2).replaceAll('.', ',')}',
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sobre o lugar',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Text(arguments['description']),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Arenas',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
