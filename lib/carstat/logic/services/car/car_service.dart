import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/carstat/logic/models/car.dart';

abstract class ICarService {
  Future<List<Car>> loadCarList();
  Future<void> saveCarList(List<Car> dataList);
  Future<void> addCar(Car data);
  Future<void> deleteCar(String id);
}


class CarService implements ICarService {
  static const _baseUrl = 'http://localhost:3000/cars';

  @override
  Future<List<Car>> loadCarList() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonDataList = jsonDecode(response.body) as List<dynamic>;
      return jsonDataList.map((jsonData) => Car.fromJson(jsonData as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load car list');
    }
  }

  @override
  Future<void> saveCarList(List<Car> dataList) async {
  }

  @override
  Future<void> addCar(Car data) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add car');
    }
  }

@override
Future<void> deleteCar(String id) async {
  final response = await http.delete(Uri.parse('$_baseUrl/$id'));
  if (response.statusCode != 200) {
    throw Exception('Failed to delete car');
  }
}
}
