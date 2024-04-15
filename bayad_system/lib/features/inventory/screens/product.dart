import 'dart:math';

import 'package:bayad_system/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:bayad_system/utils/constants/colors.dart';
import 'package:bayad_system/utils/constants/sizes.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];

  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.removeListener(_filterProducts);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize your products list here (if you're fetching it from an API, this might be the place to do so)
    _initializeProducts();
    _searchController.addListener(_filterProducts);
  }

  void _initializeProducts() async {
    List<Product> updatedProduct = await _getAllProductsFromFirestore();
    setState(() {
      _filteredProducts =
          List.of(updatedProduct); // Start with all products visible
    });
  }

  void _filterProducts() {
    setState(() {
      // This ensures the widget rebuilds with the new filtered list
      final query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        _filteredProducts = List.of(products);
      } else {
        _filteredProducts = products
            .where((product) => product.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  Widget _productListItem(Product product) {
    final dark = HelperFunctions.isDarkMode(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _showEditDialog(context, product),
            label: 'Edit',
            backgroundColor: CustomColors.success,
            borderRadius: BorderRadius.circular(CustomSizes.borderRadiusSM),
          ),
          const SizedBox(width: CustomSizes.spaceBetweenItems / 4),
          SlidableAction(
            onPressed: (context) => _showDeleteDialog(context, product),
            label: 'Delete',
            backgroundColor: CustomColors.error,
            borderRadius: BorderRadius.circular(CustomSizes.borderRadiusSM),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(
            bottom: CustomSizes.sm,
            left: CustomSizes.defaultSpace,
            right: CustomSizes.defaultSpace),
        decoration: BoxDecoration(
          color:
              dark ? CustomColors.darkContainer : CustomColors.containerLight,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(product.name),
          trailing: Text("P${product.price.toStringAsFixed(2)}"),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Product product) {
    final TextEditingController nameController =
        TextEditingController(text: product.name);
    final TextEditingController priceController =
        TextEditingController(text: product.price.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit ${product.name}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: 'Enter new name'),
                ),
                const SizedBox(height: CustomSizes.spaceBetweenInputFields),
                TextFormField(
                  controller: priceController,
                  decoration:
                      const InputDecoration(labelText: 'Enter new price'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String newName = nameController.text;
                final double? newPrice = double.tryParse(priceController.text);
                if (newName.isNotEmpty && newPrice != null) {
                  setState(() {
                    // products[products.indexWhere((p) => p == product)] =
                    //     product;
                    // _filteredProducts =
                    //     List.of(products); // Start with all products visible

                    _editProductInFirestore(Product(
                        id: product.id, name: newName, price: newPrice));
                    _initializeProducts();
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure you want to delete ${product.name}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // products.removeWhere((p) => p == product);
                  // _filteredProducts =
                  //     List.of(products); // Start with all products visible
                  _deleteProductFromFirestore(product.id);
                  _initializeProducts();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showAddProductDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Product'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                const SizedBox(height: CustomSizes.spaceBetweenInputFields),
                TextFormField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Product Price'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final Random random = Random();
                final characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
                String randomString = '';

                for (var i = 0; i < 10; i++) {
                  randomString += characters[random.nextInt(characters.length)];
                }
                final String newName = nameController.text;
                final double? newPrice = double.tryParse(priceController.text);
                if (newName.isNotEmpty && newPrice != null) {
                  setState(() {
                    // products.add(Product(name: newName, price: newPrice));
                    // _filteredProducts =
                    //     List.of(products); // Start with all products visible
                    _addProductToFirestore(Product(
                        id: randomString, name: newName, price: newPrice));
                    _initializeProducts();
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: CustomColors.secondary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: CustomSizes.defaultSpace,
              left: CustomSizes.defaultSpace,
              right: CustomSizes.defaultSpace,
            ),
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
            child: Divider(),
          ),
          const SizedBox(height: CustomSizes.sm),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: CustomSizes.defaultSpace),
              child: Text(
                'Product Name (${products.length})',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(), // This will push the following widget to the right
            Padding(
              padding:
                  const EdgeInsets.only(right: CustomSizes.defaultSpace + 30.0),
              child: Text(
                'Price',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          const SizedBox(height: CustomSizes.sm),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                return _productListItem(_filteredProducts[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        backgroundColor: CustomColors.secondary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Product {
  Product({required this.id, required this.name, required this.price});

  final String id;
  final String name;
  final double price;
}

CollectionReference productCollection =
    FirebaseFirestore.instance.collection('products');

Future<void> _addProductToFirestore(Product product) async {
  productCollection.add({
    'id': product.id,
    'name': product.name,
    'price': product.price,
  }).then((value) {
    // Document added successfully
    print('Sucessfully Added');
  }).catchError((error) {
    // Error occurred while adding document
    print('Failed to add product: $error');
  });
}

void _editProductInFirestore(Product product) async {
  try {
    QuerySnapshot querySnapshot =
        await productCollection.where('id', isEqualTo: product.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      await productCollection.doc(querySnapshot.docs.first.id).update({
        'name': product.name,
        'price': product.price,
      });
      print('Product updated successfully');
    } else {
      print('No product found with the given id');
    }
  } catch (error) {
    print('Failed to update product: $error');
  }
}

void _deleteProductFromFirestore(String productId) async {
  try {
    QuerySnapshot querySnapshot =
        await productCollection.where('id', isEqualTo: productId).get();

    if (querySnapshot.docs.isNotEmpty) {
      await productCollection.doc(querySnapshot.docs.first.id).delete();
      print('Product deleted successfully');
    } else {
      print('No product found with the given id');
    }
  } catch (error) {
    print('Failed to delete product: $error');
  }
}

Future<List<Product>> _getAllProductsFromFirestore() async {
  List<Product> products = [];
  try {
    QuerySnapshot querySnapshot = await productCollection.get();
    products = querySnapshot.docs.map((DocumentSnapshot document) {
      return Product(
          id: document['id'],
          name: document['name'],
          price: (document['price'] as num).toDouble());
    }).toList();
  } catch (error) {
    // Use a logging framework here instead of print
    print('Failed to get products: $error');
  }
  return products;
}
