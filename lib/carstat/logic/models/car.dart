class Car {
  final String id;
  final String make;
  final String model;
  final int year;
  final int mileage;
  final double zeroToSixty;

  Car({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.mileage,
    required this.zeroToSixty,
  });

  // Для парсингу з JSON
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: int.parse(json['year'].toString()),
      mileage: int.parse(json['mileage'].toString()),
      zeroToSixty: double.parse(json['zeroToSixty'].toString()),
    );
  }

  // Для перетворення на JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'mileage': mileage,
      'zeroToSixty': zeroToSixty,
    };
  }
}
