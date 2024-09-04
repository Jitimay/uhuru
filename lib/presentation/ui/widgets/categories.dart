import 'package:flutter/material.dart';
import 'package:uhuru_app/presentation/ui/widgets/BD.dart';
import 'package:uhuru_app/presentation/ui/widgets/entrepreneur.dart';
import 'package:uhuru_app/presentation/ui/widgets/hisory.dart';
import 'package:uhuru_app/presentation/ui/widgets/science.dart';
import 'package:uhuru_app/presentation/ui/widgets/science_fiction.dart';

class Category extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"name": "Science-Fiction", "image": "images/science_fiction.jpeg", "page": ScienceFiction()},
    {"name": "Science", "image": "images/science.jpeg", "page": Science()},
    {"name": "History", "image": "images/history.jpeg", "page": History()},
    {"name": "Entrepreneur", "image": "images/entrepreneur.jpeg", "page": Entrepreneur()},
    {"name": "BD", "image": "images/bd.jpeg", "page": Bd()},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shop By Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to a "See All" page or do something else
                },
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 120, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categories[index]['page'],
                    ),
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CircleAvatar(
                        radius: 40, // Adjust the size as needed
                        backgroundImage: AssetImage(categories[index]['image']),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(categories[index]['name']),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
