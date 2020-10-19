import 'package:flutter/material.dart';
import 'package:statistic_covid19/model/corona_province.dart';
import 'package:statistic_covid19/network/api_client.dart';
import 'package:statistic_covid19/view/home/home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Eudeka! Flutter x Corona"),),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<CoronaProvince>(
          future: ApiClient.getCoronaProvinceId(),
          builder: (
            BuildContext context,
            AsyncSnapshot<CoronaProvince> snapshot,
          ){
            if(snapshot.hasData){
              return HomeContent(
                coronaProvinceId: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          })
      ),
    );
  }
}