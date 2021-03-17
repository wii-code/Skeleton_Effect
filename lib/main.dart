import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_effect/services/ApiServices.dart';
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

  Future postFuture;

  ApiService api = new ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postFuture =  api.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: postFuture,
            builder:(BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.data == null) {
                return ListView.builder(
                  itemCount: 20 ,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: 110,
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
                            ),
                          )),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length ,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 110,
                            height: 110,
                            child: Image(image: NetworkImage("https://i.pinimg.com/236x/c1/ee/28/c1ee28b9c07e6d3568128dcbfcff2a1a.jpg"),fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              Text(snapshot.data[index]["title"],  overflow: TextOverflow.ellipsis,),
                                SizedBox(
                                  height: 10,
                                ),

                               Text(snapshot.data[index]["body"],overflow: TextOverflow.ellipsis,),
                                SizedBox(
                                  height: 10,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }

        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}