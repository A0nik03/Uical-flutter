import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uical/buttons.dart';
import 'glass_container.dart';

class Wel extends StatefulWidget {
  const Wel({Key? key}) : super(key: key);

  @override
  State<Wel> createState() => _WelState();
}

class _WelState extends State<Wel> {
  final List<String> buttonList = [
    'AC',
    'CLR',
    '/',
    '*',
    '7',
    '8',
    '9',
    '-',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '=',
    '0',
    '.',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/1.jpg",
              fit: BoxFit.cover,
            ),
          ),

        ],
      ),
    );
  }
  Widget customButton(String text){
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: (){},
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const[
            BoxShadow(
              color: Colors.white,
              blurRadius: 4,
              spreadRadius: 0.5,
              offset: Offset(-3, -3),
            ),
          ],
        ),
       child: Center(
         child: Text(text,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
       ),
      ),
    );
  }
}
