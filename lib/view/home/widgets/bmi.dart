import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;
  String bmiCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with frosted glass effect
          Image.asset(
            'assets/images/splash.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              //color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    //color: Colors.white.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Enter Height (in cm)',
                        labelStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 19.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    //color: Colors.white.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Enter Weight (in kg)',
                        labelStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 65.0),
                //
                ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(198, 131, 215, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Adjust the value for roundness
                    ),
                   // minimumSize: Size(double.infinity, 60),
                  fixedSize:  Size(200, 50),
                    //Adjust the height of the button
                  ),
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 18), // Adjust the font size of the button text
                  ),
                ),

                SizedBox(height: 40.0),
                Visibility(
                  visible: bmiResult > 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'BMI: ${bmiResult.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Display BMI category
                Visibility(
                  visible: bmiCategory.isNotEmpty,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.pink.withOpacity(0.7),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'BMI Category: $bmiCategory',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // AppBar with light pink color
    appBar: AppBar(

    title: Text(
    'Calculate your B.M.I',
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    backgroundColor: Color.fromRGBO(206, 155, 218, 1.0),
    leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
    Navigator.pop(context);
    },
    ),
    elevation: 50,
    ),
    );
  }

  // Function to show a SnackBar with a given message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Function to set BMI category after 2 seconds
  void setBMICategory() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        if (bmiResult <= 18) {
          bmiCategory = 'You are underweight';
        } else if (bmiResult > 18 && bmiResult <= 25) {
          bmiCategory = 'You are normal';
        } else {
          bmiCategory = 'You are overweight';
        }
      });
    });
  }

  // Conditional Text widget based on BMI result
  Widget bmiCategoryText() {
    if (bmiResult <= 18) {
      return Container(
        height: 25,
        width: 35,
        color: Colors.yellow,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10.0),

        ),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'You are underweight',
          style: TextStyle(color: Colors.white)
          ,
        ),
      );
    } else if (bmiResult > 16 && bmiResult <= 25) {
      return Container(
        height: 25,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.green,
        ),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'You are normal',
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return Container(
        height: 25,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        padding: EdgeInsets.all(16.0),
        child: Text(
          'You are overweight',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void calculateBMI() {
    // Check if height and weight are not empty
    if (heightController.text.isNotEmpty && weightController.text.isNotEmpty) {
      double height = double.parse(heightController.text);
      double weight = double.parse(weightController.text);

      // Ensure height is not zero to avoid division by zero
      if (height > 0) {
        setState(() {
          bmiResult = weight / ((height / 100) * (height / 100)); // Convert height to meters
        });
        setBMICategory(); // Set BMI category after 2 seconds
      } else {
        // Handle invalid height
        showSnackBar('Please enter a valid height');
      }
    } else {
      // Handle empty height or weight
      showSnackBar('Please enter both height and weight');
    }
  }
}
