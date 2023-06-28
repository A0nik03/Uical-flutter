import 'package:flutter/material.dart';
import 'package:uical/buttons.dart';
import 'glass_container.dart';
import 'package:math_expressions/math_expressions.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
 //variables
  var input = '';
  var output = '';

  final List<String> buttons = [
    'AC', 'C', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.','ANS','=',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/5.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Glassmorphism(
                height: size.height,
                width: size.width,
                blur: 25,
                opacity: 0.2,
                radius: 20,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 100),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Text(input,style: const TextStyle(fontSize: 32,color:Colors.black54),),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(child:
                              Text(output,style: const TextStyle(fontSize: 42),),),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            child: GridView.builder(
                              itemCount: buttons.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                if(index == 19){
                                  return MyButton(
                                    buttonTapped: (){
                                      setState(() {
                                        equalPressed();
                                      });
                                    },
                                    buttonText: buttons[index],
                                    color: Colors.blueAccent.withOpacity(0.8),
                                    textColor: Colors.white,
                                  );
                                }
                                else if(index == 0){
                                  return MyButton(
                                    buttonTapped: (){
                                      setState(() {
                                        input = '';
                                        output = '';
                                      });
                                    },
                                    buttonText: buttons[index],
                                    color: isOperator(buttons[index])?Colors.blue[100]?.withOpacity(0.5):Colors.grey[200]?.withOpacity(0.5),
                                    textColor: Colors.blue[100],
                                  );
                                }
                                else if(index == 1){
                                  return MyButton(
                                    buttonTapped: (){
                                      setState(() {
                                        input = input.substring(0,input.length-1);
                                      });
                                    },
                                    buttonText: buttons[index],
                                    color: isOperator(buttons[index])?Colors.blue[100]?.withOpacity(0.5):Colors.grey[200]?.withOpacity(0.5),
                                    textColor: Colors.red[50],
                                  );
                                }
                                else{
                                  return MyButton(
                                    buttonTapped: (){
                                      setState(() {
                                        input += buttons[index];
                                      });
                                    },
                                    buttonText: buttons[index],
                                    color: isOperator(buttons[index])?Colors.blue[100]?.withOpacity(0.5):Colors.grey[200]?.withOpacity(0.5),
                                    textColor: isOperator(buttons[index])?Colors.lightBlue:Colors.white,
                                  );
                                }
                              },
                            ),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        ],

      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == '*' || x == '+' || x == '-' || x == '%') {
      return true;
    }
    return false;
  }
  void equalPressed(){
    String finalQuestion = input;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    output = eval.toString();

  }
}
