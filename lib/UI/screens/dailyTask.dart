import 'package:flutter/material.dart';
import 'package:pawbuddy/UI/screens/home_screen/home_screen.dart';

class dailyTask extends StatefulWidget {
  const dailyTask({super.key});

  @override
  State<dailyTask> createState() => _dailyTaskState();
}

class _dailyTaskState extends State<dailyTask> {
  final List<Map<String, dynamic>> tasks = [
    {
      'icon': Icons.pets,
      'title': 'Breakfast Time',
      'subtitle': '7:00 AM',
    },
    {
      'icon': Icons.pets,
      'title': 'Lunch Time',
      'subtitle': '12:00 PM',
    },
    {
      'icon': Icons.pets,
      'title': 'Dinner Time',
      'subtitle': '12:00 PM',
    },
    {
      'icon': Icons.bathtub,
      'title': 'Bath Time',
      'subtitle': '10:00 AM',
    },
    {
      'icon': Icons.toys,
      'title': 'Play Time',
      'subtitle': '2:00 PM',
    },
    {
      'icon': Icons.directions_walk,
      'title': 'Walk Time',
      'subtitle': '5:00 PM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => home_screen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ListTile(
                        leading: Icon(tasks[index]['icon'], size: 40),
                        title: Text(tasks[index]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: Text(tasks[index]['subtitle'],
                            style: TextStyle(color: Colors.grey)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Task'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
