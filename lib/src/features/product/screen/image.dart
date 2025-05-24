import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/product/provider/image_provider.dart';

class ImageUploadBox extends StatefulWidget {
  const ImageUploadBox({super.key});

  @override
  State<ImageUploadBox> createState() => _ImageUploadBoxState();
}

class _ImageUploadBoxState extends State<ImageUploadBox> {
  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: kIsWeb,
    );

    if (result != null && result.files.isNotEmpty) {
      final imageController =
          Provider.of<ImageController>(context, listen: false);
      final fileName = result.files.first.name;
      final fileBytes = result.files.first.bytes;
      if (fileBytes != null) {
        try {
          await imageController.setImage(fileBytes, fileName);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image uploaded successfully')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageController>(context);
    const double containerHeight = 200;
    const double containerWidth = double.infinity;

    Widget imageWidget;

    if (imageProvider.selectedImage != null) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.memory(
          imageProvider.selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: containerHeight,
        ),
      );
    } else {
      imageWidget = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.file_download, size: 40, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'Click or drop image',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Cover Image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: 6),
            Icon(Icons.error_outline, color: Colors.black, size: 18),
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Center(child: imageWidget),
            ),
          ),
        ),
      ],
    );
  }
}
