import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/pages/notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) {
        final data = Provider.of<MyNotifier>(context, listen: false);
        data.getResponse();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<MyNotifier>(
            builder: (
              BuildContext context,
              MyNotifier value,
              _,
            ) {
              return value.loading || value.lastResponse == null
                  ? const CircularProgressIndicator()
                  : Center(
                      child: ListView.builder(
                        itemCount: value.lastResponse!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.grey,
                              child: ListTile(
                                title: Text(
                                  "Title:${value.lastResponse![index].title}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Title:${value.lastResponse![index].id}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
