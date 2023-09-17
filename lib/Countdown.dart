import 'dart:async';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  //Bagian Deklarasi Jam Menit Detik
  int jam = 0;
  int menit = 0;
  int detik = 0;

  //Kondisi si countdown
  bool berjalan = false;

  //Bagian timer
  Timer? timer;

  //Fungsi jika di tombol di pencet
  void mulai() {
    setState(() {
      berjalan = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (detik > 0) {
          detik--;
        } else {
          if (menit > 0) {
            menit--;
            detik = 59;
          } else {
            if (jam > 0) {
              jam--;
              menit = 59;
              detik = 59;
            } else {
              berjalan = false;
              timer?.cancel();
            }
          }
        }
      });
    });
  }

  //Bagian Batal
  void batal() {
    setState(() {
      jam = 0;
      menit = 0;
      detik = 0;
      berjalan = false;
    });
    timer?.cancel();
  }

  //Bagian Alert
  void notifikasi(BuildContext notif) {
    showDialog(
        context: notif,
        builder: (_) => AlertDialog(
              title: const Text('Waktu Habis'),
              content: const Text('Waktu Telah Habis'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(notif).pop(),
                    child: const Text('Tutup'))
              ],
            ));
  }

  //Bagian UI
  @override
  //Menu AppBar
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countdown"),
      ),
      body: Center(
        child: _bagianisidurasi(),
      ),
    );
  }

  Widget _bagianisidurasi() {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Container(
                child: Text('Jam: $jam', style: TextStyle(fontSize: 14)),
              ),
              // Menu Pilih Jam
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Slider(
                  value: jam.toDouble(),
                  min: 0,
                  max: 24,
                  onChanged: (double value) {
                    if (!berjalan) {
                      setState(() {
                        jam = value.toInt();
                      });
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  'Menit : $menit',
                  style: TextStyle(fontSize: 14),
                ),
              ),

              //Menu Pilih Menit
              Container(
                margin: EdgeInsets.only(top: 55),
                child: Slider(
                  value: menit.toDouble(),
                  min: 0,
                  max: 59,
                  onChanged: (double value) {
                    if (!berjalan) {
                      setState(() {
                        menit = value.toInt();
                      });
                    }
                  },
                ),
              ),

              //Menu Pilih Detik
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  'Detik : $detik',
                  style: TextStyle(fontSize: 14),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 105),
                child: Slider(
                  value: detik.toDouble(),
                  min: 0,
                  max: 59,
                  onChanged: (double value) {
                    if (!berjalan) {
                      setState(() {
                        detik = value.toInt();
                      });
                    }
                  },
                ),
              )
            ],
          ),
          Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Durasi",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Times New Roman",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 40),
                // Tampilan Waktu yang tersisa
                child: Center(
                  child: Text(
                    '${jam.toString().padLeft(2, '0')}:'
                    '${menit.toString().padLeft(2, '0')}:'
                    '${detik.toString().padLeft(2, '0')}',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80, left: 120),
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () => mulai(),
                          child: Text("Mulai"),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 80, left: 200),
                    child: Row(children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrange),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () => batal(),
                        child: Text("Batal"),
                      ),
                      SizedBox(width: 20),
                    ]),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
