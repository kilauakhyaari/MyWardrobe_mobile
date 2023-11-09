import 'package:flutter/material.dart';
import 'package:mywardrobe_mobile/widgets/left_drawer.dart';
import 'package:mywardrobe_mobile/widgets/wardrobe_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<WardrobeItem> items = [
    WardrobeItem("Lihat Item", Icons.checkroom_rounded, Colors.red.shade200),
    WardrobeItem("Add New Item", Icons.add_box_rounded,Colors.cyan.shade200),
    WardrobeItem("Logout", Icons.logout, Colors.lime.shade200),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wardrobe',
        ),
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.red[100],
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'My Wardrobe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((WardrobeItem item) {
                  // Iterasi untuk setiap item
                  return WardrobeCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

