import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectus2/core/assets/assets.dart';
import 'package:reflectus2/core/core_components/nav_bar.dart';
import 'package:reflectus2/core/storage/storage_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../themes/theme.dart';
import '../widget/Custom_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = StorageHandler().user;
    return CustomScaffold(
        bottomNavigationBar: const NavBar(inx: 1),
        child: Column(children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
          flex: 8,
          child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Agbalumo',
                              fontWeight: FontWeight.w900,
                              color: lightColorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 40),
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage(user.imagePath),
                          ),
                          const SizedBox(height: 20),
                          itemProfile(
                              'UserName', user.name, CupertinoIcons.person),
                          const SizedBox(height: 10),
                          itemProfile('Email', user.email,
                              CupertinoIcons.mail),
                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: _updateAvatar,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: const Text('Edit Avater')),
                          )
                        ],
                      ),
                    ),
                  ))))
    ]),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.blueAccent.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  void _updateAvatar()=>Get.dialog(
    Dialog(
      child: ListView.builder(
          padding: EdgeInsets.all(5.w),
          itemCount: 7,
          itemBuilder: (_,i)=>Container(
            margin: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF416FDF),
                width: 3
              )
            ),
            child: InkWell(
              onTap: ()async{
                var user = StorageHandler().user;
                await StorageHandler().setUser(user.copyWith(
                  image: i+1
                ));
                Get.offAllNamed('/Profile');
              },
              child: Image.asset(
                AssetsConst.getAvatar(i+1)
              ),
            ),
          )
      ),
    )
  );
}
