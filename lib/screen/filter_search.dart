import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FilterSearch extends StatefulWidget {
  FilterSearch() : super();

  final String title = "FilterSearch Demo";

  @override
  FilterSearchState createState() => FilterSearchState();
}

class Brand {
  int id;
  String name;

  Brand(this.id, this.name);

  static List<Brand> getCompanies() {
    return <Brand>[
      Brand(1, 'Land Rover'),
      Brand(2, 'Alfa Romeo'),
      Brand(3, 'Nissan'),
      Brand(4, 'Acura'),
      Brand(5, 'Chevrolet'),
    ];
  }
}

class FilterSearchState extends State<FilterSearch> {
  double _lowerValue = 50;
  double _upperValue = 180;

  //
  List<Brand> _companies = Brand.getCompanies();
  List<DropdownMenuItem<Brand>> _dropdownMenuItems;
  Brand _selectedBrand;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedBrand = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Brand>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Brand>> items = List();
    for (Brand company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Brand selectedBrand) {
    setState(() {
      _selectedBrand = selectedBrand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: Text(
            "Search",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
        ),
        body: new Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Select a company"),
                      Container(
                        width: double.infinity,
                        child: DropdownButton(
                          icon: null,
                          value: _selectedBrand,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Select a company"),
                      Container(
                        width: double.infinity,
                        child: DropdownButton(
                          icon: null,
                          value: _selectedBrand,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Select a company"),
                      Container(
                        width: double.infinity,
//                        decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(7),
//                            border: Border.all(
//                              color: Colors.grey,
//                              width: 1,
//                            )),
                        child: DropdownButton(
                          icon: null,
                          value: _selectedBrand,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                        ),
                      ),
//                        SizedBox(
//                          height: 20.0,
//                        ),
//                        Text('Selected: ${_selectedBrand.name}'),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Select a company"),
                  Container(
                    width: 330,
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    alignment: Alignment.centerLeft,
                    child: FlutterSlider(
                      key: Key('3343'),
                      values: [300000000, 1600000000],
                      rangeSlider: true,
                      tooltip: FlutterSliderTooltip(
                        alwaysShowTooltip: true,
                      ),
                      max: 2000000000,
                      min: 0,
                      step: FlutterSliderStep(step: 20),
                      jump: true,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        _lowerValue = lowerValue;
                        _upperValue = upperValue;
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: 30,
                      width: double.infinity,
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        "Search",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
