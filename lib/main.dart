import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import 'providers/products_provider.dart';
import 'screens/product_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      //create: (ctx) => ProductsProvider(),
      value: ProductsProvider(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                  .copyWith(secondary: Colors.deepOrange)),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          }),
    );
  }
}
