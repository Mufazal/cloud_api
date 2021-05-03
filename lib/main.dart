import 'package:api_data/SingleDayTimeWeather.dart';
import 'package:api_data/WeatherModel.dart';
import 'package:api_data/getdata.dart';
import 'package:api_data/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  WeatherModel model;
  var list = [];
  var height, width;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading == true
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Container(
              height: height,
              width: width,
              child: ListView.builder(
                  itemCount: list.length == null ? 0 : list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02,
                          bottom: 5.0,
                          left: width * 0.08,
                          right: width * 0.08),
                      child: Container(
                        //  height: height * 0.08,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x20000000),
                                  blurRadius: 10.0,
                                  spreadRadius: 10.0,
                                  offset: Offset(0, 3))
                            ]),
                        child: ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SingleDayTimeWeather(
                                  date: list[index].toString(),
                                );
                              }));
                            },
                            title: Text(
                              '${list[index].toString()}',
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.blue,
                            )),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          getApiData().then((value) {
            setState(() {
              isLoading = false;

            
              var date;
              value.weatherList.forEach((element) {
                var tempDate = getDateFormat(element.dtTxt);
                print("  Time Date $tempDate");

                if (date == null) {
                  date = tempDate;
                  list.add(date);
                } else {
                  if (tempDate != date) {
                    date = tempDate;
                    list.add(date);
                  }
                }

                //   if (tempList == null || tempList.length == 0) {
                //     tempList.add(element);
                //   }

                //  else{
                //     tempList.forEach((tempListElement) {
                //     ///convert
                //     print("Temp list ${tempListElement.dtTxt}");

                //     if (getDateFormat(tempListElement.dtTxt) != tempDate) {
                //       tempList.add(element);
                //     }
                //   });
                //    list = tempList;
                //  }

                ///2021-04-30
              });
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  getDateFormat(String d) {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(d));
    return date;
  }
}
