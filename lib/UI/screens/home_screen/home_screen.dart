import 'package:flutter/material.dart';
import 'package:pawbuddy/UI/screens/dailyTask.dart';
import 'package:pawbuddy/UI/screens/daily_activity_screen.dart';
import 'package:pawbuddy/UI/screens/grooming_screen.dart';
import 'package:pawbuddy/UI/screens/pet_adoption.dart';
import 'package:pawbuddy/UI/screens/pet_boarding_screen.dart';
import 'package:pawbuddy/UI/screens/productsList.dart';
import 'package:pawbuddy/UI/screens/pet_profile/pet_profile.dart';
import 'package:pawbuddy/UI/screens/veternity_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:card_swiper/card_swiper.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  int _selectedIndex = 0;

  // List of screens to navigate to based on bottom navigation bar
  final List<Widget> _screens = [
    HomeScreenContent(), // Corresponds to 'Search'
    pet_profile(), // Corresponds to 'Appointments'
    dailyTask(), // Corresponds to 'Explore'
    pet_adoption(), // Corresponds to 'Profile'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pawbuddy'),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.import_contacts))]
    ),
      drawer: MyDrawer(),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // This will be updated when the user taps on a new tab
        onTap: _onItemTapped, // When an item is tapped, call _onItemTapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pet Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Adopt',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Below are placeholder classes for each screen

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAnimation(),
          RichText(
            text: TextSpan(
              text: '',
              style: TextStyle(color: Colors.black, fontSize: 22.sp),
              children: [
                TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                buildOptionButton(context, Icons.local_hospital, 'Veterinary', veternity_screen()),
                buildOptionButton(context, Icons.cut, 'Trainers', veternity_screen()),
                buildOptionButton(context, Icons.hotel, 'Grooming', petGrooming()),
                buildOptionButton(context, Icons.home, 'Adoption', pet_adoption()),
                buildOptionButton(context, Icons.directions_walk, 'Pet Profiles', pet_profile()),
                buildOptionButton(context, Icons.school, 'Daily Tasks', dailyTask()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionButton(BuildContext context, IconData icon, String label, Widget destinationScreen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 6),
            Text(label, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
        ],
      ),
    );
  }
}

class MyAnimation extends StatelessWidget {
  List<String> images = [
    'assets/images/Dog.jpeg',
    'assets/images/cat.jpeg',
    'assets/images/bird.jpeg',
    'assets/images/horse.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 350,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Swiper(
              autoplay: true,
              pagination: SwiperPagination() ,
              layout: SwiperLayout.DEFAULT,
              itemCount: images.length,
              itemBuilder: (context,index){
                return Image.asset(images[index],
                  fit: BoxFit.fill,);
              },
            ),
          ),
        );
  }
}
 