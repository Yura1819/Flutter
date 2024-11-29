import 'package:flutter/material.dart';
import 'package:my_project/carstat/logic/models/car.dart';
import 'package:my_project/carstat/logic/services/car/car_service.dart';

class AddCarFormPage extends StatefulWidget {
  const AddCarFormPage({super.key});

  @override
  State<AddCarFormPage> createState() => _AddCarFormPageState();
}

class _AddCarFormPageState extends State<AddCarFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();
  final _mileageController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _zeroToSixtyController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newCar = Car(
        year: int.parse(_yearController.text),
        mileage: int.parse(_mileageController.text),
        make: _makeController.text,
        model: _modelController.text,
        zeroToSixty: double.parse(_zeroToSixtyController.text),
      );

      CarService().addCar(newCar).then((_) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Car')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Year'),
              controller: _yearController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the car year';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mileage'),
              controller: _mileageController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the mileage';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Make'),
              controller: _makeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the make of the car';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Model'),
              controller: _modelController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the model of the car';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '0 to 60'),
              controller: _zeroToSixtyController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the 0 to 60 time';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}
