import 'package:flutter/material.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/data/ficha_operations.dart';
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
  FichaOperations fichaOperations = FichaOperations();
  var fichas = [];

  void loadFichas() async {
    var _fichas = await fichaOperations.getAllFichas();
    setState(() {
      fichas = _fichas;
    });
  }

  @override
  void initState() {
    super.initState();
    loadFichas();
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
                      fichas.length > 0
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: fichas.length,
                                itemBuilder: (context, index) {
                                  return WorkoutListItem(
                                    fichas[index]['id'],
                                    fichas[index]['nome'],
                                    fichas[index]['num_exercicios'],
                                  );
                                },
                              ),
                            )
                          : const Text('Nenhuma ficha encontrado'),
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
