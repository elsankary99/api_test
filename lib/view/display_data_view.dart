import 'package:api_test/service/test_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  TextEditingController textEditingController = TextEditingController();
  String inputData = '';
  String dispalyData = '';
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) async {
                  isLoading = true;
                  setState(() {});

                  TestApi data = TestApi();
                  dispalyData = await data.getData(inputData);
                  isLoading = false;

                  setState(() {});
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter Number',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                },
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    : const Text('Submit'),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Your Data is : '),
              const SizedBox(
                height: 50,
              ),
              Text(
                '- $dispalyData',
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3)),
                width: double.infinity,
                child: Text(
                  '- $dispalyData',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
