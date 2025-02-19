
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/core/core_components/video_player/video_widget_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoWidget extends GetView<VideoWidgetController> {
  const VideoWidget._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoWidgetController>(
      builder: (_) {
        if(controller.isInitialized) {
          return Chewie(
          controller: controller.chewieController,
        );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }

  static void showVideo(String url)async{
    Get.put(VideoWidgetController(url));
    await Get.dialog(
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
                const Expanded(child: VideoWidget._()),
              ],
            ),
          ),
        )
    );
    Get.delete<VideoWidgetController>();

  }


}


