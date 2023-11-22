import 'package:flutter/material.dart';
import 'package:mywardrobe_mobile/models/product.dart';

class DetailProductPage extends StatelessWidget {
  final Product item;

  const DetailProductPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.fields.name}'),
            Text('Amount: ${item.fields.amount}'),
            Text('Description: ${item.fields.description}'),
            Text('In Laundry? ${item.fields.inLaundry}'),
            Text('Date added:  ${item.fields.dateAdded}'),
            // Tambahkan lebih banyak atribut sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}