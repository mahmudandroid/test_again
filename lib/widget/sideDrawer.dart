import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_car/screen/filter_search.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(0), topRight: Radius.circular(10)),
          child: Container(
            // decoration: BoxDecoration(
            //gradient: SweepGradient(colors: [Colors.red, Colors.orange])),
            width: MediaQuery.of(context).size.width / 1.4,
            child: Drawer(
              elevation: 0.0,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListView(
                  padding: EdgeInsets.only(left: 15),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            ),
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  height: 80,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/logo2.png"),
                                          fit: BoxFit.cover)),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.home,
                          ),
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onTap: () {}),
                    ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.directions_car,
                          ),
                        ),
                        title: Text(
                          "Cars",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FilterSearch();
                          }));
                        }),
                    ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.people,
                          ),
                        ),
                        title: Text(
                          "About Us",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onTap:
                            () {} /* => Navigator.of(context)
                    .pushReplacementNamed(OrderDetails.routeName),*/
                        ),
                    ListTile(
                        leading: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.reorder,
                          ),
                        ),
                        title: Text(
                          "How order",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        onTap:
                            () {} /* => Navigator.of(context)
                    .pushReplacementNamed(OrderDetails.routeName),*/
                        ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
