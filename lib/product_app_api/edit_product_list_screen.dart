import 'dart:convert';

import 'package:first_app/product_app_api/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<EditProductScreen> createState() => _EditNewProductScreenState();
}

class _EditNewProductScreenState extends State<EditProductScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _codeEditingController = TextEditingController();
  final TextEditingController _unitEditingController = TextEditingController();
  final TextEditingController _quantityEditingController =
      TextEditingController();
  final TextEditingController _totalEditingController = TextEditingController();
  final TextEditingController _imageEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _updateInProgress = false;

  @override
  void initState() {
    super.initState();
    _nameEditingController.text = widget.product.productName ?? '';
    _codeEditingController.text = widget.product.productCode ?? '';
    _unitEditingController.text = widget.product.unitPrrice ?? '';
    _quantityEditingController.text = widget.product.quantity ?? '';
    _totalEditingController.text = widget.product.totalPrice ?? '';
    _imageEditingController.text = widget.product.image ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product name"),
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
                    visible: _updateInProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _updateProduct();
                        }
                      },
                      child: const Text("Update"),
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

  Future<void> _updateProduct() async {
    _updateInProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');

    Product product = Product(
        id: widget.product.id,
        image: _imageEditingController.text.trim(),
        productCode: _codeEditingController.text.trim(),
        productName: _nameEditingController.text.trim(),
        quantity: _quantityEditingController.text.trim(),
        totalPrice: _totalEditingController.text.trim(),
        unitPrrice: _unitEditingController.text.trim());

    // Map<String, dynamic> params = {
    //   "Img": _imageEditingController.text.trim(),
    //   "ProductCode": _codeEditingController.text.trim(),
    //   "ProductName": _nameEditingController.text.trim(),
    //   "Qty": _quantityEditingController.text.trim(),
    //   "TotalPrice": _totalEditingController.text.trim(),
    //   "UnitPrice": _unitEditingController.text.trim()
    // };
    print(product.toJson());
    final Response response = await post(uri,
        body: jsonEncode(product.toJson()),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      if (decodeData['status'] == 'success') {
        if (mounted) {
          Navigator.pop(context, true);
        }
      } else {
        if (mounted) {
          _updateInProgress = true;
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Product update failed! Try again.")));
        }
      }
    } else {
      _updateInProgress = true;
      setState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Product update failed! Try again.")));
      }
    }
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
