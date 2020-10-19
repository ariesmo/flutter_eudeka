import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:statistic_covid19/config/env.dart';
import 'package:statistic_covid19/model/corona_cases.dart';
import 'package:statistic_covid19/model/corona_province.dart';

class DetailContent extends StatefulWidget {

  final Datum data;
  final ChartType chartType;

  const DetailContent({Key key, this.data, this.chartType}) : super(key: key);

  @override
  _DetailContentState createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent> {
  
  List<CoronaCases> _listCases;
  List<Series<CoronaCases, String>> _listSeries;

  
  @override
  void initState() {
   _listCases = <CoronaCases>[
     CoronaCases(title: "Positif", count: widget.data.positiveCases),
     CoronaCases(title: "Sembuh", count: widget.data.curedCases),
     CoronaCases(title: "Meninggal", count: widget.data.deathCases),
   ];
   _listSeries = <Series<CoronaCases, String>>[
     Series(
       id: widget.data.province,
       data: _listCases,
       domainFn: (CoronaCases cases, int index){
         return cases.title;
       },
       measureFn: (CoronaCases cases, int index){
         return cases.count;
       },
       labelAccessorFn: (CoronaCases cases, int index){
         return "${cases.count}";
       }
     ),
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.chartType == ChartType.BAR ? BarChart(
      _listSeries,
      barRendererDecorator: BarLabelDecorator<String>(labelPosition: BarLabelPosition.outside,)
    ) : PieChart(
      _listSeries,
      defaultRenderer: ArcRendererConfig(
        arcRendererDecorators: [
          ArcLabelDecorator(labelPosition: ArcLabelPosition.outside)
        ],
      ),
      behaviors: [DatumLegend()],
    );
  }
}