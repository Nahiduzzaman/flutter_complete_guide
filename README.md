# flutter_complete_guide

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Provider: https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple

_ declares private variable in Dart ex: _items

https://selise.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15179292#overview

if you add listen: false rebuild to see change.

https://selise.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100276#questions/7822038

ChangeNotfierProvider.value {
    value: 
}

**Consumer**
suppose you added listen: false the wrapped widget will not listen to update but inside the wrapped
widget a part wants data and need to be update use 'Consumer' wrap on that subpart 
you use 'Consumer' when you need data for a just subpart of your code

Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
the 3rd param 'child' will not rebuild if want a part inside the subpart that should'nt rebuld

With provider we were managing global app state when applying filter in one page it was also applying on other pages.

for this we will turn stateless widget to stateful to manage state only in that widget not in whole app
check commit name: turning into stateful widget

When you should use stateful widget at 2.30
https://selise.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/15100340#questions


State Management
https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro

Scaffold.of(context) return the nearest scaffold 

product_overview_screen has scafold
    its child is Productgrid has not any scaffold
        ProductGrid's child is productItem has not any scafolde
          so form productItem we can get scafold of product_overview screen

Define route inside stl or stf class

if you use focus node you need to dispose it to avoid memory leaks
http://placeimg.com/100/100