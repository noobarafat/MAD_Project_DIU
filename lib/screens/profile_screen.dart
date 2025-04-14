import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:university_event_management_system/screens/login_page.dart';

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

  int participated = 6;
  int going = 4;
  int interested = 1;
  String gender = 'Male';
  String dob = '01 Jan 2000';
  String university = 'DIU';
  String className = 'CSE-31A';
  String topics = 'AI, ML, Flutter';

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
    String tempName = name;
    String tempEmail = email;
    String tempGender = gender;
    String tempDob = dob;
    String tempUniversity = university;
    String tempClassName = className;
    String tempTopics = topics;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTextField('Name', tempName, (v) => tempName = v),
                  _buildTextField('Email', tempEmail, (v) => tempEmail = v),
                  _buildTextField('Gender', tempGender, (v) => tempGender = v),
                  _buildTextField('DOB', tempDob, (v) => tempDob = v),
                  _buildTextField(
                    'University',
                    tempUniversity,
                    (v) => tempUniversity = v,
                  ),
                  _buildTextField(
                    'Class',
                    tempClassName,
                    (v) => tempClassName = v,
                  ),
                  _buildTextField('Topics', tempTopics, (v) => tempTopics = v),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    name = tempName;
                    email = tempEmail;
                    gender = tempGender;
                    dob = tempDob;
                    university = tempUniversity;
                    className = tempClassName;
                    topics = tempTopics;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    String initial,
    Function(String) onChanged,
  ) {
    return TextFormField(
      initialValue: initial,
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
      validator: (value) => value!.isEmpty ? 'Enter $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: theme.primaryColor,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _image != null
                    ? FileImage(_image!)
                    : AssetImage('assets/images/d_profile.png') as ImageProvider,
                child: _image == null
                    ? Icon(Icons.add_a_photo, size: 30)
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Text(name, style: theme.textTheme.headlineLarge),
            Text(email, style: theme.textTheme.bodyMedium),
            SizedBox(height: 20),

            
            Card(
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: _buildStatColumn(participated, 'Participated')),
                      VerticalDivider(thickness: 1.5),
                      Expanded(child: _buildStatColumn(going, 'Going')),
                      VerticalDivider(thickness: 1.5),
                      Expanded(child: _buildStatColumn(interested, 'Interested')),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            
            _buildInfoTile(Icons.person, 'Gender', gender),
            _buildInfoTile(Icons.cake, 'DOB', dob),
            _buildInfoTile(Icons.school, 'University', university),
            _buildInfoTile(Icons.class_, 'Class', className),
            _buildInfoTile(Icons.topic, 'Interested Topics', topics),

            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _editProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
              ),
              child: Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(int number, String label) {
    return Column(
      children: [
        Text(
          '$number',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value),
      dense: true,
    );
  }
}