
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/create_controller.dart';
import '../model/post_model.dart';


class UpdateUser extends StatefulWidget {
  final Post? post;
  const UpdateUser({required this.post,Key? key}) : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final controller = Get.put(CreateController());

  @override
  void initState() {
    super.initState();
    titleController.text = widget.post!.title;
    bodyController.text = widget.post!.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creation User'),
        backgroundColor: Colors.white,
      ),
      body: getBody(),
    );
  }

  Widget getBody(){
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        const SizedBox(height: 30,),
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
              hintText: "title"
          ),
        ),
        const SizedBox(height: 30,),
        TextField(
          controller: bodyController,
          decoration: const InputDecoration(
              hintText: "body"
          ),
        ),
        const SizedBox(height: 40,),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){

              controller.apiPostCreate(
                  Post(userId: 1,body: bodyController.text,title: titleController.text)
              );
            },
            child: const Center(child: Text("Done"),),
          ),
        )
      ],
    );
  }

}