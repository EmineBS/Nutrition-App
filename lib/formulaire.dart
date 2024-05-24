import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _formulaireState();
}

class _formulaireState extends State<Formulaire> {
  final _formKey = GlobalKey<FormState>();
  String _age = '';
  String _weight = '';
  String _height = '';
  String _sports = '';
  String _activityDays = '';
  String _goal = 'Gain';
  List<String> _goals = ['Gain', 'Maintain', 'Loss'];

  void _submitForm(Map<String, dynamic>? userData) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final url =
          Uri.parse("http://10.0.2.2/nutritionApp/reservation/create.php");

      final response = await http.post(
        url,
        body: {
          '_age': _age,
          '_weight': _weight,
          '_height': _height,
          '_sports': _sports,
          '_activityDays': _activityDays,
          '_goal': _goal,
          '_userId': userData?["id"],
        },
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Reservation submitted successfully!')));
        Navigator.pushReplacementNamed(context, '/accueil');
      } else {
        // Handle error response
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to submit reservation')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Nutritionist Form',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    labelText: 'Age',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _age = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Weight (kg)',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _weight = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Height (cm)',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _height = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Sports',
                    onSaved: (value) {
                      _sports = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your sports activities';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    labelText: 'Activity Days per Week',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _activityDays = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of activity days';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Goal',
                      border: OutlineInputBorder(),
                    ),
                    value: _goal,
                    onChanged: (String? newValue) {
                      setState(() {
                        _goal = newValue!;
                      });
                    },
                    items: _goals.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      //onPressed: _submitForm,
                      onPressed: () {
                        _submitForm(userData);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text('Submit'),
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

  Widget _buildTextField({
    required String labelText,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
