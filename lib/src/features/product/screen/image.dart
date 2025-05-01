
import 'dart:typed_data';
import 'dart:io' as io;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageUploadBox extends StatefulWidget {
  const ImageUploadBox({super.key});

  @override
  State<ImageUploadBox> createState() => _ImageUploadBoxState();
}

class _ImageUploadBoxState extends State<ImageUploadBox> {
  Uint8List? _webImage;
  io.File? _pickedFile;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: kIsWeb,
    );

    if (result != null && result.files.isNotEmpty) {
      if (kIsWeb) {
        setState(() {
          _webImage = result.files.first.bytes;
        });
      } else {
        setState(() {
          _pickedFile = io.File(result.files.first.path!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 200;
    const double containerWidth = double.infinity;

    Widget imageWidget;

    if ((kIsWeb && _webImage != null) || (!kIsWeb && _pickedFile != null)) {
      imageWidget = ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: kIsWeb
            ? Image.memory(
                _webImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: containerHeight,
              )
            : Image.file(
                _pickedFile!,
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
          children: [
            const Text(
              'Cover Image',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
       
         SizedBox(width: 6),
              Icon(Icons.error_outline, color: Colors.black, size: 18), ],
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
