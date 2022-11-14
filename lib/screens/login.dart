import 'package:flutter/material.dart';
import 'package:gym_check/components/workout-list-item.dart';
import 'package:gym_check/screens/add-workout.dart';
import 'package:gym_check/screens/home.dart';
import 'package:gym_check/screens/qr-code-reader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              hintText: 'E-mail',
            ),
            textAlign: TextAlign.center,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerEmail,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Senha',
            ),
            obscureText: true,
            textAlign: TextAlign.center,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _textEditingControllerPassword,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // print(_textEditingControllerEmail.text);
                  final SharedPreferences prefs = await _prefs;
                  prefs.setString('email', _textEditingControllerEmail.text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.red,
      ),
      body: const MyStatefulWidget(),
    );
  }
}
