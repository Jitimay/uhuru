import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Vending extends StatelessWidget {
  final List<Map<String, String>> imagesWithText = [
    {'image': 'images/book1.jpg', 'text': 'Item 1'},
    {'image': 'images/book2.jpg', 'text': 'Item 2'},
    {'image': 'images/book3.jpg', 'text': 'Item 3'},
    {'image': 'images/book4.jpg', 'text': 'Item 4'},
    {'image': 'images/book5.jpg', 'text': 'Item 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "New Books",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,  // Consistent text color
            ),
          ),
          const SizedBox(height: 10),  // Adjust spacing for consistency
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 0.5,  // Show two images at a time
              enableInfiniteScroll: true,
            ),
            items: imagesWithText.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Image clicked: ${item['image']}");
                          // You can navigate or perform any action here
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 150,  // Set height for the image container
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(item['image']!),
                              fit: BoxFit.cover,  // Make the image fit the container
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),  // Space between image and text
                      Text(
                        item['text']!,
                        style: const TextStyle(
                          color: Colors.white,  // Consistent text color
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
