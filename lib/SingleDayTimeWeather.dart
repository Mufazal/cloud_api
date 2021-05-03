import 'package:api_data/WeatherModel.dart';
import 'package:api_data/getdata.dart';
import 'package:api_data/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleDayTimeWeather extends StatefulWidget {
  String date;
  SingleDayTimeWeather({this.date});
  @override
  _SingleDayTimeWeatherState createState() => _SingleDayTimeWeatherState();
}

class _SingleDayTimeWeatherState extends State<SingleDayTimeWeather> {
  List<ListModel> list = [];
  var height, width;
  bool isLoading;

  @override
  void initState() {
    isLoading = true;
    getApiData().then((value) {
      setState(() {
        isLoading = false;

        value.weatherList.forEach((element) {
          print("${element.dtTxt}");
          if (widget.date == getDateFormat(element.dtTxt)) {
            list.add(element);
          }
        });
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
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
                                return WeatherDetail(model: list[index],
                                 
                                );
                              }));
                            },
                            title: Text(
                              '${getTimeFormat(list[index].dtTxt)}',
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: Colors.blue,
                            )),
                      ),
                    );
                  }),
            ),
    );
  }

  getDateFormat(String d) {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(d));
    return date;
  }
   getTimeFormat(String d) {
    String time = DateFormat.jm().format(DateTime.parse(d));
    return time;
  }
}
