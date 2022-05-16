import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCountryView extends StatefulWidget {
  String countryName;
  String countryFlag;
  int cases;
  int deaths;
  int recovered;
  int critical;
  int todayRecovered;
  int todayCases;
  int todayDeath;

  SingleCountryView(
      {required this.cases,
      required this.recovered,
      required this.countryFlag,
      required this.deaths,
      required this.countryName,
      required this.todayCases,
      required this.critical,
      required this.todayRecovered,
      required this.todayDeath});

  @override
  State<SingleCountryView> createState() => _SingleCountryViewState();
}

class _SingleCountryViewState extends State<SingleCountryView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.countryName),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 50.h,
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(widget.countryFlag),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Cases",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.cases.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Recovered",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.recovered.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Deaths",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.deaths.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Critical",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.critical.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TodayCases",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.todayCases.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TodayDeaths",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.todayDeath.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.h, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TodayRecovered",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              widget.todayRecovered.toString(),
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 65.h,
                      ),
                    ],
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
