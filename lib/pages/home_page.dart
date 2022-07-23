import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/controllers/home_controller.dart';
import 'package:patterns_getx/pages/create_page.dart';

import '../views/widgets_of_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
        ),
        body: Obx(()=>Stack(
          children: [
            ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (ctx, index) {
                return itemOfPost(controller.items[index]);
              },
            ),
            controller.isLoading()
                ? const Center(
                  child: CircularProgressIndicator(),
            )
                : const SizedBox.shrink(),
          ],
        ),),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(const CreateUser());
          },
          child: const Icon(Icons.add),
        ));
  }
}