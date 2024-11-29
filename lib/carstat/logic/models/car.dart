class Car {
  int year;
  int mileage;
  String make;
  String model;
  double zeroToSixty;

  Car({
    required this.year,
    required this.mileage,
    required this.make,
    required this.model,
    required this.zeroToSixty,
  });

  Map<String, dynamic> toJson() => {
    'year': year,
    'mileage': mileage,
    'brande': make,
    'model': model,
    'zeroToSixty': zeroToSixty,
  };

  static Car fromJson(Map<String, dynamic> json) => Car(
    year: json['year'] as int,
    mileage: json['mileage'] as int,
    make: json['brande'] as String,
    model: json['model'] as String,
    zeroToSixty: json['zeroToSixty'] as double,
  );
}
