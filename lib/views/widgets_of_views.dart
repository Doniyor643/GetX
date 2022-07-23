
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/update_controller.dart';
import '../model/post_model.dart';
import '../pages/update_page.dart';


final controller = Get.put(HomeController());
final updateController = Get.put(UpdateController());

Widget itemOfPost(Post post){
  return Card(
    child: Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context){
              controller.apiPostDelete(post).then((value) => {
                if(value) controller.apiPostList().whenComplete(() => {
                  print("Deleted")
                }),
              });
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UpdateUser(post: post,)));
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.drive_file_rename_outline,
            label: 'Rename',
          ),
        ],
      ),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),),
    ),
  );
}