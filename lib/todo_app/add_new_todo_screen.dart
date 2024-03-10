import 'package:first_app/todo_app/todo.dart';
import 'package:flutter/material.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});
  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _titleTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTextController,
                decoration: const InputDecoration(
                    label: Text("Title"), hintText: "Title"),
                validator: (String? value) {
                  final inputTitle = value ?? '';
                  if (inputTitle.trim().isEmpty) {
                    return 'Enter your title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionTextController,
                maxLines: 5,
                maxLength: 100,
                decoration: const InputDecoration(
                    label: Text("Description"), hintText: "Description"),
                validator: (String? value) {
                  final inputTitle = value ?? '';
                  if (inputTitle.trim().isEmpty) {
                    return 'Enter your title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Todo todo = Todo(
                          _titleTextController.text.trim(),
                          _descriptionTextController.text.trim(),
                          DateTime.now());
                      Navigator.pop(context, todo);
                    }
                  },
                  child: const Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }
}
