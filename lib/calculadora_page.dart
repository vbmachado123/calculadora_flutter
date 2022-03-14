import 'package:calculadora/button_widget.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({Key? key}) : super(key: key);

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String result = "";

  void addValue(var value) {
    switch (value) {
      case "AC":
        result = "";
        break;
      case "+/-":
        result = (double.parse(result) * -1).toString();
        break;
      case ",":
        if (!result.contains(",")) {
          result += value;
        }
        break;
      case "%":
        result = (double.parse(result) / 100).toString();
        break;
      case "=":
        calculate();
        break;
      default:
        result += value;
    }

    setState(() {});
  }

  calculate() {
    var symbols = ["+", "-", "*", "/"];
    var symbol;
    for (var s in symbols) {
      if (result.contains(s)) {
        symbol = s;
        break;
      }
    }

    var leftSide = int.parse(result.split(symbol)[0]);
    var rightSide = int.parse(result.split(symbol)[1]);
    switch (symbol) {
      case "+":
        result = (leftSide + rightSide).toString();
        break;
      case "-":
        result = (leftSide - rightSide).toString();
        break;
      case "*":
        result = (leftSide * rightSide).toString();
        break;
      case "/":
        result = (leftSide / rightSide).toString();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff031D29),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * .4,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      false,
                      label: "AC",
                      onTap: () => addValue("AC"),
                      color: Colors.grey,
                    ),
                    ButtonWidget(
                      false,
                      label: "+/-",
                      onTap: () => addValue("+/-"),
                      color: Colors.grey,
                    ),
                    ButtonWidget(
                      false,
                      label: "%",
                      onTap: () => addValue("%"),
                      color: Colors.grey,
                    ),
                    ButtonWidget(
                      false,
                      label: "/",
                      onTap: () => addValue("/"),
                      color: Colors.orange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      false,
                      label: "7",
                      onTap: () => addValue("7"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "8",
                      onTap: () => addValue("8"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "9",
                      onTap: () => addValue("9"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "X",
                      onTap: () => addValue("*"),
                      color: Colors.orange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      false,
                      label: "4",
                      onTap: () => addValue("4"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "5",
                      onTap: () => addValue("5"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "6",
                      onTap: () => addValue("6"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "-",
                      onTap: () => addValue("-"),
                      color: Colors.orange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      false,
                      label: "1",
                      onTap: () => addValue("1"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "2",
                      onTap: () => addValue("2"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "3",
                      onTap: () => addValue("3"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "+",
                      onTap: () => addValue("+"),
                      color: Colors.orange,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      true,
                      label: "0",
                      onTap: () => addValue("0"),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: ",",
                      onTap: () => addValue(","),
                      color: Colors.white,
                    ),
                    ButtonWidget(
                      false,
                      label: "=",
                      onTap: () => addValue("="),
                      color: Colors.orange,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
