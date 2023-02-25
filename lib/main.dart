// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPageState(),
    );
  }
}

class LoginPageState extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<LoginPageState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _goToHomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

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
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (usernameController.text == 'admin' &&
                      passwordController.text == '123') {
                    _goToHomePage(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Incorrect username or password.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[ DataKelompok(),    const AddSubtractPage()  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Data Kelompok',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add/Subtract',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}



class AddSubtractPage extends StatefulWidget {
  const AddSubtractPage({super.key});

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
        title: const Text("Add/Subtract"),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(
                labelText: "Number 1",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(
                labelText: "Number 2",
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _calculateResult,
                  child: const Text("+"),
                ),
                ElevatedButton(
                  onPressed: _calculateSubtractResult,
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Result: $_result",
              style: const TextStyle(
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

class DataKelompok extends StatelessWidget {



  final List<Map<String, dynamic>> people = [
    {'name': 'John', 'age': 25},
    {'name': 'Sarah', 'age': 32},
    {'name': 'Michael', 'age': 18},
  ];

  DataKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Kelompok"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(people[index]['name']),
                    subtitle: Text('Age: ${people[index]['age']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
