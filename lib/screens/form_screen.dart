import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fill Details',
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
                          value: item.toLowerCase(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
