import 'package:flutter/material.dart';

class Sibha extends StatefulWidget {
  const Sibha({super.key});

  @override
  State<Sibha> createState() => _SibhaState();
}

class _SibhaState extends State<Sibha> {
  int _counter = 0;
  int _tasbihIndex = 0;
  double _angle = 0;
  final List<String> _tasbihList = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  void _incrementCounter() {
    setState(() {
      _counter += 1;
      _angle += 60;
      if (_counter == 33) {
        _counter = 0;
        _tasbihIndex = (_tasbihIndex + 1) % _tasbihList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Background.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Image.asset("assets/images/Logo.png"),
              const SizedBox(height: 40),
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                style: TextStyle(
                    fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          margin: const EdgeInsets.only(top: 75),
                          child: Transform.rotate(
                              angle: _angle,
                              child: GestureDetector(
                                onTap: _incrementCounter,
                                child: Image.asset("assets/images/sibha.png"),
                              ))),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 86,
                          child: Image.asset("assets/images/head_of_sibha.png")),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 80),
                            Text(
                              _tasbihList[_tasbihIndex],
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                '$_counter',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          setState(() {});
        },
        backgroundColor: const Color(0xFFB7935F),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Vector.png'),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/icons/Vector.png'),
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Vector.png'),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/icons/Vector.png'),
            ),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Vector.png'),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/icons/Vector.png'),
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Vector.png'),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/icons/Vector.png'),
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/Vector.png'),
            activeIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset('assets/icons/Vector.png'),
            ),
            label: "Time",
          ),
        ],
      ),
    );
  }
}
