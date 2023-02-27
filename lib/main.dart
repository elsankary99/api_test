import 'package:api_test/view/display_data_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TestApi());
}

class TestApi extends StatelessWidget {
  const TestApi({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DisplayData(),
    );
  }
}
