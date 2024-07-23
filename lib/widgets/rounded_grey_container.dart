// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:nosh_assignment/generated/l10n.dart';
//
// class RoundedGreyContainer extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String buttonText;
//   final VoidCallback onButtonPressed;
//
//   const RoundedGreyContainer({
//     required this.imageUrl,
//     required this.title,
//     required this.buttonText,
//     required this.onButtonPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 300,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 6,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ValueListenableBuilder(
//               valueListenable:Hive.box('favorites').listenable(),
//               //final isFavorite = box.get(index) !=null;
//               builder:(context, box, child){
//                 return Container(
//                   height: 180,
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(imageUrl, fit: BoxFit.cover),
//                         Positioned(
//                             right: 10,
//                             bottom: 10,
//                             child: GestureDetector(
//
//                               onPressed: () async{
//                                 await box.put(index, dishName);
//                                 const snackBar=Snackbar(
//                                   content : Text('Added Successfully'),
//                                 );
//                                 ScaffoldMessenger.of(context).showSnackbar(snackBar);
//                               },
//                               child: Icon(
//                                 isFavorite? Icons.favorite_border : Icons.favorite_border,
//
//                               ),
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 children: [
//                   const Icon(Icons.timer),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(LanguageTranslation.current.minutes),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   Container(
//                     width: 10,
//                     height: 10,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.green,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Text(LanguageTranslation.current.vegetarian),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//               child: Row(
//                 children: List.generate(5, (index) {
//                   return const Icon(
//                     Icons.star,
//                     size: 20,
//                     color: Colors.grey,
//                   );
//                 }),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nosh_assignment/generated/l10n.dart';

class RoundedGreyContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final int index; // Assuming you need an index to track the item

  const RoundedGreyContainer({
    required this.imageUrl,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
    required this.index,
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
            ValueListenableBuilder(
              valueListenable: Hive.box('favorites').listenable(),
              builder: (context, Box box, child) {
                bool isFavorite = box.get(index) != null;

                return Container(
                  height: 180,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(imageUrl, fit: BoxFit.cover),
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: GestureDetector(
                            onTap: () async {
                              if (isFavorite) {
                                await box.delete(index);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Removed from favorites'),
                                  ),
                                );
                              } else {
                                await box.put(index, title); // Assuming you want to store the title
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added to favorites'),
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
                  const SizedBox(width: 10),
                  Text(LanguageTranslation.current.minutes),
                  const SizedBox(width: 30),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 10),
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
