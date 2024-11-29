import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutologinPage extends StatefulWidget {
  const AutologinPage({super.key});

  @override
  State<AutologinPage> createState() => _AutologinPageState();
}

class _AutologinPageState extends State<AutologinPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getString('currentUser') != null;
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (isLoggedIn) {
      if (connectivityResult == ConnectivityResult.none) {
        _connectionTroubles();
      }
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } else {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  void _connectionTroubles() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet'),
          content:
          const Text('You are logged in but no internet.'
              ' Some features may or may not be available.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}