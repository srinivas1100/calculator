import 'package:calculator/numberkey.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history ='';
  String _expression = '';
  

  void numClick(String text) {
    setState(() {
       _expression += text;
    });
  }
  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }
  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }
  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(child: Text(_history, style: TextStyle(color: Colors.black54,fontSize: 20),)),
                    Container(child: Text(_expression, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, ),)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(num: 'AC', callback: () => allClear('')),
                      NumberKey(num: '%', callback: () => numClick('%')),
                      NumberKey(num: 'C', callback: () => clear('')),
                      NumberKey(num: '/', callback: () => numClick('/')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(num: '7', callback: () => numClick('7')),
                      NumberKey(num: '8', callback: () => numClick('8')),
                      NumberKey(num: '9', callback: () => numClick('9')),
                      NumberKey(num: '*', callback: () => numClick('*')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(num: '4', callback: () => numClick('4')),
                      NumberKey(num: '5', callback: () => numClick('5')),
                      NumberKey(num: '6', callback: () => numClick('6')),
                      NumberKey(num: '-', callback: () => numClick('-')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(num: '1', callback: () => numClick('1')),
                      NumberKey(num: '2', callback: () => numClick('2')),
                      NumberKey(num: '3', callback: () => numClick('3')),
                      NumberKey(num: '+', callback: () => numClick('+')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(num: '00', callback: () => numClick('00')),
                      NumberKey(num: '0', callback: () => numClick('0')),
                      NumberKey(num: '.', callback: () => numClick('.')),
                      NumberKey(num: '=', callback: () => evaluate(_expression)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
