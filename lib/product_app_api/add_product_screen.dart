import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  final TextEditingController _unitEditingController = TextEditingController();
  final TextEditingController _quantityEditingController =
      TextEditingController();
  final TextEditingController _totalEditingController = TextEditingController();
  final TextEditingController _imageEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _textFormField("Product name", "Product name",
                    _nameEditingController, 'Enter your product name'),
                const SizedBox(
                  height: 8,
                ),
                _textFormField("Product code", "Product code",
                    _codeEditingController, 'Enter your product code'),
                const SizedBox(
                  height: 8,
                ),
                _textFormField("Unit price", "Unit price",
                    _unitEditingController, 'Enter unit price'),
                const SizedBox(
                  height: 8,
                ),
                _textFormField("Quantity", "Quantity",
                    _quantityEditingController, 'Enter your quantity'),
                const SizedBox(
                  height: 8,
                ),
                _textFormField("Total price", "Total price",
                    _totalEditingController, 'Enter total price'),
                const SizedBox(
                  height: 10,
                ),
                _textFormField("Image", "Image", _imageEditingController,
                    'Enter your product image'),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _addNewProductInProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          createNewProduct();
                        }
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField(String hintText, String labelText,
      TextEditingController textEditingController, String errorMessage) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
      validator: (String? text) {
        if (text?.trim().isEmpty ?? true) {
          return errorMessage;
        }
        return null;
      },
    );
  }

  Future<void> createNewProduct() async {
    _addNewProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> params = {
      "Img": _imageEditingController.text.trim(),
      "ProductCode": _codeEditingController.text.trim(),
      "ProductName": _nameEditingController.text.trim(),
      "Qty": _quantityEditingController.text.trim(),
      "TotalPrice": _totalEditingController.text.trim(),
      "UnitPrice": _unitEditingController.text.trim(),
    };

    Response response = await post(
      uri,
      body: jsonEncode(params),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      _unitEditingController.clear();
      _imageEditingController.clear();
      _nameEditingController.clear();
      _codeEditingController.clear();
      _quantityEditingController.clear();
      _totalEditingController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product Created successfuly'),
          ),
        );
      }
    }
    _addNewProductInProgress = false;
    setState(() {});
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _codeEditingController.dispose();
    _unitEditingController.dispose();
    _quantityEditingController.dispose();
    _totalEditingController.dispose();
    _imageEditingController.dispose();
    super.dispose();
  }
}
