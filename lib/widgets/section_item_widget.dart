import 'package:flutter/material.dart';
import 'package:safe_form/models/section.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({Key? key, required this.section, required this.onTap})
      : super(key: key);
  final Section section;
  final Function(Section) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(section),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: 70,
        padding: const EdgeInsets.symmetric(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              width: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 3,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: Colors.black38,
            )
          ],
        ),
      ),
    );
  }
}
