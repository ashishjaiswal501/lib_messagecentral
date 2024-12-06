
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:messagecentral/core/global_widgets/custom_button.dart';

import 'package:messagecentral/core/utils/flutter_flow_theme.dart';


class FileUploadingWidget extends StatefulWidget {
  const FileUploadingWidget({super.key});

  @override
  State<FileUploadingWidget> createState() => _FileUploadingWidgetState();
}

class _FileUploadingWidgetState extends State<FileUploadingWidget> {
  late DropzoneViewController controller;

  bool isHighlighted = false;

  bool isUploading = false;

  bool isError = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> acceptFile(dynamic event) async {
    setState(() {
      isUploading = true;
      isHighlighted = false;
      isError = false;
    });

    final name = event.name;
    Uint8List? bytes = await controller.getFileData(event);

    // Check file size (3MB in bytes: 3 * 1024 * 1024)
    if (bytes.length > 3 * 1024 * 1024) {
      setState(() {
        isUploading = false;
        isError = true;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    //When user click on the icon it also should upload file
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        constraints: BoxConstraints(
            minHeight: 200, maxWidth: MediaQuery.sizeOf(context).width * 0.4),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            Row(
              children: [
                Text('Import Contact to Group',
                    style: CustomTextStyle.getFont(
                        Colors.black, 17.0, FontWeight.bold)),
                InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close,
                        color: Color(0xFF42526D), size: 32.0)),
              ],
            ),
            const Divider(
              thickness: 1.0,
              color: Color(0xFFB3B9C4),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Group: ',
                    style: CustomTextStyle.getFont(
                        const Color(0xFF42526D), 14.0, FontWeight.w400),
                  ),
                  TextSpan(
                      text: 'Selected Group',
                      style: CustomTextStyle.getFont(
                          const Color(0xFF42526D), 14.0, FontWeight.w700))
                ]),
              ),
            ),
            GestureDetector(
              onTap: () async {
                // if (!isUploading) {
                //   // I want to upload multiple file so on pickFiles method I set multiple to true
                //   final events = await controller.pickFiles(multiple: true, mime: [
                //     'application/pdf',
                //     'image/jpeg',
                //     'image/png',
                //   ]

                //   );
                //   if (events.isEmpty) {
                //     isUploading = false;
                //     return;
                //   }
                //   for (dynamic event in events) {
                //     await acceptFile(event);
                //   }
                // }
              },
              //This is the dotted border around the Container
              child: DottedBorder(
                borderType: BorderType.RRect,
                strokeWidth: 2,
                //On error I want to show red color
                color:
                    isError ? const Color(0xffF37A7A) : const Color(0xFFCED4DA),
                radius: const Radius.circular(8),
                dashPattern: const [8, 2],
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    //On hover I want to show light blue color
                    color: isHighlighted
                        ? const Color(0xFFEBF0F7)
                        : isError
                            ? const Color(0xffFDEBEB)
                            : const Color(0xFFF8F9FA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // buildZone1(context),

                      DropzoneView(
                        //On drop a callback will run
                        onDrop: acceptFile,
                        onError: (value) {
                          print(value);
                        },
                        //On hover the box color will be change based on isHighlighted bool
                        onHover: () => setState(() => isHighlighted = true),
                        onLeave: () => setState(() => isHighlighted = false),
                        onCreated: (controller) => this.controller = controller,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isUploading
                                ? const CircularProgressIndicator()
                                : const Icon(Icons.cloud_upload_outlined,
                                    color: Color(0xFF5D6B82), size: 40.0),
                            const SizedBox(height: 5),
                            Text(
                              isUploading ? 'Uploading File' : 'Upload File',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              'Fomrat file .csv',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Wrap(
                  runSpacing: 15.0,
                  spacing: 15.0,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        //Navigator.pop(context);
                      },
                      icon: const Icon(FontAwesomeIcons.trashCan,
                          color: Colors.red, size: 16.0),
                      text: 'Delete',
                      options: const FFButtonOptions(),
                      showLoadingIndicator: false,
                    ),
                    FFButtonWidget(
                      text: 'Replace',
                      onPressed: () {
                        //_model.saveTemplate(context, _model);
                      },
                      icon: const Icon(FontAwesomeIcons.arrowsRotate,
                          color: Colors.amber, size: 16.0),
                      options: const FFButtonOptions(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text:
                        'To download a sample file, click the following link ',
                    style: CustomTextStyle.getFont(
                        const Color(0xFF243757), 11.0, FontWeight.w400),
                  ),
                  TextSpan(
                      text: 'Sample_file.CSV',
                      style: GoogleFonts.getFont('Plus Jakarta Sans',
                          color: const Color(0xFF2861B4),
                          fontSize: 11.0,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline))
                ]),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(1.00, 0.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 20.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 5.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: const FFButtonOptions(),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            5.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                            text: 'Import',
                            options: const FFButtonOptions(),
                            onPressed: () {
                              Navigator.pop(context);
                              // showContactsReportWidget(context, '');
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onHover: () {
            setState(() => isHighlighted = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => isHighlighted = false);
            print('Zone 1 left');
          },
          onDrop: (ev) async {
            if (ev is String) {
              print('Zone 1 drop: ${ev}');
              setState(() {
                //message1 = '${ev.name} dropped';
                // highlighted1 = false;
              });
              final bytes = await controller.getFileData(ev);
              print(bytes.sublist(0, min(bytes.length, 20)));
            } else if (ev is String) {
              print('Zone 1 drop: $ev');
              setState(() {
                // message1 = 'text dropped';
                // highlighted1 = false;
              });
              print(ev.substring(0, min(ev.length, 20)));
            } else
              print('Zone 1 unknown type: ${ev.runtimeType}');
          },
        ),
      );
}
