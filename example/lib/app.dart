import 'package:example_network_package/change_notifier.dart';
import 'package:flutter/material.dart';

import 'package:practical_growth_route_network_package/practical_growth_route_network_package.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MyAppChangeNotifier changeNotifier;

  @override
  void initState() {
    changeNotifier = MyAppChangeNotifier(
      package: PracticalGrowthRouteNetworkPackage(),
    );
    changeNotifier.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo'),
      ),
      body: ListenableBuilder(
          listenable: changeNotifier,
          builder: (BuildContext context, Widget? child) {
            if (changeNotifier.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 40),
              itemCount: changeNotifier.products.length,
              itemBuilder: (context, index) {
                final product = changeNotifier.products[index];
                return Card(
                  child: ListTile(
                    title: Text(product.title ?? ''),
                    subtitle: Text(product.description ?? ''),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeNotifier.getProducts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
