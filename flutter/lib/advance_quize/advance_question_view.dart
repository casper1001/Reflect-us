import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:get/get.dart';
import 'package:reflectus2/advance_quize/advance_quize_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/core_components/video_player/video_widget.dart';
import 'advance_quize_controller.dart';


class AdvanceQuestionView extends StatefulWidget {
  final AdvanceQuizModel model;
  const AdvanceQuestionView(this.model,{Key? key}) : super(key: key);

  @override
  State<AdvanceQuestionView> createState() => _AdvanceQuestionViewState();
}

class _AdvanceQuestionViewState extends State<AdvanceQuestionView> {
  AdvanceQuestionController get controller => Get.find();

  String? _selected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Question ${controller.current + 1}/${controller.questions.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "What does this sign mean?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 15.w,
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: (){
                        VideoWidget.showVideo(widget.model.video);
                      },
                      child: const Text('show video'),
                    )
                ),
                const Spacer(),
                Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: (){
                        Get.dialog(
                            Dialog(
                              child: SizedBox(
                                height: 50.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        onPressed: Get.back,
                                        icon: const Icon(Icons.close),
                                      ),
                                    ),
                                    Expanded(
                                      child: Cube(
                                        onSceneCreated: (s){
                                          s.world.add(Object(fileName: widget.model.model3D));
                                          s.camera.zoom = 5;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        );
                      },
                      child: const Text('show model'),
                    )
                ),
                const Spacer(),
              ],
            ),
          ),

          Center(
            child: GestureDetector(
              onTap: controller.setImage,
              child: Container(
                margin: EdgeInsets.all(2.5.w),
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(7.5.w),
                  image: controller.selectedImage != null ?
                      DecorationImage(
                          image: FileImage(
                            File(controller.selectedImage!)
                          ),
                        fit: BoxFit.cover
                      ):null
                ),
                alignment: Alignment.center,
                child: Visibility(
                  visible: controller.selectedImage == null,
                  child: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: Colors.white,
                      size: 12.w,
                  ),
                ),
              ),
            ),
          ),
          
          SizedBox(
            height: 5.w,
          ),
          Center(
            child: SizedBox(
              width: 50.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.deepPurple.shade200, shape: const StadiumBorder(),
                ),
                onPressed: () {
                  controller.sendData();
                  setState(() {
                    _selected = null;
                  });
                },
                child: Text(controller.current == controller.questions.length - 1 ? 'Finish':'Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}