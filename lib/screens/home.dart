import 'package:flutter/material.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/screens/add-workout.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _email;

  @override
  void initState() {
    super.initState();
    _email = _prefs
        .then((SharedPreferences prefs) => prefs.getString('email') ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar Ficha',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddWorkout()));
            },
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: _email,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  return Column(
                    children: [
                      Text('Seja bem vindo, ${snapshot.data}'),
                      WorkoutListItem('Treino 1', 'Treino de peito', 5),
                      WorkoutListItem('Treino 2', 'Treino de perna', 5),
                    ],
                  );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QRCodeReader()));
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
