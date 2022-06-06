import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/cart_screen.dart';
import 'package:flutter_complete_guide/screens/order_screen.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';
import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import './screens/product_details_screen.dart';
import 'providers/order_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        )
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              fontFamily: 'Lato',
              primaryColor: Colors.purple,
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                  .copyWith(secondary: Colors.deepOrange)),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          }),
    );
  }
}
