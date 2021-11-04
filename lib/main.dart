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
    return Scaffold(
        body: TodosScreen(
      todos: List.generate(
          5,
          (i) => Todo(
                i,
                'Todo $i',
                'A description of what needs to be done for Todo $i',
              )),
    ));
  }
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    Widget checkboxWidget = Checkkbox(title: "title");
    Widget deletebuttonWidget = DeleteButton(title: "title");
    Widget numberWidget = Number(title: "title");
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
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
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
                numberWidget,
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
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                checkboxWidget,
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
                numberWidget,
              ],
            ),
          ),
          deletebuttonWidget,
        ],
      ),
    );
  }
}

class Checkkbox extends StatefulWidget {
  const Checkkbox({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Checkkbox> createState() => _Checkkbox();
}

class _Checkkbox extends State<Checkkbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            }),
      ],
    );
  }
}

class DeleteButton extends StatefulWidget {
  const DeleteButton({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<DeleteButton> createState() => _DeleteButton();
}

class _DeleteButton extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 274),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            onPressed: () {},
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
    );
  }
}

class Number extends StatefulWidget {
  const Number({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Number> createState() => _Number();
}

class _Number extends State<Number> {
  int number = 99;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Text(number.toString()),
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
