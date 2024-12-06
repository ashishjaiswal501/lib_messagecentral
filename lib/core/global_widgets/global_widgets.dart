import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:messagecentral/core/constants/image_path.dart';

class GlobalWidgets {
  static Widget backButton({required void Function()? onPressed}) {
    return IconButton(
      splashRadius: 20,
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: Colors.black,
      ),
    );
  }

  static Widget loadingWidget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ))),
        SizedBox(
          width: 5,
        ),
        Text("Please wait...")
      ],
    );
  }

  static Widget blurContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagePath.backgroundHomeblur),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Color(0x80091E42), BlendMode.darken))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      ),
    );
  }

  static Widget buildGridItem({
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          color: const Color(0xFFDFE2E6),
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(-1.00, 0.00),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(-1.00, 1.00),
                  child: Text(
                    value,
                    maxLines: 1,
                    style: TextStyle(
                      color: color,
                      fontSize: 35.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
