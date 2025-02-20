import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _bmi = 0.0;

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      setState(() {
        _bmi = weight / (height * height / 10000);
      });
    }
  }

  void _reset() {
    _heightController.text = "";
    _weightController.text = "";
    setState(() {
      _bmi = 0.0;
    });
  }

  String _getBMICategory(double bmi) {
    if (bmi <= 18.5) {
      return 'Underweight';
    } else if (bmi <= 24.9) {
      return 'Normal weight';
    } else if (bmi <= 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo
              Text(
                "BMI ALAMIN!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 68, 255),
                ),
              ),

              // Height Field with Icon
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.person_alt),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _heightController,
                        placeholder: "Height (cm)",
                        keyboardType: TextInputType.number,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Weight Field with Icon
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.arrow_2_circlepath),
                    SizedBox(width: 10),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _weightController,
                        placeholder: "Weight (kg)",
                        keyboardType: TextInputType.number,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Calculate Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CupertinoButton.filled(
                  child: Text("Calculate BMI"),
                  onPressed: _calculateBMI,
                ),
              ),
              CupertinoButton(
                      child: Text("Reset"),
                      onPressed: _reset,
                    ),

              if (_bmi > 0)
              Text(
              "BMI: ${_bmi.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20),
              ),

              // Display BMI Category
              if (_bmi > 0)
                Text(
                  "Category: ${_getBMICategory(_bmi)}",
                  style: TextStyle(fontSize: 20),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
