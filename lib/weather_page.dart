import 'package:api_data/WeatherModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherDetail extends StatefulWidget {
  ListModel model;
  WeatherDetail({this.model});
  @override
  _WeatherDetailState createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
          height: height,
          width: width,
          child: ListView(
            children: [
              Container(
                  child: ListTile(
                title: Text(
                  "Date",
                  style: TextStyle(color: Colors.blue),
                ),
                trailing: Text("${widget.model.dtTxt}"),
              )),
              Container(
                child: Container(width: width, child: Text("Main")),
              ),
              Container(
                  child: ListTile(
                title: Text(" Temperature"),
                trailing: Text("${widget.model.main.temp}"),
              )),
              Container(
                  child: ListTile(
                title: Text("feel Like"),
                trailing: Text("${widget.model.main.feelsLike}"),
              )),
              Container(
                  child: ListTile(
                title: Text("Temperature Min"),
                trailing: Text("${widget.model.main.tempMin}"),
              )),
              Container(
                  child: ListTile(
                title: Text("Temperature Max"),
                trailing: Text("${widget.model.main.tempMax}"),
              )),
              Container(
                  child: ListTile(
                title: Text("Pressure"),
                trailing: Text("${widget.model.main.pressure}"),
              )),
              Container(
                  child: ListTile(
                title: Text("Sea Level"),
                trailing: Text("${widget.model.main.seaLevel}"),
              )),
              Container(
                  child: ListTile(
                title: Text("Grand level"),
                trailing: Text("${widget.model.main.grndLevel}"),
              )),
              Container(
                  child: ListTile(
                title: Text("humidity"),
                trailing: Text("${widget.model.main.humidity}"),
              )),
              Container(
                  child: ListTile(
                title: Text("temp_kf"),
                trailing: Text("${widget.model.main.tempKf}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "Weather",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("id"),
                trailing: Text("${widget.model.weather[0].id}"),
              )),
              Container(
                  child: ListTile(
                title: Text("main"),
                trailing: Text("${widget.model.weather[0].main}"),
              )),
              Container(
                  child: ListTile(
                title: Text("description"),
                trailing: Text("${widget.model.weather[0].description}"),
              )),
              Container(
                  child: ListTile(
                title: Text("icon"),
                trailing: Text("${widget.model.weather[0].icon}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "Cloud",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("All"),
                trailing: Text("${widget.model.clouds.all}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "Wind",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("Speed"),
                trailing: Text("${widget.model.wind.speed}"),
              )),
              Container(
                  child: ListTile(
                title: Text("deg"),
                trailing: Text("${widget.model.wind.deg}"),
              )),
              Container(
                  child: ListTile(
                title: Text("gust"),
                trailing: Text("${widget.model.wind.gust}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "Visibility",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("Visibility"),
                trailing: Text("${widget.model.visibility}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "Cloud",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("All"),
                trailing: Text("${widget.model.clouds.all}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "pop",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("pop"),
                trailing: Text("${widget.model.pop}"),
              )),
              Container(
                child: Container(
                    width: width,
                    child: Text(
                      "sys",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Container(
                  child: ListTile(
                title: Text("pod"),
                trailing: Text("${widget.model.sys.pod}"),
              ))
            ],
          )),
    );
  }
}
