// import 'package:flutter/material.dart';
// import 'package:gym_check/screens/home.dart';

// class AddWorkout extends StatelessWidget {
//   const AddWorkout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AddWorkout'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const Text('AddWorkout'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gym_check/data/exercicio_operations.dart';
import 'package:gym_check/data/ficha_operations.dart';
import 'package:gym_check/models/exercicio.dart';
import 'package:gym_check/models/ficha.dart';

import 'package:gym_check/screens/home.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController _textEditingControllerNome = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FichaOperations fichaOperations = FichaOperations();

  @override
  void initState() {
    super.initState();
    fichaOperations.getAllFichas();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nome',
            ),
            textAlign: TextAlign.center,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerNome,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Ficha ficha = Ficha(
                    _textEditingControllerNome.text,
                    0,
                  );
                  await fichaOperations.createFicha(ficha);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}

class AddWorkout extends StatelessWidget {
  const AddWorkout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Ficha'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}
