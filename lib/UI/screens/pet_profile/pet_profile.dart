import 'package:flutter/material.dart';

class pet_profile extends StatefulWidget {
  const pet_profile({super.key});

  @override
  State<pet_profile> createState() => _pet_profileState();
}

class _pet_profileState extends State<pet_profile> {
  bool neutered = true;
  bool vaccinated = true;
  bool friendlyWithDogs = true;
  bool friendlyWithCats = false;
  bool friendlyWithKidsUnder10 = true;
  bool friendlyWithKidsOver10 = true;
  bool microchipped = true;
  bool purebred = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add pet detail'),
        actions: [
          TextButton(
            onPressed: () {
              // Save action
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pet Image and General Information
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/pet_image.png'), // Add your image here
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add, size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'General Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Pet name'),
                  ),
                  SizedBox(height: 8.0),
                  ListTile(
                    title: Text('Species of your pet'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to select species
                    },
                  ),
                  ListTile(
                    title: Text('Breed'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to select breed
                    },
                  ),
                  ListTile(
                    title: Text('Size (optional)'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to select size
                    },
                  ),
                  ListTile(
                    title: Text('Gender'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ChoiceChip(
                          label: Text('Male'),
                          selected: true,
                          onSelected: (selected) {
                            // Gender selection logic
                          },
                        ),
                        SizedBox(width: 8.0),
                        ChoiceChip(
                          label: Text('Female'),
                          selected: false,
                          onSelected: (selected) {
                            // Gender selection logic
                          },
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Date of birth'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Action to select date of birth
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Additional Information
            Text(
              'Additional Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text('Neutered'),
              value: neutered,
              onChanged: (bool value) {
                setState(() {
                  neutered = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vaccinated'),
              value: vaccinated,
              onChanged: (bool value) {
                setState(() {
                  vaccinated = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Friendly with dogs'),
              value: friendlyWithDogs,
              onChanged: (bool value) {
                setState(() {
                  friendlyWithDogs = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Friendly with cats'),
              value: friendlyWithCats,
              onChanged: (bool value) {
                setState(() {
                  friendlyWithCats = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Friendly with kids <10 year'),
              value: friendlyWithKidsUnder10,
              onChanged: (bool value) {
                setState(() {
                  friendlyWithKidsUnder10 = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Friendly with kids >10 year'),
              value: friendlyWithKidsOver10,
              onChanged: (bool value) {
                setState(() {
                  friendlyWithKidsOver10 = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Microchipped'),
              value: microchipped,
              onChanged: (bool value) {
                setState(() {
                  microchipped = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Purebred'),
              value: purebred,
              onChanged: (bool value) {
                setState(() {
                  purebred = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Pet’s nursery name (optional)'),
            ),
            SizedBox(height: 16.0),

            // Reminders
            Text(
              'Reminders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add event action
              },
              icon: Icon(Icons.add),
              label: Text('Add event'),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Measles vaccine'),
              subtitle: Text('20.08.2018'),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Rabies vaccine'),
              subtitle: Text('30.08.2018'),
            ),
          ],
        ),
      ),
    );
  }
}
