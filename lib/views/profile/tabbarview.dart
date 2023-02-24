import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: ButtonsTabBar(
                    radius: 12,
                    contentPadding: EdgeInsets.only(left: 15,right: 15,),
                    backgroundColor: Colors.green,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    tabs:[
                      Tab(
                        child: Text('srushti',style: TextStyle(fontSize: 20),),
                      ),
                      Tab(
                        child: Text('drashti',style: TextStyle(fontSize: 20),),
                      ),
                      Tab(
                        child: Text('payal',style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(
                        child: Icon(Icons.directions_car),
                      ),
                      Center(
                        child: Icon(Icons.directions_transit),
                      ),
                      Center(
                        child: Icon(Icons.directions_bike),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}