import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 160),
                child: Image.asset("assets/FTI UNTAR.png"),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: Image.asset("assets/Logo SI clear.png"),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 260),
                child: Text(
                  "Nama : Liko Fernando",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 300),
                child: Text(
                  "NIM : 825210137",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
