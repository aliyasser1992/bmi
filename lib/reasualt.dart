import 'package:flutter/material.dart';

class Reasualt extends StatelessWidget {
  final double reasualt;
  final bool isMale;
  final int age;

  const Reasualt(
      {Key? key,
      required this.reasualt,
      required this.isMale,
      required this.age})
      : super(key: key);
  String get resaultPharse{
    String resaultText = '';
    if(reasualt >=30) resaultText = 'Obese';
    else if(reasualt > 25 && reasualt<30) resaultText = 'Over weight';
    else if(reasualt >= 18 && reasualt<=24.9) resaultText = 'Normal';
    else  resaultText = 'Thin';
    return resaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resualt'),centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround    ,
            children:  [
              Text(' Gender: ${isMale? 'Male':'Female'}',
                style: Theme.of(context).textTheme.headline1
              ),
              Text('Resualt: ${reasualt.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline1
              ),
              Text('Healthness: $resaultPharse',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
             ),

              Text('Age: ${age}',
                style: Theme.of(context).textTheme.headline1),

            ],
          ),
        ),
      ),
    );
  }
}
