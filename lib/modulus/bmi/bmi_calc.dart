import 'package:eraa_soft/shared/component.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int currentIndex = 0;
  double height=0.0;
  double weight=0.0;

  String result="";

  @override
  Widget build(BuildContext context) {
    var heightController = TextEditingController();
    var weightController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                radioBottom('Male', Colors.blue, 0),
                SizedBox(
                  width: 8,
                ),
                radioBottom('FeMale', Colors.pink, 1),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Your height in CM',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 15,),
            defaultTextField(
                controller: heightController,
                inputText: TextInputType.number,
                validator: (value) {},
                label: 'Your height'),
            const SizedBox(height: 15,),
            const Text(
              'Your weight in KG',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 15,),
            defaultTextField(
                controller: weightController,
                inputText: TextInputType.number,
                validator: (value) {},
                label: 'Your weight'),
            const SizedBox(height: 15,),
            defaultBottom(function: (){
              setState(() {
                height=double.parse(heightController.value.text);
                weight=double.parse(weightController.value.text);

              });
              calculateBMI(height, weight);
            }, text: 'Calculate'),
            const SizedBox(height: 25,),
            const Text(
              'Your BMI is :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Center(
              child: Text(
                result,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const SizedBox(height: 25,),

            Center(
              child: Text(
                weight==0.0?"":weightDetect(weight),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget radioBottom(String gander, Color color, int index) => Expanded(
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: currentIndex == index ? color : Colors.grey[300],
          ),
          // child: FlatButton(
          //     onPressed: () {
          //       changeIndex(index);
          //     },
          //     child: Text(
          //       gander,
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 15,
          //           color: currentIndex == index ? Colors.white : Colors.black),
          //     )),
        ),
      );
  void calculateBMI(double height,double weight){

    double BMIResult=weight /(height*height/10000);

    String finalResult=BMIResult.toStringAsFixed(2);
    setState(() {
      result=finalResult;
    });

  }
  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  String weightDetect(double weight){

    if(weight>=100){
      return 'You are over weight';

    }
    else if(weight<100 && weight >=75){
        return 'You must lose weight';
    }
    else if(weight<75 && weight >=65)
      {
        return 'You are perfect';
      }
    else{
      return 'You are thin';
    }

  }
}
