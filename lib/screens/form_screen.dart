import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:whats_my_bike_worth/screens/result_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

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
    var vals = _formKey.currentState?.value;

    final response = await http.post(
        Uri.parse('https://439b-103-87-52-190.ngrok.io/predict/'),
        body: json.encode(vals),
        headers: {'content-type': 'application/json'});
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResultScreen(json.decode(response.body)),
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
        backgroundColor: const Color(0xff4e405f),
      ),
      body: SingleChildScrollView(
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
                    buttonColor: const Color(0xff4973a8),
                    child: MaterialButton(
                      // elevation: 10,
                      // height: 45,
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
                      color: Colors.purple,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
