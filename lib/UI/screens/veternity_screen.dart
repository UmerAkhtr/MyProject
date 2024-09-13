import 'package:flutter/material.dart';
import 'package:pawbuddy/UI/screens/addVets.dart';
import 'package:pawbuddy/models/vetModel.dart';

class veternity_screen extends StatefulWidget {
  const veternity_screen({super.key});

  @override
  State<veternity_screen> createState() => _veternity_screenState();
}

class _veternity_screenState extends State<veternity_screen> {
  List<Vets> _vets = [];

  void _addVets(Vets vets) {
    setState(() {
      _vets.add(vets);
    });
  }

  void _showAddVetsScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddVetsScreen(onAddVet: _addVets),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Vets and Trainers', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: _vets.isEmpty
          ? Center(child: Text('No Vets or Trainers added yet.'))
          : ListView.builder(
        itemCount: _vets.length,
        itemBuilder: (context, index) {
          final product = _vets[index];
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
                trailing: TextButton(onPressed: (){}, child: Text('Readmore')),
              ),
            ),
          );
        },
      ),
       floatingActionButton: ElevatedButton(onPressed: (){},
           style: ElevatedButton.styleFrom(
             foregroundColor: Colors.white, backgroundColor: Colors.blue, shape: CircleBorder(),
             padding: EdgeInsets.all(24),
           ),
           child: Icon(Icons.add),)
       // FloatingActionButton(
      //   onPressed: _showAddVetsScreen,
      //   child: const Icon(Icons.add),
      //   tooltip: 'Add Product',
      // ),

    );
  }
}
