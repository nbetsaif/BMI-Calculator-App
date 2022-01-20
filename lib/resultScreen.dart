import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  late final int result;
  late final int age;
  late final bool gender;

  ResultScreen({ required result,required age,required gender})
  {
    this.result=result;
    this.age=age;
    this.gender=gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Result'),),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Gender :${gender ? ' Male' : ' Female'}',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600),),
            Text('Result : $result',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600)),
            Text('Age : $age',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w600))

          ],
        ),
      ),
    );
  }
}
