import 'package:example/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network/practical_growth_route_network.dart';

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
  late final http.Client client;
  late final ProductDataSource dataSource;
  late final ProductRepository repository;
  late final GetProductsUseCase useCase;
  late final MyAppChangeNotifier changeNotifier;

  @override
  void initState() {
    client = http.Client();
    dataSource = ProductDataSourceImpl(client: client);
    repository = ProductRepositoryImpl(
      productDataSource: dataSource,
    );
    useCase = GetProductsUseCase(productRepository: repository);
    changeNotifier = MyAppChangeNotifier(
      getProductsUseCase: useCase,
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
          if(changeNotifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 40),
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
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeNotifier.getProducts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
