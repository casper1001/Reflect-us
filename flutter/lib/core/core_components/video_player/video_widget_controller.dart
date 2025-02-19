
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoWidgetController extends GetxController {
  final String url;
  VideoWidgetController(this.url);

  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  bool _isInitialized = false;


  bool get isInitialized => _isInitialized;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: false,
      allowFullScreen: false,
      aspectRatio: 16/9,
    );
  }

  void _init()async{
    try{
      await videoPlayerController.initialize();
    }
    catch(e){
      print(e);
    }
    _isInitialized = true;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

}