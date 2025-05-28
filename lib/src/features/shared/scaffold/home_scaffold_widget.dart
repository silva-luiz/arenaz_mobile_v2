import '../colors/colors.dart';
import '../widgets/drawer/generic_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScaffoldWidget extends StatefulWidget {
  final Widget child;

  const HomeScaffoldWidget({super.key, required this.child});

  @override
  State<HomeScaffoldWidget> createState() => _HomeScaffoldWidgetState();
}

class _HomeScaffoldWidgetState extends State<HomeScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const GenericDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 28),
                  tooltip: 'Menu',
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
          ),
          title: const Text("Olá, PAPI!"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person, size: 35),
              tooltip: 'Perfil',
              onPressed: () {
                Modular.to.navigate('/profile');
              },
            ),
          ],
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: AppColors.defaultWhite,
          elevation: 4.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Onde vamos jogar hoje?',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.defaultWhite,
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
