import 'package:flutter/material.dart';

class ServiceCategoryIcon extends StatelessWidget {
  ServiceCategoryIcon({Key? key, required this.iconpath, required this.title})
      : super(key: key);

  String iconpath;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0XFFFFD700),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                //  backgroundImage: AssetImage(iconpath!),
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(iconpath),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
