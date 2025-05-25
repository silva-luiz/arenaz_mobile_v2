import 'package:flutter/material.dart';

class ArenaDetailsPage extends StatelessWidget {
  final String id;
  final Map<String, dynamic> arguments;

  const ArenaDetailsPage({
    super.key,
    required this.id,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(arguments['name'] ?? 'Arena $id')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(arguments['image']),
            Text(
              arguments['name'] ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(arguments['type'] ?? ''),
            Text(
              'R\$ ${arguments['price'].toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
