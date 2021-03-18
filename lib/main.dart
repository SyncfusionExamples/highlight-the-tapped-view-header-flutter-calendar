import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(CustomHeaders());

class CustomHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<MyApp> {
  String _headerText;
  double _width, _cellWidth;
  List<String> _dates, _days;
  bool _selected;
  int _selectedIndex;

  @override
  void initState() {
    _headerText = 'Header';
    _days = <String>['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    _dates = <String>['1', '2', '3', '4', '5', '6', '7'];

    _width = 0.0;
    _cellWidth = 0.0;
    _selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _cellWidth = _width / 8;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            color: Color(0xFF381460),
            width: _width,
            height: _cellWidth,
            child: Center(
              child: Text(_headerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _cellWidth,),
            child: SizedBox(
              height: _cellWidth,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _days.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return  GestureDetector(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: _cellWidth,
                                child: Center(
                                  child: Text(
                                    _days[index],
                                    style: TextStyle(
                                      color: _selected && _selectedIndex == index
                                          ? Colors.orange
                                          : Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                width: _cellWidth,
                              ),
                            ],
                          ),
                        ),
                      );
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _cellWidth),
            child: SizedBox(
              height: _cellWidth / 2,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _dates.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = true;
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                _dates[index],
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              width: _cellWidth,
                              decoration: _selected && _selectedIndex == index
                                  ? BoxDecoration(
                                      color: Colors.orange,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.orange, width: 3))
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: SfCalendar(
              headerHeight: 0,
              viewHeaderHeight: 0,
              view: CalendarView.week,
              onViewChanged: (ViewChangedDetails viewChangedDetails) {
                SchedulerBinding.instance.addPostFrameCallback((duration) {
                  for (int i = 0;
                      i < viewChangedDetails.visibleDates.length;
                      i++) {
                    setState(() {
                      _dates[i] = DateFormat('dd')
                          .format(viewChangedDetails.visibleDates[i])
                          .toString();
                      _headerText = DateFormat('MMMM yyyy')
                          .format(viewChangedDetails.visibleDates[
                              viewChangedDetails.visibleDates.length ~/ 2])
                          .toString();
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    ));
  }
}
