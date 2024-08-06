import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorPage> {
  // user entered values

  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  int _result = 0;

// methods
  void add() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;
      _result = number1 + number2;
    });
  }

  void subtraction() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;
      _result = number1 - number2;
    });
  }

  void multiplication() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;
      _result = number1 * number2;
    });
  }

  void division() {
    setState(() {
      int number1 = int.tryParse(_number1Controller.text) ?? 0;
      int number2 = int.tryParse(_number2Controller.text) ?? 0;

      double ans = number1 / number2;
      _result = ans.ceil();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _number1Controller.dispose();
    _number2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _number1Controller,
              decoration: InputDecoration(
                  hintText: "Enter First number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: const EdgeInsets.all(20)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _number2Controller,
              decoration: InputDecoration(
                  hintText: "Enter Second number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: const EdgeInsets.all(20)),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                _result.toString(),
                style: const TextStyle(fontSize: 42),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: add,
              child: const Text("+"),
            ),
            FloatingActionButton(
              onPressed: subtraction,
              child: const Text("-"),
            ),
            FloatingActionButton(
              onPressed: multiplication,
              child: const Text("*"),
            ),
            FloatingActionButton(
              onPressed: division,
              child: const Text("/"),
            )
          ],
        ),
      ),
    );
  }
}
