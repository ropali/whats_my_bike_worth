import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:whats_my_bike_worth/screens/result_screen.dart';
import '../utils/constants.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool isLoading = false;

  List<int> _modelYearGenerator() {
    List<int> _years = [];

    DateTime now = DateTime.now();

    int currentYear = now.year;

    for (var i = 2000; i <= currentYear; i++) {
      _years.add(i);
    }

    return _years;
  }

  void _getResult() async {
    setState(() {
      isLoading = true;
    });
    var vals = _formKey.currentState?.value;

    final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(vals),
        headers: {'content-type': 'application/json'});

    var data = json.decode(response.body);

    print(data['data']);
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResultScreen(data['data']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fill Details',
          style: GoogleFonts.courgette(),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : buildForm(context),
    );
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'kms_driven',
                  autocorrect: false,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.min(context, 1),
                    ],
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Enter Kms Driven'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  name: 'owner',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                    ],
                  ),
                  items: ['First', 'Second', 'Third', 'Fourth'].map(
                    (item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item.toLowerCase(),
                      );
                    },
                  ).toList(),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Select owner'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  name: 'location',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                    ],
                  ),
                  items: [
                    'Mumbai',
                    'Hyderabad',
                    'Bangalore',
                    'Delhi',
                    'Pune',
                    'Other'
                  ].map(
                    (item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item.toLowerCase(),
                      );
                    },
                  ).toList(),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Select Location'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'mileage',
                  autocorrect: false,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.integer(context),
                      FormBuilderValidators.min(context, 1),
                      FormBuilderValidators.max(context, 100),
                    ],
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Enter Mileage'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'power',
                  autocorrect: false,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.integer(context),
                      FormBuilderValidators.min(context, 1),
                    ],
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Enter Power (Bhp Value)'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  name: 'brand',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                    ],
                  ),
                  items: [
                    'Bajaj',
                    'Royal Enfield',
                    'KTM',
                    'Yamaha',
                    'UM',
                    'Hero',
                    'Honda',
                    'Suzuki',
                    'TVS',
                    'Harley-Davidson',
                    'Other'
                  ].map(
                    (item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    },
                  ).toList(),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Select Brand'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'engine',
                  autocorrect: false,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.min(context, 1),
                    ],
                  ),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Enter Engine Value (In cc)'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderDropdown(
                  name: 'model_year',
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                    ],
                  ),
                  items: _modelYearGenerator().map(
                    (item) {
                      return DropdownMenuItem(
                        child: Text(item.toString()),
                        value: item,
                      );
                    },
                  ).toList(),
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    label: const Text('Select Model Year'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonTheme(
                  minWidth: double.maxFinite,
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        _getResult();
                      }
                    },
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: btnColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
