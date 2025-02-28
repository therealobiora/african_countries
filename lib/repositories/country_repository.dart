import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_model.dart';

class CountryRepository {
  final String baseUrl = "https://restcountries.com/v3.1";

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(
        "$baseUrl/region/africa?status=true&fields=name,languages,capital,flags"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load countries");
    }
  }

  Future<Country> fetchCountryDetails(String name) async {
    final response = await http.get(Uri.parse("$baseUrl/name/$name"));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return Country.fromJson(data.first);
    } else {
      throw Exception("Failed to load country details");
    }
  }
}
