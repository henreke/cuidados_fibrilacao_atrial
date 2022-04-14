import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String msg;
  const ChatTile({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            msg,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
