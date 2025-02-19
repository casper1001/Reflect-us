import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/api_service/api_service.dart';
import 'package:reflectus2/core/core_components/nav_bar.dart';
import 'package:reflectus2/core/core_components/state_component.dart';
import 'package:reflectus2/core/handler/handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/community_controller.dart';
import '../core/core_components/pop_up.dart';
import '../themes/theme.dart';
import '../widget/Custom_scaffold.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});
  final controller = Get.put(CommunityController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        bottomNavigationBar: NavBar(inx: 2),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.w),
              child: ElevatedButton(
                  onPressed: () async{
                    final messageController = TextEditingController();
                    await Get.dialog(Dialog(
                      child: Container(
                        margin: EdgeInsets.all(5.w),
                        height: 65.w,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.w,
                              ),
                              TextField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  hintText: 'Message'
                                ),
                              ),
                              SizedBox(
                                height: 5.w,
                              ),
                              ElevatedButton(
                                  onPressed: ()async{
                                    showLoader();
                                    var res = await handle(() => ApiService.addMessage(messageController.text));
                                    Get.back();
                                    res.fold((failState) => showSnackBar('Error : ${failState.message}'), (successState) => null);
                                    Get.back();
                                  },
                                  child: Text('Send')
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                  child: const Text('Add Message')
              ),
            ),
         ),
        Expanded(
          flex: 7,
          child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: GetBuilder<CommunityController>(
                builder: (_) {
                  return StatusComponent<List<String>>(
                    state: controller.state,
                    onSuccess: (_,state) =>ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (_,i) =>
                            ListTile(
                              title: Text(controller.data[i]),
                              leading: Icon(Icons.message),
                            )
                    ),
                  );
                }
              )
          )
        )
    ]),
    );
  }

}
