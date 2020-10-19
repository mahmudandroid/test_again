import 'package:flutter_car/widget/card_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car/widget/sideDrawer.dart';
import '../model/data.dart';
import 'package:flutter_car/screen/detiles_car.dart';

class HomeCar extends StatefulWidget {
  @override
  _HomeCarState createState() => _HomeCarState();
}

class _HomeCarState extends State<HomeCar> {

  List<Filter> filters = getFilterList();
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        title: Row(
          children: [
            Text(
              "POR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
//          style: GoogleFonts.muli(
//            fontSize: 28,
//            fontWeight: FontWeight.bold,
//            color: Colors.black,
//          ),
            ),
            Text(
              "DRIVE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[70],
                    contentPadding: EdgeInsets.only(
                      left: 30,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.0, left: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 16,
              ),

              Text(
                "Cars show" ,
//                "Available Cars (" + getCarList().length.toString() + ")",
                style: TextStyle(
                  color: Colors.black,

                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: getCarList().map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CarDetails(car: item)),
                        );
                      },
                      child: CardCar(item, null)
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }


}