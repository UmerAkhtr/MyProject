import 'package:flutter/material.dart';
import 'package:pawbuddy/models/vetModel.dart';

class AddVetsScreen extends StatefulWidget {
  final Function(Vets) onAddVet;

  AddVetsScreen({required this.onAddVet});

  @override
  State<AddVetsScreen> createState() => _AddVetsScreenState();
}

class _AddVetsScreenState extends State<AddVetsScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  String _imageUrl = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newVets = Vets(
        name: _name,
        description: _description,
        imageUrl: _imageUrl,
      );
      widget.onAddVet(newVets);
      Navigator.of(context).pop(); // Close the form screen after submission
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vets or Trainers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) {
                  _description = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image'),
                onSaved: (value) {
                  _imageUrl = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
