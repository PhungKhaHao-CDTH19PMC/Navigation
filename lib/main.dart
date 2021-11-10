import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class Todo {
  final int a;
  final String title;
  final String description;
  const Todo(this.a, this.title, this.description);
}

TextEditingController num1 = new TextEditingController();
TextEditingController num2 = new TextEditingController();

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  TextEditingController num1 = new TextEditingController();
  TextEditingController num2 = new TextEditingController();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.email_sharp,
              color: Colors.pink,
              size: 150,
            ),
            const Text(
              'SignIn',
              style: TextStyle(
                color: Colors.white,
                fontSize: 70,
              ),
            ),
            const Text(
              'Speak, friend, and enter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 60, 32, 20),
              child: TextField(
                controller: num1,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 80),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                controller: num2,
              ),
            ),
            SizedBox(
              width: 430.0,
              height: 50.0,
              child: OutlinedButton(
                onPressed: () {
                  if (num1.text == '' || num2.text == '') {
                    result = "Vui lòng nhập đầy đủ thông tin";
                  } else if (num1.text != num2.text) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirtRoute()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()));
                  }
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(result),
            )
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TodosScreen());
  }
}

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  _EmailScreen createState() => _EmailScreen();
}

class _EmailScreen extends State<TodosScreen> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  int number1 = 99;
  int number2 = 99;
  int number3 = 99;
  int number4 = 99;
  int number5 = 99;
  int number6 = 99;
  int number7 = 99;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MailBoxes',
        ),
        backgroundColor: Colors.grey,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstRoute()));
                },
              )
            : null,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.blue,
              textStyle: const TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FirstRoute()));
            },
            child: const Text('Done'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 0, 0),
            height: 50,
            color: Colors.grey[400],
            child: Text('MailBoxes'),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    }),
                Icon(Icons.email),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'All Inboxes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number1.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    }),
                Icon(Icons.cloud),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'iCloud',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number2.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    }),
                Icon(Icons.email),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Gmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number3.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    }),
                Icon(Icons.email),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Hotmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number4.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked5,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked5 = value!;
                      });
                    }),
                Icon(Icons.mail_rounded),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'VIP',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number5.toString()),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 18, 0, 0),
            height: 50,
            color: Colors.grey[400],
            child: Text('Special folder'),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked6,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked6 = value!;
                      });
                    }),
                Icon(Icons.security_outlined),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Secure',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number6.toString()),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: isChecked7,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked7 = value!;
                      });
                    }),
                Icon(Icons.notifications_active),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Notifications',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(number7.toString()),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 295),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (isChecked1 == true) {
                      number1 = 0;
                    }
                    if (isChecked2 == true) {
                      number2 = 0;
                    }
                    if (isChecked3 == true) {
                      number3 = 0;
                    }
                    if (isChecked4 == true) {
                      number4 = 0;
                    }
                    if (isChecked5 == true) {
                      number5 = 0;
                    }
                    if (isChecked6 == true) {
                      number6 = 0;
                    }
                    if (isChecked7 == true) {
                      number7 = 0;
                    }
                    setState(() {});
                  },
                  color: Theme.of(context).accentColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'DELETE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.delete_outline_rounded,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(todo.a.toString()),
            Text('   '),
            Text(todo.description)
          ],
        ),
      ),
    );
  }
}

class ThirtRoute extends StatelessWidget {
  const ThirtRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.email_sharp,
              color: Colors.pink,
              size: 150,
            ),
            const Text(
              "UPS...countn' sign in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Your username and password do not match',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const Text(
              'Please try again',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(32, 100, 32, 32),
              child: SizedBox(
                width: 430.0,
                height: 50.0,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    'TRY AGAIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SecondRoute()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.email,
                size: 200,
              ),
              const Text(
                'SignIn',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ),
              ),
              const Text(
                'Speak, friend, and enter',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 200),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}
