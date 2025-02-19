import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/core/core_components/video_player/video_widget.dart';
import 'package:reflectus2/quiz/quiz_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'question_model.dart';
import 'package:flutter_cube/flutter_cube.dart';

class QuestionView extends StatefulWidget {
  final QuestionModel model;
  const QuestionView(this.model,{Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  QuizController get controller => Get.find();

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
            child: Text(
              widget.model.questionText,
              style: const TextStyle(
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
          ...widget.model.answersList.map((e) => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: _selected == e ? Colors.white : Colors.black, backgroundColor: _selected == e ? Colors.deepPurple.shade200 : Colors.white, shape: const StadiumBorder(),
              ),
              onPressed: () {
                setState(() {
                  _selected = e;
                });
              },
              child: Text(e),
            ),
          )
          ).toList(),
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
                  controller.next(widget.model.answersList.indexOf(_selected?? '') == widget.model.correctInx);
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
