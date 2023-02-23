import 'package:flutter/material.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas TPM 1'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 32.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  
                   _goToHomePage(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSubtractPage extends StatefulWidget {
  @override
  _AddSubtractPageState createState() => _AddSubtractPageState();
}

class _AddSubtractPageState extends State<AddSubtractPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  int _result = 0;

  void _calculateResult() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);

    setState(() {
      _result = num1 + num2;
    });
  }

  void _calculateSubtractResult() {
    int num1 = int.parse(_num1Controller.text);
    int num2 = int.parse(_num2Controller.text);

    setState(() {
      _result = num1 - num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Subtract"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              decoration: InputDecoration(
                labelText: "Number 1",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: InputDecoration(
                labelText: "Number 2",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _calculateResult,
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: _calculateSubtractResult,
                  child: Text("-"),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "Result: $_result",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  void _goToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSubtractPage()),
    );
  }