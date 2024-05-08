import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/register/register_widgets.dart';
import 'package:quiz_master/services/supabase_services.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:quiz_master/theme/theme.dart';
import 'package:quiz_master/widgets/profile_widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _profileImageUrl;

  @override
  void dispose() {
    super.dispose();
    _formKey;
  }

  Future<void> _onUpload(String imageUrl) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      await supabase.from('users').upsert({
        'user_id': userId,
        'profile_image': imageUrl,
      });
      if (mounted) {
        const SnackBar(
          content: Text('Updated your profile image!'),
        );
      }
    } on PostgrestException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _profileImageUrl = imageUrl;
    });
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
            'Edit Profile',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Avatar(onUpload: _onUpload),
                  const SizedBox(
                    height: 25,
                  ),
                  SettingsTextField(
                    mainLabel: Provider.of<AuthProvider>(context, listen: false)
                        .profileName,
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
                  const SizedBox(height: 50),
                  SignupButton(
                    onPressed: () {
                      debugPrint('Name: $_name');
                      debugPrint('Email: $_profileImageUrl');
                      Provider.of<AuthProvider>(context, listen: false)
                          .updateProfile(_name, _profileImageUrl, context);
                    },
                    buttonText: 'Save Changes',
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
