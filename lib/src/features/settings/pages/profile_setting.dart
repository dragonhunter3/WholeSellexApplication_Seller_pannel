import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/app_images.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/constants/global_variables.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_button.dart';
import 'package:whole_sellex_selleradmin_pannel/src/common/widgets/custom_textfield.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/responsive_layout/responsive_layout.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/settings/controller/profile_controller.dart';

class ProfileSettingPage extends StatefulWidget {
  const ProfileSettingPage({super.key});

  @override
  State<ProfileSettingPage> createState() => _ProfileSettingPageState();
}

class _ProfileSettingPageState extends State<ProfileSettingPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    final profileController =
        Provider.of<ProfileController>(context, listen: false);
    profileController.fetchUserData();
    nameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();

    profileController.addListener(() {
      if (profileController.user != null) {
        nameController.text = profileController.user!.userName;
        emailController.text = profileController.user!.userEmail;
        bioController.text = profileController.user!.bio ?? '';
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  // Show re-authentication dialog
  Future<String?> _showReauthenticationDialog(BuildContext context) async {
    final passwordController = TextEditingController();
    String? password;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Re-authentication Required'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please enter your password to verify your identity.'),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: passwordController,
              fillColor: Colors.white,
              borderColor: Colors.black,
              borderRadius: 8,
              labelText: 'Password',
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              password = passwordController.text;
              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    return password;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final controller = Provider.of<ProfileController>(context);
    TextStyle? textStyle;
    TextStyle? textStyle2;
    if (width < 600) {
      textStyle = textTheme(context).bodyMedium;
      textStyle2 = textTheme(context).bodyMedium;
    } else if (width < 1024) {
      textStyle = textTheme(context).bodySmall;
      textStyle2 = textTheme(context).bodyMedium;
    } else {
      textStyle = textTheme(context).labelLarge;
      textStyle2 = textTheme(context).bodySmall;
    }
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveLayout(
            mobileLayout: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.error != null
                    ? Center(
                        child: Text(controller.error!,
                            style: textStyle?.copyWith(color: Colors.red)))
                    : SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile Information",
                                  style: textStyle?.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: controller.pickedImage !=
                                                  null &&
                                              !kIsWeb
                                          ? FileImage(File(
                                              controller.pickedImage!.path))
                                          : controller.user?.profilePicture !=
                                                  null
                                              ? NetworkImage(controller
                                                  .user!.profilePicture!)
                                              : const AssetImage(
                                                  'assets/images/game.jpg'), // Replace with AppImages.game
                                    ),
                                    const SizedBox(width: 30),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.pickImage();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add,
                                                color: Colors.white),
                                            Text(
                                              "  Replace Picture",
                                              style: textStyle2?.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        controller.removeProfilePicture();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.3)),
                                        ),
                                        child:
                                            Text("Remove", style: textStyle2),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Text("Display name", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: nameController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Email", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: emailController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Bio", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: bioController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  maxLines: 4,
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await controller.updateProfileDetails(
                                          userName: nameController.text,
                                          userEmail: emailController.text,
                                          bio: bioController.text.isEmpty
                                              ? null
                                              : bioController.text,
                                        );
                                        if (controller.pickedImage != null) {
                                          await controller
                                              .updateProfilePicture();
                                        }
                                        if (controller.error == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Profile updated successfully')),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text(controller.error!)),
                                          );
                                        }
                                      }
                                    },
                                    text: "Update Profile")
                              ],
                            ),
                          ),
                        ),
                      ),
            tabletLayout: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.error != null
                    ? Center(
                        child: Text(controller.error!,
                            style: textStyle?.copyWith(color: Colors.red)))
                    : SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile Information",
                                  style: textStyle?.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: controller.pickedImage !=
                                                  null &&
                                              !kIsWeb
                                          ? FileImage(File(
                                              controller.pickedImage!.path))
                                          : controller.user?.profilePicture !=
                                                  null
                                              ? NetworkImage(controller
                                                  .user!.profilePicture!)
                                              : const AssetImage(
                                                  'assets/images/game.jpg'), // Replace with AppImages.game
                                    ),
                                    const SizedBox(width: 30),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.pickImage();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add,
                                                color: Colors.white),
                                            Text(
                                              "  Replace Picture",
                                              style: textStyle2?.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        controller.removeProfilePicture();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.3)),
                                        ),
                                        child:
                                            Text("Remove", style: textStyle2),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Text("Display name", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: nameController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Email", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: emailController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Bio", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: bioController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  maxLines: 4,
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await controller.updateProfileDetails(
                                          userName: nameController.text,
                                          userEmail: emailController.text,
                                          bio: bioController.text.isEmpty
                                              ? null
                                              : bioController.text,
                                        );
                                        if (controller.pickedImage != null) {
                                          await controller
                                              .updateProfilePicture();
                                        }
                                        if (controller.error == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Profile updated successfully')),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text(controller.error!)),
                                          );
                                        }
                                      }
                                    },
                                    text: "Update Profile")
                              ],
                            ),
                          ),
                        ),
                      ),
            desktopLayout: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : controller.error != null
                    ? Center(
                        child: Text(controller.error!,
                            style: textStyle?.copyWith(color: Colors.red)))
                    : SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile Information",
                                  style: textStyle?.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: controller.pickedImage !=
                                                  null &&
                                              !kIsWeb
                                          ? FileImage(File(
                                              controller.pickedImage!.path))
                                          : controller.user?.profilePicture !=
                                                  null
                                              ? NetworkImage(controller
                                                  .user!.profilePicture!)
                                              : const AssetImage(
                                                  'assets/images/game.jpg'), // Replace with AppImages.game
                                    ),
                                    const SizedBox(width: 30),
                                    GestureDetector(
                                      onTap: () async {
                                        await controller.pickImage();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.add,
                                                color: Colors.white),
                                            Text(
                                              "  Replace Picture",
                                              style: textStyle2?.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        controller.removeProfilePicture();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.3)),
                                        ),
                                        child:
                                            Text("Remove", style: textStyle2),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Text("Display name", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: nameController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Email", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: emailController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  borderRadius: 8,
                                ),
                                const SizedBox(height: 20),
                                Text("Bio", style: textStyle),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  controller: bioController,
                                  fillColor: Colors.white,
                                  borderColor: Colors.black,
                                  maxLines: 4,
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                    onTap: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await controller.updateProfileDetails(
                                          userName: nameController.text,
                                          userEmail: emailController.text,
                                          bio: bioController.text.isEmpty
                                              ? null
                                              : bioController.text,
                                        );
                                        if (controller.pickedImage != null) {
                                          await controller
                                              .updateProfilePicture();
                                        }
                                        if (controller.error == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Profile updated successfully')),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text(controller.error!)),
                                          );
                                        }
                                      }
                                    },
                                    text: "Update Profile")
                              ],
                            ),
                          ),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
