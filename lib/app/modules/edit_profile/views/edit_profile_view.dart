import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/account');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        title:
            Text('ប្ដូរគណនីផ្ទាល់ខ្លួន', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              // Save logic
              Get.snackbar('Success', 'Profile updated!');
            },
            child: Text('រក្សាទុក', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => GestureDetector(
                  onTap: controller.pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        controller.profileImagePath.value.isNotEmpty
                            ? FileImage(File(controller.profileImagePath.value))
                            : AssetImage('assets/default_profile.png')
                                as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                )),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) => controller.name.value = value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'ឈ្មោះ',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: ['ប្រុស', 'ស្រី']
                  .map((gender) =>
                      DropdownMenuItem(value: gender, child: Text(gender)))
                  .toList(),
              onChanged: (value) => controller.gender.value = value!,
              decoration: InputDecoration(
                labelText: 'ភេទ',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) => controller.email.value = value,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'អ៊ីមែល',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      onSelect: (Country country) {
                        controller.selectedCountryCode.value =
                            '+${country.phoneCode}';
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(() => Text(
                          controller.selectedCountryCode.value,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    onChanged: (value) => controller.phone.value = value,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'លេខទូរស័ព្ទ',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[850],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
