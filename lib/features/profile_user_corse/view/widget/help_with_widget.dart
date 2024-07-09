import 'package:flutter/material.dart';

class HelpWithWidget extends StatelessWidget {
  const HelpWithWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      height: 44,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            width: 200,
          ),
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) {
          //         return UiUxDesignerView(
          //           skillSharingModel: skillSharingModel,
          //         );
          //       }));
          //     },
          //     icon: const Icon(Icons.arrow_forward_ios_sharp))
        ],
      ),
    );
  }
}
