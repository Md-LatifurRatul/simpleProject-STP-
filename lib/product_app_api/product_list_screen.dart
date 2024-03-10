import 'dart:convert';

import 'package:first_app/product_app_api/add_product_screen.dart';
import 'package:first_app/product_app_api/edit_product_list_screen.dart';
import 'package:first_app/product_app_api/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum PopUpMenuItem { edit, delete }

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    getProductListFormApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product list"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProductListFormApi();
        },
        child: Visibility(
          visible: _inProgress == false,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(productList[index].productName ?? 'Unknown'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(productList[index].image ?? ''),
                ),
                subtitle: Wrap(
                  spacing: 16,
                  children: [
                    Text(
                        "Product ${productList[index].productCode ?? 'Unknown'}"),
                    Text(
                        "Unit price ${productList[index].unitPrrice ?? 'Unknown'}"),
                    Text(
                        "Total price ${productList[index].totalPrice ?? 'Unknown'}"),
                    Text("Quantity ${productList[index].quantity ?? 'Unknown'}")
                  ],
                ),
                trailing: PopupMenuButton<PopUpMenuItem>(
                  onSelected: (type) =>
                      _onTapPopUpMenu(type, productList[index]),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: PopUpMenuItem.edit,
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Edit"),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: PopUpMenuItem.delete,
                      child: Row(
                        children: [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 8,
                          ),
                          Text("delete"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddNewProductScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }

  Future<void> _onTapPopUpMenu(PopUpMenuItem item, Product product) async {
    switch (item) {
      case PopUpMenuItem.edit:
        final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProductScreen(product: product)));
        if (result != null && result == true) {
          getProductListFormApi();
        }

        break;
      case PopUpMenuItem.delete:
        _showDeleteDialogue(product.id!);
        break;
    }
  }

  void _showDeleteDialogue(String productId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Product"),
          content: const Text("Are you sure you want to delete"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _deleteProduct(productId);
                Navigator.pop(context);
              },
              child: const Text(
                "Yes, delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getProductListFormApi() async {
    _inProgress = true;
    setState(() {});
    //Step 1 - Make URI
    //Step 2 - Call api
    //Step 3 - Show response
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');

    Response response = await get(uri);
    // print(response);
    // print(response.body);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      productList.clear();
      var decodedResponse = jsonDecode(response.body);
      if (decodedResponse['status'] == 'success') {
        var list = decodedResponse['data'];
        for (var item in list) {
          Product product = Product.fromJson(item);
          productList.add(product);
        }
      }
    }
    _inProgress = false;
    setState(() {});
  }

  Future<void> _deleteProduct(String productId) async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId');

    Response response = await get(uri);

    if (response.statusCode == 200) {
      // getProductListFormApi();
      productList.removeWhere((element) => element.id == productId);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product Deletion Failed! Try again")));
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
