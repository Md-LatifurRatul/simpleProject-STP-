import 'package:first_app/sum_app/bottom_navbar.dart';
import 'package:flutter/material.dart';

class SumAppScreen extends StatefulWidget {
  const SumAppScreen({super.key});

  @override
  State<SumAppScreen> createState() => _SumAppScreenState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController _firstInputTextEditingController =
    TextEditingController();
final TextEditingController _secondInputTextEditingController =
    TextEditingController();
double _result = 0;

class _SumAppScreenState extends State<SumAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sum APP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstInputTextEditingController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(text: "Enter the first number"),
                validator: _textController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _secondInputTextEditingController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration(text: "Enter the second number"),
                validator: _textController,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: _elevatedButtonArrange,
              ),
              _container,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget get _container {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 220,
      width: MediaQuery.of(context).size.width / 3,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
      child: Center(child: Text("Result: $_result")),
    );
  }

  InputDecoration _inputDecoration({String? text}) {
    return InputDecoration(
      hintText: text,
      labelText: text,
      border: const OutlineInputBorder(),
    );
  }

  Widget get _elevatedButtonArrange {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                double inputValue1 = double.tryParse(
                        _firstInputTextEditingController.text.trim()) ??
                    0;
                double inputValue2 = double.tryParse(
                        _secondInputTextEditingController.text.trim()) ??
                    0;
                double result = add(inputValue1, inputValue2);
                _result = result;
                setState(() {});
              }
            },
            child: const Text("Add"),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                double inputValue1 = double.tryParse(
                        _firstInputTextEditingController.text.trim()) ??
                    0;
                double inputValue2 = double.tryParse(
                        _secondInputTextEditingController.text.trim()) ??
                    0;
                double result = sub(inputValue1, inputValue2);
                _result = result;
                setState(() {});
              }
            },
            child: const Text("Sub"),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: clear,
            child: const Text("Clear"),
          ),
        ),
      ],
    );
  }

  String? _textController(String? value) {
    {
      String input = value ?? '';
      if (input.trim().isEmpty) {
        return 'Enter first number';
      }
      return null;
    }
  }

  double add(double value1, double value2) {
    return value1 + value2;
  }

  double sub(double value1, double value2) {
    return value1 - value2;
  }

  void clear() {
    _firstInputTextEditingController.clear();
    _secondInputTextEditingController.clear();
    _result = 0;
    setState(() {});
  }

  @override
  void dispose() {
    _firstInputTextEditingController.dispose();
    _secondInputTextEditingController.dispose();
    super.dispose();
  }
}
