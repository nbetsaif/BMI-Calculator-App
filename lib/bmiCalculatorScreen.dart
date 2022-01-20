import 'dart:math';

import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  _BmiCalculatorScreenState createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  @override
   bool isMale=true;
  double height=120;
  int weight=70;
  int age=20;
  late double result;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text('BMI CALCULATOR',
            style: TextStyle(fontWeight: FontWeight.w800),
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          color: isMale? Colors.blue : Colors.grey[300],),
                        child: Column(
                          children: [
                            Container(child: Image(image: AssetImage('assets/images/male.png')),
                            height: 170,
                            ),
                            Text('Male',style:
                              TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w800,
                              ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          color:isMale? Colors.grey[300]:Colors.blue,),
                        child: Column(
                          children: [
                            Container(child: Image(image: AssetImage('assets/images/female.png')),
                              height: 170,
                            ),
                            Text('Female',style:
                            TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w800,
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[300],),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style:
                    TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',style:
                        TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w800,
                        ),),
                        Text('CM',style:
                        TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),),
                      ],
                    ),
                    Slider(value:height , onChanged:(value){
                      setState(() {
                        height=value;
                      });
                    },
                      min: 80,
                      max: 220,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[300],),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',style:
                          TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text('$weight',style:
                          TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon:Icon(Icons.add,color: Colors.white,)
                                ),
                              ),
                              SizedBox(width: 5,),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon:Icon(Icons.remove,color: Colors.white,)
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey[300],),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style:
                          TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),),
                          Text('$age',style:
                          TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon:Icon(Icons.add,color: Colors.white,)
                                ),
                              ),
                              SizedBox(width: 5,),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon:Icon(Icons.remove,color: Colors.white,)
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Container(
            height: 65,
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              onPressed: (){
                result=weight/ pow(height/100,2);
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ResultScreen(result: result.round(),age: age,gender: isMale,))
                );
              },
              child: Text('Calculate',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 25
                  ),),

            ),
          )
        ],
      ),
    );
  }
}
