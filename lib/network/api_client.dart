import 'package:http/http.dart';
import 'package:statistic_covid19/config/env.dart';
import 'package:statistic_covid19/model/corona_province.dart';

class ApiClient {
  static Future<CoronaProvince> getCoronaProvinceId() async {
    Response _response = await get("${Env.baseUrl}/provinsi");
    if(_response.statusCode == 200){
      return CoronaProvince.fromJson(_response.body);
    } else {
      throw Exception("error code : ${_response.statusCode}");
    }
  }
}