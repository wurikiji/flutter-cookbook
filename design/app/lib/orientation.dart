import 'package:flutter/material.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text('''
OrientationBuilder 
Detect orientation by calculating the ratio of the width to the height of available space to the parent
'''),
                Expanded(
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      return GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        children: List.generate(
                          100,
                          (index) {
                            return Center(
                              child: Text(
                                'Item $index',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text('''
MediaQuery
Detect orientation of entire screen.
'''),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      final orientation = MediaQuery.of(context).orientation;
                      return GridView.count(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 3,
                        children: List.generate(
                          100,
                          (index) {
                            return Center(
                              child: Text(
                                'Item $index',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
