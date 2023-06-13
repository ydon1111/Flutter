import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 유저 입력값
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "할 일 추가"),
            ),

            // 저장,취소 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //저장 버튼
                MyButton(text: "저장", onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),

                //취소 버튼
                MyButton(text: "취소", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
