import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_screens/core/constants/color_constants.dart';
import 'package:fyp_screens/core/constants/text_constants.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/id_confirmation_screeen.dart';
import 'package:fyp_screens/features/driver_main_screen/widgets/profile_image_picker_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../commons/app_button.dart';
import '../../../core/utils/app_snack_bar.dart';
import '../widgets/profile_image_provider.dart';

class DriverMainScreen extends ConsumerWidget {
  const DriverMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imageProvider);

    bool isActive = false;

    final fnameController = TextEditingController();
    final lnameController = TextEditingController();

    void validateFields() {
      if (imageState == null) {
        debugPrint("i am here");
        showSnackBar(context, "Photo is required");
      } else if (fnameController.text.isEmpty) {
        showSnackBar(context, "First name is required");
      } else if (lnameController.text.isEmpty) {
        showSnackBar(context, "Last name is required");
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => IDConfirmationScreen(),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        title: Text(
          AppText.basicInfo,
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
                    "2/8",
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
                    // photo box
                    imageState == null
                        ? Container(
                            height: 200,
                            width: 202,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff696969),
                            ),
                          )
                        : Container(
                            clipBehavior: Clip.antiAlias,
                            height: 200,
                            width: 202,
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
                    ProfileImagePickerButton(),
                    const SizedBox(height: 20.0),

                    // first name
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: TextField(
                        controller: fnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20.0),
                          border: InputBorder.none,
                          hintText: "first name",
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // last name
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: TextField(
                        controller: lnameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 20.0),
                          border: InputBorder.none,
                          hintText: "last name",
                        ),
                      ),
                    ),
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
        name: "Next",
        onPress: () => validateFields(),
      ),
    );
  }
}
