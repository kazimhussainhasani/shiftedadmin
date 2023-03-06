import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_screens/core/constants/text_constants.dart';
import 'package:fyp_screens/features/driver_main_screen/screens/driver_cnic_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../commons/app_button.dart';
import '../../../core/utils/app_image_picker.dart';
import '../../../core/utils/app_snack_bar.dart';

class DriverLicenseScreen extends ConsumerStatefulWidget {
  const DriverLicenseScreen({super.key});

  @override
  ConsumerState<DriverLicenseScreen> createState() =>
      _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends ConsumerState<DriverLicenseScreen> {
  XFile? frontImage;
  XFile? backImage;

  @override
  Widget build(BuildContext context) {
    bool isActivate = false;

    void validateFields() {
      if (frontImage == null) {
        debugPrint("i am here");
        showSnackBar(context, "Frontside of License is required");
      } else if (backImage == null) {
        showSnackBar(context, "Backside of License is required");
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DriverCNICScreen(),
        ));
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: Text(
          AppText.driverlisce,
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
                    "4/8",
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
                child: FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "The Frontside of Driver's License",
                        style: GoogleFonts.kadwa(fontSize: 15),
                      ),
                      const SizedBox(height: 12),

                      // first photo box
                      frontImage == null
                          ? Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff696969),
                              ),
                            )
                          : Container(
                              clipBehavior: Clip.antiAlias,
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff696969),
                              ),
                              child: Image.file(
                                File(frontImage!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(
                        height: 12,
                      ),

                      // first button
                      ElevatedButton(
                        onPressed: () async {
                          frontImage = await appPickImage();
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffFFFFFF)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                          ),
                        ),
                        child: Text(
                          AppText.addImage,
                          style: GoogleFonts.kadwa(color: Colors.black),
                        ),
                      ),
                      Divider(),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "The Backside of Driver's License",
                        style: GoogleFonts.kadwa(fontSize: 15),
                      ),
                      const SizedBox(height: 12),

                      // second photo box

                      backImage == null
                          ? Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff696969),
                              ),
                            )
                          : Container(
                              clipBehavior: Clip.antiAlias,
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff696969),
                              ),
                              child: Image.file(
                                File(backImage!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(
                        height: 12,
                      ),

                      // second button
                      ElevatedButton(
                        onPressed: () async {
                          backImage = await appPickImage();
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffFFFFFF)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                          ),
                        ),
                        child: Text(
                          AppText.addImage,
                          style: GoogleFonts.kadwa(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
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
