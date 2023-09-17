import 'package:flutter/material.dart';
import 'package:tugas_interaksi_user_aplikasi/About.dart';
import 'package:tugas_interaksi_user_aplikasi/Countdown.dart';
import 'package:tugas_interaksi_user_aplikasi/Stopwatch.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavBar());
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int indexyangdipilih = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            indexyangdipilih = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
              icon: Icon(Icons.timelapse), label: "Stopwatch"),
          NavigationDestination(
              icon: Icon(Icons.timer_rounded), label: "Countdown"),
          NavigationDestination(
              icon: Icon(Icons.info_outline_rounded), label: "About")
        ],
      ),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          child: StopWatch(),
        ),
        Container(
          alignment: Alignment.center,
          child: const Countdown(),
        ),
        Container(
          alignment: Alignment.center,
          child: About(),
        )
      ][indexyangdipilih],
    );
  }
}
