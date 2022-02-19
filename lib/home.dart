import 'dart:math';

import 'package:bmi_index/reasualt.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 172;
  int weight = 80;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m1Expanded(context, 'male'),
                  const SizedBox(
                    width: 15,
                  ),
                  m1Expanded(context, 'female'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style:
                         Theme.of(context).textTheme.headline2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${heightVal.toStringAsFixed(1)} ',style:
                          Theme.of(context).textTheme.headline1,),
                        Text('cm',style:
                         Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                    Slider(
                        min: 90,
                        max: 220,
                        value: heightVal, onChanged: (newValue) {
                          setState(() {
                            heightVal=newValue;
                          });
                    })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  m2Expanded(context, 'weight'),
                  const SizedBox(
                    width: 15,
                  ),
                  m2Expanded(context, 'age'),
                ],
              ),
            ),
          ),
          Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              child: TextButton(
                onPressed: () {
                  var resualt = weight / pow(heightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Reasualt(
                          reasualt: resualt, isMale: isMale, age: age);
                    }),
                  );
                },
                child: Text(
                  'Get your Resualt',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ))
        ],
      )),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (isMale && type == 'male') || (!isMale && type == 'female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'age' : 'weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? age-- : weight--,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? age++ : weight++,
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
