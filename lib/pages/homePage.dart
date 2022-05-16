import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:zaant/models/casesModel.dart';
import 'package:zaant/pages/countriesScreen.dart';
import 'package:zaant/services/allCasesApi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  casesDetailsTile(
      int cases,
      int deaths,
      int recovered,
      int critical,
      int todayDeaths,
      int todayRecovered,
      int affectedCountries,
      int todayCases) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 20.h),
      decoration: BoxDecoration(
          color: Colors.black26, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Cases",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  cases.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Recovered",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  recovered.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Deaths",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  deaths.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Critical",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  critical.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TodayCases",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  todayCases.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TodayDeaths",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  todayDeaths.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "TodayRecovered",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  todayRecovered.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
          Container(
            padding: EdgeInsets.fromLTRB(25.w, 0, 25.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "AffectedCountries",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  affectedCountries.toString(),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
          Divider(height: 60.h),
        ],
      ),
    );
  }

  ApiServices apiServices = new ApiServices();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                FutureBuilder(
                    future: apiServices.allCases(),
                    builder: (context, AsyncSnapshot<CasesModel> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            PieChart(
                              dataMap: {
                                "cases": double.parse(
                                    snapshot.data!.cases.toString()),
                                "recovered": double.parse(
                                    snapshot.data!.recovered.toString()),
                                "deaths": double.parse(
                                    snapshot.data!.deaths.toString()),
                              },
                              animationDuration: Duration(milliseconds: 800),
                              chartLegendSpacing: 45,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3.2,
                              colorList: colors,
                              initialAngleInDegree: 0,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 32,

                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.left,
                                showLegends: true,
                                // legendShape: _BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValueBackground: true,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: true,
                                decimalPlaces: 1,
                              ),
                              // gradientList: ---To add gradient colors---
                              // emptyColorGradient: ---Empty Color gradient---
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountriesPage()),
                                );
                              },
                              child: Container(
                                width: 200.w,
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(45.r)),
                                child: Text(
                                  "View Countries List",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            casesDetailsTile(
                                snapshot.data!.cases,
                                snapshot.data!.deaths,
                                snapshot.data!.recovered,
                                snapshot.data!.critical,
                                snapshot.data!.todayDeaths,
                                snapshot.data!.todayRecovered,
                                snapshot.data!.affectedCountries,
                                snapshot.data!.todayCases)
                          ],
                        );
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 250),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
