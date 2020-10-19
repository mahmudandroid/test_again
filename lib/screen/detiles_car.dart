import 'package:flutter/material.dart';
import 'package:flutter_car/constants/constants.dart';
import 'package:flutter_car/constants/constants.dart';
import '../model/data.dart';

class CarDetails extends StatefulWidget {
  final Car car;

  CarDetails({@required this.car});

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  int _currentImage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.car.model,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.car.brand,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ////////////
              Container(
                height: 200,
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int page) {
                    setState(() {
                      _currentImage = page;
                    });
                  },
                  children: widget.car.images.map((path) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Hero(
                        tag: widget.car.model,
                        child: Image.asset(
                          path,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              widget.car.images.length > 1
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buildPageIndicator(),
                      ),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  aboutCar("رقم الإعلان", "67864642"),
                                  aboutCar("الاسم", "GLA SUV"),
                                  aboutCar("البراند", "Mercedes"),
                                  aboutCar("النموذج", "سيارات الدفع الرباعي"),
                                  aboutCar("النوع", "سيارة رياضية"),
                                ],
                              ),
                            ),
                            bulidCon("سعر اليوم"),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  aboutCar("ناقل الحركة", "67864642"),
                                  aboutCar("نوع الجسم", "67864642"),
                                  aboutCar("اللون ", "67864642"),
                                ],
                              ),
                            ),
                            bulidCon("الضمان"),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  aboutCar("قوة الحصان", "67864642"),
                                  aboutCar("الأبواب", "67864642"),
                                  aboutCar("الوصف", "67864642"),
                                ],
                              ),
                            ),
                            bulidCallUs(" اتصل"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutCar(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget bulidCon(String title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 30,
        width: 80,
        color: Colors.red,
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  Widget bulidCallUs(String title) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 30,
        width: double.infinity,
        color: Colors.red,
        child: Center(
            child: Text(
          title + " 0913039879",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
