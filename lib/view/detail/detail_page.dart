import 'package:flutter/material.dart';
import 'package:statistic_covid19/config/env.dart';
import 'package:statistic_covid19/model/corona_province.dart';
import 'package:statistic_covid19/view/detail/detail_content.dart';


class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ChartType _chartType;

  @override
  void initState() {
    _chartType = ChartType.BAR;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Datum _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_data?.province ?? ""),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cached), onPressed: (){
            _chartType = _chartType == ChartType.BAR ? ChartType.PIE : ChartType.BAR;
            setState(() {
              
            });
          }),
        ],
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: DetailContent(
            data: _data,
            chartType: _chartType
          ),
        ),
      ),
    );
  }
}