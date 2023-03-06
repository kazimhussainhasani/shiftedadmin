// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// Future<XFile?> pickImage() async {
//   try {
//     final image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (image == null) {
//       return null;
//     }

//     final imageTemp = XFile(image.path);

//     return imageTemp;
//   } on PlatformException catch (e) {
//     debugPrint("failed to pick image: $e");
//   }
// }
