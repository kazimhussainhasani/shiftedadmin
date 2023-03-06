import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_screens/features/driver_main_screen/widgets/id_image_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/text_constants.dart';

class IdImagePickerButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(idImageProvider);

    return ElevatedButton(
      onPressed: () async {
        final imagePicker = ImagePicker();
        final image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          ref.read(idImageProvider.notifier).setImage(image);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xffFFFFFF)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
      ),
      child: imageState == null
          ? Text(
              AppText.addImage,
              style: GoogleFonts.kadwa(color: Colors.black),
            )
          : Text(
              AppText.changeImage,
              style: GoogleFonts.kadwa(color: Colors.black),
            ),
    );
  }
}
