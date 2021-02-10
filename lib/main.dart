import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black,
                        width: 70,
                        height: 70,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.black,
                            width: 250,
                            height: 10,
                            // width: MediaQuery.of(context).size.width/2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.black,
                            width: 190,
                            height: 10,
                            // width: MediaQuery.of(context).size.width/2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 10,
                            // width: MediaQuery.of(context).size.width/2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}