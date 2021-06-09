import 'package:flutter/material.dart';
import 'package:smart_homeapp/content/constent.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f4f6),
      appBar: AppBar(
        backgroundColor: Color(0xfff1f4f6),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),          child: Icon(
            Icons.ac_unit_outlined,
            color: Colors.grey,
            size: 20,
          ),
        ),
        title: Text('25°C',style: appbar_title,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 20,
            ),
          )
        ],
      ),
      body: MySmartHome(),
    );
  }
}

class MySmartHome extends StatefulWidget {
  @override
  _MySmartHomeState createState() => _MySmartHomeState();
}

class _MySmartHomeState extends State<MySmartHome> {

  final List<String> smartIcon = <String>[
    'assets/images/air-conditioner.png',
    'assets/images/television.png',
    'assets/images/light-bulb.png',
    'assets/images/laundry.png',
    'assets/images/refrigerator.png',
    'assets/images/router.png',
  ];
  final List<String> smartTask = <String>[
    'Air Conditioner',
    'Smart TV',
    'Light Bulb',
    'Washing Machine',
    'Refrigerator',
    'Router',
  ];
  final List<String> smartBrand = <String>[
    'Yoltas RS140',
    'Samsung Ex55 4k',
    'Philips Hue 2',
    'Bosch 7kg 5475',
    'Whirlpool WR190',
    '1P-Link-878',
  ];


  bool status = false;


  double height;
  double width;

  @override
  Widget build(BuildContext context) {
   width = MediaQuery.of(context).size.width;
   height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: height*0.02),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: smartIcon.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.1,crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      child: Column(
                        children: [
                          Card(
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation:10,
                            child: Container(
                              margin: EdgeInsets.only(left: width*0.03),
                              height:height*0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.asset(smartIcon[index], width:width*0.06,),
                                  ),
                                  Container(
                                    child: Text(smartTask[index],style: smartTask_Style,),
                                  ),
                                  Container(
                                    child: Text(smartBrand[index],style: brand_name,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right:width*0.3),
                                    child: FlutterSwitch(
                                      width: 46,
                                      height: 21,
                                      value: status,
                                      inactiveColor: Colors.white,
                                      toggleColor: App_Color,
                                      toggleSize: 15.0,
                                      activeColor: Colors.blue[100],
                                      borderRadius:30.0,
                                      switchBorder: Border.all(
                                        color:App_Color,
                                        width: 1.4,
                                      ),
                                      onToggle: (val) {
                                        setState(() {
                                          status = val;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

            Card(
              elevation: 5,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: App_Color,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
