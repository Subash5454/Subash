import 'package:flutter/material.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size=0;
  String inputValue = "", calculatorvalue = "", operator = "",display = "",dis = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width/5;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 8, 4),
        body:
        Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(display,style: TextStyle(fontSize: 25,color: Colors.white54)),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(inputValue,style: TextStyle(fontSize: 100,color: Colors.white54)),
            ),
            Column(
              children: [
                Row(
                  children: [
                    calcbutton("7",Colors.white54),
                    calcbutton("8",Colors.white54),
                    calcbutton("9",Colors.white54),
                    calcbutton("/",Colors.orange),
                  ]
                  ),
                  Row(
                  children: [
                    calcbutton("4",Colors.white54),
                    calcbutton("5",Colors.white54),
                    calcbutton("6",Colors.white54),
                    calcbutton("*",Colors.orange),
                  ]
                  ),
                  Row(
                  children: [
                    calcbutton("1",Colors.white54),
                    calcbutton("2",Colors.white54),
                    calcbutton("3",Colors.white54),
                    calcbutton("-",Colors.orange),
                  ]
                  ),
                  Row(
                  children: [
                    calcbutton("0",Colors.white54),
                    calcbutton(".",Colors.white54),
                    calcbutton("=",Colors.orange),
                    calcbutton("+",Colors.orange),
                  ]
                  ),
                  ],
                ),
                calcbutton("Clear", Colors.black54)
              ],
            ),
        ),
      );
  }

Widget calcbutton(String text, Color bgcolor)
{
  return InkWell(
    onTap: () {
      if(text=="Clear")
      {
        setState(() {
          inputValue = "";
          display = "";
        });
      }
      else if(text == "+" || text == "-" || text == "/" || text == "*")
      {
        setState(() {
          calculatorvalue = inputValue;
          operator = text;
          display = dis + text;
          inputValue = "";
        });
        
      }
      else if(text=="=")
      {
        int calci = int.parse(calculatorvalue);
        int input = int.parse(inputValue);
        display=dis+text;
        if (operator == "+")
        {
          setState(() {
            inputValue = (calci + input).toString();
          });
        }
        if (operator == "-")
        {
          setState(() {
            inputValue = (calci - input).toString();
          });
        }
        if (operator == "*")
        {
          setState(() {
            inputValue = (calci * input).toString();
          });
        }
        if(operator == "/")
        {
          setState(() {
            inputValue = (calci / input).toString();
          });
        }
      }
      else
      {
        setState(() {
          inputValue = inputValue + text;
      });
      dis=display+inputValue;
      }
    },
    child: Container(
                        decoration: BoxDecoration(
                          color:bgcolor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: EdgeInsets.all(10),
                        height: size,
                        width: size,
                        alignment: Alignment.center,
                        child: Text(text,style: TextStyle(fontSize: 30,color: Colors.white),),
                      ),
  );
}
}