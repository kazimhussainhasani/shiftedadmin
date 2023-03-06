import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_screens/core/constants/color_constants.dart';
import 'package:fyp_screens/core/constants/text_constants.dart';
import 'package:fyp_screens/core/utils/app_snack_bar.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/driver_license_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../commons/app_button.dart';
import '../widgets/id_image_picker_button.dart';
import '../widgets/id_image_provider.dart';
import '../widgets/profile_image_picker_button.dart';

class IDConfirmationScreen extends ConsumerWidget {
  const IDConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(idImageProvider);

    bool isActive = false;

    void validateFields() {
      if (imageState == null) {
        debugPrint("I am here");
        showSnackBar(context, "Photo is required");
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DriverLicenseScreen()),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(),
        title: Text(
          AppText.idconfi,
          style: GoogleFonts.kadwa(color: Colors.black),
        ),
      ),
      body: ColoredBox(
        color: const Color(0xffFBFBFB),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            children: [
              // step 1
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 0.25),
                  ),
                  child: Text(
                    "3/8",
                    style: GoogleFonts.kadwa(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),

              // form
              Container(
                height: 550,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFFFFF),
                  border: Border.all(color: Colors.grey, width: 0.25),
                ),
                child: Column(
                  children: [
                    imageState == null
                        ? Container(
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff696969),
                            ),
                          )
                        :
                        // photo box
                        Container(
                            clipBehavior: Clip.antiAlias,
                            height: 300,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff696969),
                            ),
                            child: Image.file(
                              File(imageState.path),
                              fit: BoxFit.cover,
                            ),
                          ),
                    const SizedBox(
                      height: 12,
                    ),

                    // add image button
                    IdImagePickerButton(),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // query banner
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color(0xffFFFCCF),
                    borderRadius: BorderRadius.circular(12)),
                child: RichText(
                  text: TextSpan(
                    text: 'For queries, please contact our\n ',
                    style: GoogleFonts.kadwa(color: Colors.black, fontSize: 15),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'customer support',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppButton(
        name: AppText.next,
        onPress: () => validateFields(),
      ),
    );
  }
}
