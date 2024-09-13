import 'package:flutter/material.dart';
import 'package:pawbuddy/UI/screens/petDetails_screen.dart';

class pet_adoption extends StatefulWidget {
  @override
  _pet_adoptionState createState() => _pet_adoptionState();
}

class _pet_adoptionState extends State<pet_adoption> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search'
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.grey),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.purple,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Dog'),
              Tab(text: 'Cat'),
              Tab(text: 'Birds'),
              Tab(text: 'Other'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildDogList(),
          buildCatList(),
          buildBirdsList(),
          buildOtherList(),
        ],
      ),
    );
  }

  Widget buildDogList() {
    return ListView.builder(
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
              backgroundImage: AssetImage('assets/images/Dog.jpeg'), // Replace with your image asset
            ),
            title: Text('Dog'),
            subtitle: Text('Description'),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => petDetails()));
              },
              child: Text(
                'read more',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        );
      },
    );
  }

  buildBirdsList() {
    return ListView.builder(
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
              backgroundImage: AssetImage('assets/images/bird.jpeg'), // Replace with your image asset
            ),
            title: Text('Bird'),
            subtitle: Text('Description'),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => petDetails()));
              },
              child: Text(
                'read more',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        );
      },
    );
  }

  buildOtherList() {
    return ListView.builder(
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
              backgroundImage: AssetImage('assets/images/horse.jpeg'), // Replace with your image asset
            ),
            title: Text('Other'),
            subtitle: Text('Description'),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => petDetails()));
              },
              child: Text(
                'read more',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        );
      },
    );
  }
}

  buildCatList() {
    return ListView.builder(
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
              backgroundImage: AssetImage('assets/images/cat.jpeg'), // Replace with your image asset
            ),
            title: Text('Cat'),
            subtitle: Text('Description'),
            trailing: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => petDetails()));
              },
              child: Text(
                'read more',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ),
        );
      },
    );
  }
