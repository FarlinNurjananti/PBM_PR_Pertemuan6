import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bmi = 0;
  int bb = 0;
  int tb = 0;

  void _BMICalculate() {
    setState(
      () {
        _bmi = bb / ((tb / 100) * (tb / 100));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Text(
                "${dataInputan[0]}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.brown),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  "Welcome To BMI Calculate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.brown,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 470.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                topLeft: Radius.circular(50.0)),
            color: Color(0xFFE1CAA7),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.only(top: 40.0, left: 40.0, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Hitung BMI",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: Colors.brown),
                    ),
                    Text(
                      'Your BMI Score:, $_bmi',
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 55, 55, 55),
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tinggi Badan',
                      ),
                      onChanged: (value) {
                        tb = int.tryParse(value) ?? 0;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Berat Badan',
                      ),
                      onChanged: (value) {
                        bb = int.tryParse(value) ?? 0;
                      },
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: _BMICalculate,
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(2000, 30)),
                        child: const Text('Hitung nilai BMI'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
