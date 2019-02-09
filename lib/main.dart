import 'package:flutter/material.dart';

double x = 0, n1 = 2, n2 = 3;
String ans = '0.0';

class NumIn extends StatefulWidget {
  final int obj;
  const NumIn({this.obj}) : super();
  final String str = 'a';
  @override
  _NumInState createState() => _NumInState();
  int val() {
    return int.parse(str);
  }
}

class _NumInState extends State<NumIn> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[300],
          hintText: 'Enter a number'),
      keyboardType: TextInputType.numberWithOptions(),
      controller: myController,
      onChanged: (str) {
        str = myController.text;
        if (widget.obj == 1) {
          print(str);
          n1 = double.parse(str);
          print(n1.toString());
        } else {
          print(str);
          n2 = double.parse(str);
        }
      },
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int n = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add numbers"),
        ),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          new Container(
            child: new Column(children: <Widget>[
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 12.0),
                  child: Text(
                    x.toString(),
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.blueGrey[200],
                        fontStyle: FontStyle.italic),
                  )),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    NumIn(obj: 1),
                    NumIn(obj: 2),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new OutlineButton(
                        padding: new EdgeInsets.all(24.0),
                        child: new Text(
                          '+',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueGrey,
                        onPressed: () {
                          setState(() {
                            x = n1 + n2;
                          });
                        },
                      ),
                    ),
                    new Expanded(
                      child: new OutlineButton(
                        padding: new EdgeInsets.all(24.0),
                        child: new Text(
                          '*',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueGrey,
                        onPressed: () {
                          setState(() {
                            x = n1 * n2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ])));
  }
}
