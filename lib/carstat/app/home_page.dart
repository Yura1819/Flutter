import 'package:flutter/material.dart';
import 'package:my_project/carstat/app/add_car_form.dart';
import 'package:my_project/carstat/home/bottom_part.dart';
import 'package:my_project/carstat/home/drawer.dart';
import 'package:my_project/carstat/logic/models/car.dart';
import 'package:my_project/carstat/logic/services/car/car_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final ICarService _carService;
  late Future<List<Car>> _carListFuture;

  @override
  void initState() {
    super.initState();
    _carService = CarService();
    _carListFuture = _carService.loadCarList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Stats Tracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder<List<Car>>(
        future: _carListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No cars added yet.'));
          }

          final cars = snapshot.data!;
          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return ListTile(
                title: Text('${car.make} ${car.model}'),
                subtitle: Text(
                    'Year: ${car.year} - Mileage: ${car.mileage} - 0 to 60: '
                    '${car.zeroToSixty}s'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    // Підтвердження видалення
                    final shouldDelete = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete Car'),
                        content: const Text('Are you sure you want to delete this car?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );

                    if (shouldDelete ?? false) {
                      await _carService.deleteCar(index);
                      refreshCars();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onAddPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (_) => const AddCarFormPage()),
          );
          refreshCars();
        },
      ),
    );
  }

  void refreshCars() {
    setState(() {
      _carListFuture = _carService.loadCarList();
    });
  }
}
