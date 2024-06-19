import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProfileWidget extends StatefulWidget {
  const ImageProfileWidget({super.key});

  @override
  State<ImageProfileWidget> createState() => _ImageProfileWidgetState();
}

class _ImageProfileWidgetState extends State<ImageProfileWidget> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //middle profile pic
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 127, 18, 146),
            radius: 80,
            child: CircleAvatar(
              radius: 78,
              backgroundImage: _imageFile == null
                  ? const AssetImage('assets/icons/profilePic.png')
                  : FileImage(File(_imageFile!.path)) as ImageProvider,
            ),
          ),

          //camera icon
          Positioned(
              top: 108,
              left: 123,
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: ((builder) => bottomSheet()));
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 20,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff272727)),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const Text(
              'Select Profile Photo',
              style: TextStyle(
                  color: Color(0xffDCDCDC),
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //camara icon button
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            takePhoto(ImageSource.camera);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color(0xff272727)),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white70,
                          )),
                      const Text(
                        'Camera',
                        style: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      )
                    ],
                  ),

                  //galery icon button
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            //galery function
                            takePhoto(ImageSource.gallery);
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color(0xff272727)),
                          ),
                          child: const Icon(
                            Icons.filter_outlined,
                            color: Colors.white70,
                          )),
                      const Text(
                        'Gallery',
                        style: TextStyle(
                            color: Color(0xffDCDCDC),
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
