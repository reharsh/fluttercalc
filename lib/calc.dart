import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String expression = "";
  String output = "";

  evalExpression() {
    setState(() {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      output = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  buttonPressed(String input) {
    if (input == 'C') {
      setState(() {
        expression = "";
        output = "";
      });
    } else if (input == 'Del') {
      if (expression.length > 0) {
        setState(() {
          expression = expression.substring(0, expression.length - 1);
        });
      }
    } else if (input == '=') {
      evalExpression();
    } else {
      setState(() {
        expression += input;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .2,
                alignment: Alignment.centerRight,
                child: Text(
                  expression,
                  textScaleFactor: 2,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .2,
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  textScaleFactor: 2,
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            buttonText: 'C',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: 'Del',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '%',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '/',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            buttonText: '7',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '8',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '9',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '*',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            buttonText: '4',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '5',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '6',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '-',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            buttonText: '1',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '2',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '3',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '+',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                            buttonText: '.',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '0',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '00',
                            buttonColor: Colors.blue,
                            buttonPressed: buttonPressed),
                        MyButton(
                            buttonText: '=',
                            buttonColor: Colors.orange,
                            buttonPressed: buttonPressed),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
