import 'package:bottomtabtoggle/fragments/camera.dart';
import 'package:bottomtabtoggle/fragments/home.dart';
import 'package:bottomtabtoggle/fragments/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'bottom Tabs',
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blueGrey
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: selectedIndex,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.black87,
      iconSize: 40,
      onTap: onItemTapped,),
    );
  }

  List<Widget> pages = <Widget>[
    Contact(),
    Camera(),
    Settings()
  ];
}
