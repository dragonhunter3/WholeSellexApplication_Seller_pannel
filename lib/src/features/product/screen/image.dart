// import 'dart:io';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

// class ImageUploadBox extends StatefulWidget {
//   const ImageUploadBox({super.key});

//   @override
//   State<ImageUploadBox> createState() => _ImageUploadBoxState();
// }

// class _ImageUploadBoxState extends State<ImageUploadBox> {
//   File? _selectedImage;

//   Future<void> _pickImageFromGallery() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() => _selectedImage = File(picked.path));
//     }
//   }

//   Future<void> _pickImageFromDropZone() async {
//     final result = await FilePicker.platform.pickFiles(type: FileType.image);
//     if (result != null && result.files.single.path != null) {
//       setState(() => _selectedImage = File(result.files.single.path!));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isDesktop = !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Cover Image", style: TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),
//         GestureDetector(
//           onTap: () => isDesktop ? _pickImageFromDropZone() : _pickImageFromGallery(),
//           child: DottedBorder(
//             color: Colors.grey,
//             dashPattern: const [6, 3],
//             borderType: BorderType.RRect,
//             radius: const Radius.circular(10),
//             child: Container(
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(color: Colors.grey[100]),
//               child: _selectedImage != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.file(_selectedImage!, fit: BoxFit.cover),
//                     )
//                   : const Center(child: Text("Click or Drop Image")),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
