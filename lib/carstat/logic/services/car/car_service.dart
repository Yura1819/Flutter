import 'dart:convert';
import 'package:my_project/carstat/logic/models/car.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICarService {

  Future<List<Car>> loadCarList();
  Future<void> saveCarList(List<Car> dataList);
  Future<void> addCar(Car data);
  Future<void> deleteCar(int index);


}


class CarService implements ICarService{
  static const _carKey = 'carKey';

  @override
  Future<List<Car>> loadCarList() async {
    final prefs = await SharedPreferences.getInstance();
    final carString = prefs.getString(_carKey);
    if (carString != null) {
      final List<dynamic> jsonDataList =
      jsonDecode(carString) as List<dynamic>;
      return jsonDataList
          .map((jsonData) =>
          Car.fromJson(jsonData as Map<String, dynamic>),)
          .toList();
    }
    return [];
  }

  @override
  Future<void> saveCarList(List<Car> dataList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_carKey,
      jsonEncode(dataList.map((data) => data.toJson()).toList()),);
  }

  @override
  Future<void> addCar(Car data) async {
    final dataList = await loadCarList();
    dataList.add(data);
    await saveCarList(dataList);
  }

  @override
  Future<void> deleteCar(int index) async {
    final dataList = await loadCarList();
    if (index >= 0 && index < dataList.length) {
      dataList.removeAt(index);
      await saveCarList(dataList);
    }
  }
}