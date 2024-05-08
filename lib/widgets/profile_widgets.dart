import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/screens/user_screen.dart';
import 'package:quiz_master/services/supabase_services.dart';
import 'package:quiz_master/theme/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../theme/theme.dart';

//CUSTOM TOGGLE SWITCH
class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool isSwitched = true;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: _toggleSwitch,
      activeTrackColor: const Color.fromARGB(86, 224, 120, 30),
      activeColor: AppColors.primary,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashRadius: 10, // Reduces the tap target size
    );
  }
}

// REPEATED LIST TILE FOR SETTINGS SCREEN
class RepeatedListTile extends StatelessWidget {
  const RepeatedListTile(
      {super.key,
      required this.title,
      required this.icon,
      this.onPressed,
      this.trailingIcon = const Icon(
        Icons.arrow_forward_ios,
      )});

  final String title;
  final IconData icon;
  final Function()? onPressed;
  final Widget trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onPressed,
        child: ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeData == lightMode
                          ? const Color.fromARGB(29, 224, 120, 30)
                          : const Color.fromARGB(52, 224, 120, 30),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Icon(
                icon,
                size: 18,
                color: AppColors.primary,
              ),
            ),
            trailing: trailingIcon),
      ),
    );
  }
}

// CUSTOM MADE TEXT FIELDS
class SettingsTextField extends StatelessWidget {
  const SettingsTextField(
      {super.key,
      required this.mainLabel,
      required this.subLabel,
      required this.validator,
      required this.onSaved,
      this.suffixIcon,
      this.maximumLines,
      this.obscuredText = false});

  final String mainLabel;
  final String subLabel;
  final Function(String?) onSaved;
  final String? Function(dynamic)? validator;
  final Widget? suffixIcon;
  final bool obscuredText;
  final int? maximumLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maximumLines,
      cursorWidth: 1.5,
      cursorHeight: 20,
      cursorColor: AppColors.primary,
      obscureText: obscuredText,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          contentPadding: const EdgeInsets.only(left: 15),
          hintText: mainLabel,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color:
                Provider.of<ThemeProvider>(context, listen: false).themeData ==
                        lightMode
                    ? const Color(0xAB666666)
                    : const Color.fromARGB(171, 208, 208, 208),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          helperText: subLabel,
          helperStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Provider.of<ThemeProvider>(context, listen: false)
                          .themeData ==
                      lightMode
                  ? const Color(0xff111111)
                  : const Color.fromARGB(255, 237, 237, 237))),
      validator: validator,
      onChanged: onSaved,
    );
  }
}

// USER AVATAR

class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    required this.onUpload,
  });

  final void Function(String) onUpload;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _isLoading ? null : _upload,
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Provider.of<AuthProvider>(context, listen: false)
                        .profileImage !=
                    ''
                ? null
                : Provider.of<ThemeProvider>(context, listen: false)
                            .themeData ==
                        lightMode
                    ? getRandomColorLight()
                    : getRandomColorDark(),
            child: Provider.of<AuthProvider>(context, listen: false)
                        .profileImage !=
                    ''
                ? null
                : Text(
                    Provider.of<AuthProvider>(context, listen: false)
                        .getUserInitials(),
                    style: TextStyle(
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                        .themeData ==
                                    lightMode
                                ? Colors.white
                                : const Color(0xff111111),
                        fontSize: 18,
                        letterSpacing: -1,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600),
                  ),
            // backgroundImage: AssetImage('images/css.png'),
          ),
        ),
      ],
    );
  }

  Future<void> _upload() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }
    setState(() => _isLoading = true);

    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await supabase.storage.from('avatars').uploadBinary(
            filePath,
            bytes,
            fileOptions: FileOptions(contentType: imageFile.mimeType),
          );
      final imageUrlResponse = await supabase.storage
          .from('avatars')
          .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
      widget.onUpload(imageUrlResponse);
    } on StorageException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Unexpected error occurred'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }

    setState(() => _isLoading = false);
  }
}
