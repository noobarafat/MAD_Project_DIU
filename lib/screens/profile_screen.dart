import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  final picker = ImagePicker();

  String name = 'Your Name';
  String email = 'youremail@gmail.com';

  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        String tempName = name;
        String tempEmail = email;

        return AlertDialog(
          title: Text('Edit Profile',
          style: TextStyle(color:Colors.white),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) => tempName = value,
                  validator: (value) => value!.isEmpty ? 'Enter Name' : null,
                ),
                TextFormField(
                  initialValue: email,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) => tempEmail = value,
                  validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    name = tempName;
                    email = tempEmail;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save',
               style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(Icons.add_a_photo, size: 30)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              email,
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile,

              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
              ),
              child: Text(
  'Save',
  style: TextStyle(color: Colors.white),
),
            ),
          ],
        ),
      ),
    );
  }
} 