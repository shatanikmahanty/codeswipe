import 'dart:io';

import 'package:codeswipe/code_swipe_icons.dart';
import 'package:codeswipe/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CodeSwipeImagePicker extends StatelessWidget {
  const CodeSwipeImagePicker({
    super.key,
    this.pickedImagePath,
    required this.onImagePicked,
    required this.clearImageCallback,
    this.iconSize = kPadding * 2.5,
  });

  final String? pickedImagePath;
  final VoidCallback clearImageCallback;
  final void Function(XFile image) onImagePicked;
  final double iconSize;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: kPadding * 10,
            foregroundImage: pickedImagePath != null
                ? FileImage(File(pickedImagePath!))
                : null,
          ),
          Positioned(
            bottom: 0,
            right: -kPadding,
            child: GestureDetector(
              onTap: () async {
                if (pickedImagePath != null) {
                  clearImageCallback.call();
                  return;
                }

                final ImagePicker picker = ImagePicker();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) onImagePicked.call(image);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: kPadding * 4,
                child: CircleAvatar(
                  radius: kPadding * 3,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: pickedImagePath == null
                      ? Icon(
                          CodeSwipeIcons.camera,
                          color: Colors.white,
                          size: iconSize,
                        )
                      : Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: iconSize,
                        ),
                ),
              ),
            ),
          ),
        ],
      );
}
