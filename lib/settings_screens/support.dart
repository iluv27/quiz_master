import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/profile_widgets.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  String? _name;
  String? _email;
  String? _message;

  final List<String> _categories = ['General', 'Technical', 'Billing'];

  @override
  void dispose() {
    super.dispose();
    _formKey;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 32,
              color: Provider.of<ThemeProvider>(context).themeData == lightMode
                  ? const Color(0xff111111)
                  : Colors.white,
            ),
          ),
          title: Text(
            'Support Form',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        body: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonFormField(
                    value: _selectedCategory,
                    items: _categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    hint: const Text('Select Category'),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsTextField(
                    mainLabel: 'Enter Your Name',
                    subLabel: 'Full Name',
                    onSaved: (value) {
                      _name = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsTextField(
                    mainLabel: 'Enter Your Mail',
                    subLabel: 'Email',
                    onSaved: (value) {
                      _email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsTextField(
                    maximumLines: 4,
                    mainLabel: 'Leave a Message',
                    subLabel: 'Leave a Message',
                    onSaved: (value) {
                      _message = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  SignupButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    buttonText: 'Submit Message',
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
