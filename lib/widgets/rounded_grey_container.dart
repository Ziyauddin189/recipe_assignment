import 'package:flutter/material.dart';
import 'package:nosh_assignment/generated/l10n.dart';

class RoundedGreyContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const RoundedGreyContainer({
    required this.imageUrl,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(imageUrl, fit: BoxFit.cover),
                    const Positioned(
                        right: 10,
                        bottom: 10,
                        child: Icon(Icons.favorite_border)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.timer),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(LanguageTranslation.current.minutes),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(LanguageTranslation.current.vegetarian),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.grey,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
