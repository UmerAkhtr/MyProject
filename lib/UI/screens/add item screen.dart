import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addItem extends StatefulWidget {
  const addItem({super.key});

  @override
  State<addItem> createState() => _addItemState();
}

class _addItemState extends State<addItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body:
        ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(8),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(''), // Replace with your image asset
                ),
                title: Text('Item NAme'),
                subtitle: Text('Description'),
                trailing: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'read more',
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
