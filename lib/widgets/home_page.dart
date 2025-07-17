import 'package:calculator/widgets/calculatorButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int num1 = 0;
  int num2 = 0;
  String oprend = '';
  String ans = '';
  String history = '';
  String texttodisplay = '';
  void onTap(String value) {
    setState(() {
      if (value == "AC") {
        texttodisplay = '';
        num1 = 0;
        num2 = 0;
        oprend = '';
        ans = '';
        history = '';
      } else if (value == '⌫') {
        texttodisplay =
            texttodisplay.isNotEmpty
                ? texttodisplay.substring(0, texttodisplay.length - 1)
                : '';
      } else if (value == '+' ||
          value == '-' ||
          value == '*' ||
          value == '/' ||
          value == '%') {
        num1 = int.tryParse(texttodisplay) ?? 0;
        oprend = value;
        texttodisplay = '';
      } else if (value == '=') {
        num2 = int.tryParse(texttodisplay) ?? 0;
        switch (oprend) {
          case '+':
            ans = (num1 + num2).toString();
            break;
          case '-':
            ans = (num1 - num2).toString();
            break;
          case '*':
            ans = (num1 * num2).toString();
            break;
          case '/':
            ans = num2 != 0 ? (num1 / num2).toString() : 'Error';
            break;
          case '%':
            ans = (num1 % num2).toString();
            break;
        }
        history = '$num1 $oprend $num2';
        texttodisplay = ans;
      } else {
        texttodisplay += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: TextStyle(fontSize: 24, color: Colors.grey),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  texttodisplay,
                  style: TextStyle(fontSize: 48, color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 400,

              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 6,
                      childAspectRatio: 1.2,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Calculatorbutton(
                          text: 'AC',
                          onTap: () => onTap('AC'),
                          textcolor: Colors.deepOrange,
                        ),
                        Calculatorbutton(
                          icon: Icon(Icons.backspace, color: Colors.deepOrange),

                          onTap: () => onTap('⌫'), //addd clear
                        ),
                        Calculatorbutton(
                          text: '%',
                          onTap: () => onTap('%'),
                          textcolor: Colors.deepOrange,
                        ),
                        Calculatorbutton(
                          text: '/',
                          onTap: () => onTap('/'),
                          textcolor: Colors.deepOrange,
                        ),
                        Calculatorbutton(text: '1', onTap: () => onTap('1')),
                        Calculatorbutton(text: '2', onTap: () => onTap('2')),
                        Calculatorbutton(text: '3', onTap: () => onTap('3')),
                        Calculatorbutton(
                          icon: Icon(
                            Icons.clear_outlined,
                            color: Colors.deepOrange,
                          ),
                          onTap: () => onTap('*'),
                        ),
                        Calculatorbutton(text: '4', onTap: () => onTap('4')),
                        Calculatorbutton(text: '5', onTap: () => onTap('5')),
                        Calculatorbutton(text: '6', onTap: () => onTap('6')),
                        Calculatorbutton(
                          text: '-',
                          onTap: () => onTap('-'),
                          textcolor: Colors.deepOrange,
                        ),
                        Calculatorbutton(text: '7', onTap: () => onTap('7')),
                        Calculatorbutton(text: '8', onTap: () => onTap('8')),
                        Calculatorbutton(text: '9', onTap: () => onTap('9')),
                        Calculatorbutton(
                          text: '+',
                          onTap: () => onTap('+'),
                          textcolor: Colors.deepOrange,
                        ),
                        Calculatorbutton(
                          icon: Icon(
                            Icons.copy_all_sharp,
                            color: Colors.deepOrange,
                          ),
                          onTap: () {},
                        ),
                        Calculatorbutton(text: '0', onTap: () => onTap('0')),
                        Calculatorbutton(text: '.', onTap: () => onTap('.')),
                        Calculatorbutton(
                          text: '=',
                          textcolor: Colors.white,
                          onTap: () => onTap('='),
                          color: const Color.fromARGB(255, 232, 104, 65),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      actions: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.calculate_outlined,
                    size: 24,
                    color:
                        _selectedIndex == 0 ? Colors.deepOrange : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.window,
                    size: 24,
                    color:
                        _selectedIndex == 1 ? Colors.deepOrange : Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      'assets/icons/bank.svg',
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 2 ? Colors.deepOrange : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset(
                      'assets/icons/kebab.svg',
                      colorFilter: ColorFilter.mode(
                        _selectedIndex == 3 ? Colors.deepOrange : Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
