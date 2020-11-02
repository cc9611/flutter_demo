import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DatetimeDemo extends StatefulWidget {

  @override
  _DatetimeDemoState createState() => _DatetimeDemoState();
}
class _DatetimeDemoState extends State<DatetimeDemo> {
  DateTime selectedDateTime= DateTime.now();/* 定义时间 */
  TimeOfDay selectedTime = TimeOfDay(hour: 9,minute: 48);/* 定义时间 */
  /* 选择时间方法 */
  _selectDate() async {
    /* 点击执行方法,显示datepicker日期选择,这个选择器会返回一个值 */
    DateTime  date =  await showDatePicker(context: context, initialDate: selectedDateTime, firstDate: DateTime(1900), lastDate: DateTime(2100),);
    if (date == null) {
      return;
    }else{
      setState(() {
        selectedDateTime = date;
      });
    }
  }
  /* 选择时间方法 */
  _selectTime() async{
    final TimeOfDay time = await showTimePicker(context: context, initialTime: selectedTime);
    if (time == null) {
      return;
    }
    setState(() {
      selectedTime = time;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _selectDate,
                  child: Row(
                    children: [
                      Text(DateFormat.yMd().format(selectedDateTime)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime,
                  child: Row(
                    children: [
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
