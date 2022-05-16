import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaant/pages/singleCountryView.dart';
import 'package:zaant/services/allCasesApi.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  // ShowCountryTile(String countryName, String flag, int cases) {
  //   return Scaffold(
  //     body: Container(
  //       child: Column(
  //         children: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               Container(
  //                 padding: EdgeInsets.only(left: 30),
  //                 child: CircleAvatar(
  //                   radius: 33,
  //                   backgroundImage: NetworkImage(flag),
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(left: 20),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Container(
  //                       padding: EdgeInsets.only(top: 10),
  //                       child: Expanded(
  //                         child: Text(
  //                           countryName,
  //                           maxLines: 1,
  //                           overflow: TextOverflow.ellipsis,
  //                           softWrap: false,
  //                           style: TextStyle(
  //                               fontSize: 18, fontStyle: FontStyle.italic),
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       padding: EdgeInsets.only(top: 10),
  //                       child: Text(
  //                         cases.toString(),
  //                         style: TextStyle(
  //                             fontSize: 18,
  //                             fontStyle: FontStyle.italic,
  //                             color: Color.fromARGB(255, 202, 201, 201)),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //           Divider(
  //             height: 60,
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  ApiServices apiServices = new ApiServices();
  TextEditingController searchC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cases from each countries"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(30.w, 50.h, 20.w, 0),
                  width: 350.w,
                  height: 45.h,
                  child: TextField(
                    controller: searchC,
                    onChanged: (val) {
                      setState(() {});
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Search Country',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                FutureBuilder(
                  future: apiServices.countriesList(),
                  builder: (context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data[index]["country"];
                            if (searchC.text.isEmpty) {
                              return Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(30, 0, 0, 15),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleCountryView(
                                                          countryName: snapshot
                                                                  .data[index]
                                                              ['country'],
                                                          todayCases: snapshot
                                                                  .data[index]
                                                              ['todayCases'],
                                                          todayRecovered: snapshot
                                                                  .data[index][
                                                              'todayRecovered'],
                                                          todayDeath: snapshot
                                                                  .data[index]
                                                              ['todayDeaths'],
                                                          countryFlag: snapshot
                                                                          .data[
                                                                      index][
                                                                  "countryInfo"]
                                                              ['flag'],
                                                          cases: snapshot
                                                                  .data[index]
                                                              ['cases'],
                                                          deaths: snapshot
                                                                  .data[index]
                                                              ['deaths'],
                                                          recovered: snapshot
                                                                  .data[index]
                                                              ['recovered'],
                                                          critical: snapshot
                                                                  .data[index]
                                                              ['critical'],
                                                        )),
                                              );
                                            },
                                            child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage: NetworkImage(
                                                  snapshot.data[index]
                                                      ['countryInfo']["flag"]),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SingleCountryView(
                                                            countryName:
                                                                snapshot.data[
                                                                        index]
                                                                    ['country'],
                                                            todayCases: snapshot
                                                                    .data[index]
                                                                ['todayCases'],
                                                            todayRecovered: snapshot
                                                                    .data[index]
                                                                [
                                                                'todayRecovered'],
                                                            todayDeath: snapshot
                                                                    .data[index]
                                                                ['todayDeaths'],
                                                            countryFlag: snapshot
                                                                            .data[
                                                                        index][
                                                                    "countryInfo"]
                                                                ['flag'],
                                                            cases: snapshot
                                                                    .data[index]
                                                                ['cases'],
                                                            deaths: snapshot
                                                                    .data[index]
                                                                ['deaths'],
                                                            recovered: snapshot
                                                                    .data[index]
                                                                ['recovered'],
                                                            critical: snapshot
                                                                    .data[index]
                                                                ['critical'],
                                                          )),
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 20.w),
                                                child: Text(
                                                  snapshot.data[index]
                                                      ["country"],
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  30.w, 10.h, 0, 0),
                                              child: Text(
                                                snapshot.data[index]["cases"]
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 189, 184, 184),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            } else if (name
                                .toLowerCase()
                                .contains(searchC.text.trim().toLowerCase())) {
                              return Container(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(30, 0, 0, 15),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SingleCountryView(
                                                          countryName: snapshot
                                                                  .data[index]
                                                              ['country'],
                                                          todayCases: snapshot
                                                                  .data[index]
                                                              ['todayCases'],
                                                          todayRecovered: snapshot
                                                                  .data[index][
                                                              'todayRecovered'],
                                                          todayDeath: snapshot
                                                                  .data[index]
                                                              ['todayDeaths'],
                                                          countryFlag: snapshot
                                                                          .data[
                                                                      index][
                                                                  "countryInfo"]
                                                              ['flag'],
                                                          cases: snapshot
                                                                  .data[index]
                                                              ['cases'],
                                                          deaths: snapshot
                                                                  .data[index]
                                                              ['deaths'],
                                                          recovered: snapshot
                                                                  .data[index]
                                                              ['recovered'],
                                                          critical: snapshot
                                                                  .data[index]
                                                              ['critical'],
                                                        )),
                                              );
                                            },
                                            child: CircleAvatar(
                                              radius: 35,
                                              backgroundImage: NetworkImage(
                                                  snapshot.data[index]
                                                      ['countryInfo']["flag"]),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SingleCountryView(
                                                            countryName:
                                                                snapshot.data[
                                                                        index]
                                                                    ['country'],
                                                            todayCases: snapshot
                                                                    .data[index]
                                                                ['todayCases'],
                                                            todayRecovered: snapshot
                                                                    .data[index]
                                                                [
                                                                'todayRecovered'],
                                                            todayDeath: snapshot
                                                                    .data[index]
                                                                ['todayDeaths'],
                                                            countryFlag: snapshot
                                                                            .data[
                                                                        index][
                                                                    "countryInfo"]
                                                                ['flag'],
                                                            cases: snapshot
                                                                    .data[index]
                                                                ['cases'],
                                                            deaths: snapshot
                                                                    .data[index]
                                                                ['deaths'],
                                                            recovered: snapshot
                                                                    .data[index]
                                                                ['recovered'],
                                                            critical: snapshot
                                                                    .data[index]
                                                                ['critical'],
                                                          )),
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 20.w),
                                                child: Text(
                                                  snapshot.data[index]
                                                      ["country"],
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  30.w, 10.h, 0, 0),
                                              child: Text(
                                                snapshot.data[index]["cases"]
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 189, 184, 184),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          });
                    } else {
                      //  loading codeee
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
