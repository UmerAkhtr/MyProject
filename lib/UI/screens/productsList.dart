import 'package:pawbuddy/UI/screens/addProducts.dart';
import 'package:pawbuddy/models/productModel.dart';
import 'package:flutter/material.dart';

class productsList extends StatefulWidget {
  const productsList({super.key});

  @override
  State<productsList> createState() => _productsListState();
}

class _productsListState extends State<productsList> {
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _showAddProductScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddProductScreen(onAddProduct: _addProduct),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Pet Products', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: _products.isEmpty
          ? Center(child: Text('No products added yet.'))
          : ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                  product.imageUrl,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image);
                  },
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text(product.description),
                trailing: Text('\$${product.price.toStringAsFixed(2)}'),
              ),
            ),
          );
        },
      ),
       floatingActionButton: FloatingActionButton(
         onPressed: _showAddProductScreen,
         child: Icon(Icons.add),
         tooltip: 'Add Product',
       ),
    );
  }
}