import 'package:flutter/material.dart';
import 'package:shared_perference/local_data/storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myString = '';

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    await StorageRepository.getInstance();
    setState(() {
      myString = StorageRepository.getString("word");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 130,
                  child: Image.asset(
                    'assets/png/xalq.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 15,
                  child: Image.asset(
                    'assets/png/chip.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 320,
                  child: Image.asset(
                    'assets/png/antena.png',
                    color: Colors.white,
                    width: 40,
                    height: 40,
                  ),
                ),
                Positioned(
                    bottom: 60,
                    left: 30,
                    child: Text(
                      myString,
                      style: TextStyle(
                          fontSize: 27,
                          color: Color(0xFF006016),
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    bottom: 45,
                    left: 170,
                    child: Text(
                      '12/20',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF006016),
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    bottom: 15,
                    left: 25,
                    child: Text(
                      'Polonchayev Toshturdi',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF006016),
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  bottom: 20,
                  left: 270,
                  child: Image.asset(
                    'assets/png/visa.png',
                    width: 80,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              cursorHeight: 30,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              cursorWidth: 3,
              style: TextStyle(fontSize: 28),
              onChanged: (value) async {
                await StorageRepository.putString(key: "word", value: value);
                setState(() {
                  myString = StorageRepository.getString("word");
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
