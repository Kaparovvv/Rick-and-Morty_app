// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:rick_and_morty_app/commons/text_style.dart';
// import 'package:rick_and_morty_app/screens/characters_screen/character_screen.dart';

// class InfoCharacterScreen extends StatelessWidget {
//   final String? image;
//   final String? name;
//   final String? aliveOrDead;
//   final String? species;
//   final String? gender;
//   final String? description;
//   final String? placeOfBirth;
//   final String? location;

//   const InfoCharacterScreen({
//     Key? key,
//     required this.image,
//     required this.name,
//     required this.aliveOrDead,
//     required this.species,
//     required this.gender,
//     required this.description,
//     required this.placeOfBirth,
//     required this.location,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.2685,
//                 child: ClipRRect(
//                   child: ImageFiltered(
//                     imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//                     child: Image.asset(
//                       image!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 138),
//                   child: Container(
//                     width: 153,
//                     height: 153,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(153),
//                       color: Colors.white,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(7),
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage(image!),
//                         radius: 74,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                     child: Text(name!, style: TextStyleHelper.nameSizeStyle)),
//                 Center(child: CharacterAliveOrDead(alive: aliveOrDead!)),
//                 Text(description!),
//                 Row(
//                   children: [
//                     NameValueWidget(name: 'Пол', value: gender!),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.3147,
//                     ),
//                     NameValueWidget(name: 'Расса', value: species!)
//                   ],
//                 ),
//                 NameValueWidget(name: 'Место рождения', value: placeOfBirth!),
//                 NameValueWidget(name: 'Месторождение', value: location!),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NameValueWidget extends StatelessWidget {
//   final String name;
//   final String value;
//   const NameValueWidget({
//     Key? key,
//     required this.name,
//     required this.value,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           name,
//           style: TextStyleHelper.genderStyle,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyleHelper.nameStyle,
//         ),
//       ],
//     );
//   }
// }
