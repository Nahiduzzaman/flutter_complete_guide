import 'dart:ffi';

import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;
  var isloading = false;

  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts()
        .then((_) {
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch as Widget,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(_showOnlyFavorites),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        child: AppDrawer(),
      ),
    );
  }
}
