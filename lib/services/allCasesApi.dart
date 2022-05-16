import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zaant/models/casesModel.dart';

class ApiServices {
  Future<CasesModel> allCases() async {
    var response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return CasesModel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  Future<List<dynamic>> countriesList() async {
    var data;
    var response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("error");
    }
  }
}
