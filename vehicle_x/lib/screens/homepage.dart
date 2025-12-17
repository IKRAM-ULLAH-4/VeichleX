// import 'package:flutter/material.dart';
// import 'package:vehicle_x/model/vehicle_model.dart';
// // import 'package:vehicle_x/screens/vehicle_details_screen.dart';
// import 'package:vehicle_x/screens/view_screen.dart';

// class VehicleCard extends StatelessWidget {
//   final Vehicle vehicle;
//   const VehicleCard({super.key, required this.vehicle});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 280,
//       height: 250, // 🔥 MATCHES LIST HEIGHT → NO OVERFLOW
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => VehicleDetailsScreen(vehicle: vehicle),
//             ),
//           );
//         },
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ---------- IMAGE ----------
//               SizedBox(
//                 height: 140,
//                 width: double.infinity,
//                 child: Stack(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(16),
//                       ),
//                       child: Image.network(
//                         vehicle.images.first,
//                         width: double.infinity,
//                         height: 140,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Positioned(
//                       top: 10,
//                       right: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.black87,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           "\$${vehicle.price ~/ 1000}k",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // ---------- CONTENT ----------
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         vehicle.name,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         vehicle.description,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                       ),
//                       const Spacer(),

//                       // ---------- CTA ----------
//                       SizedBox(
//                         width: double.infinity,
//                         height: 18,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) =>
//                                     VehicleDetailsScreen(vehicle: vehicle),
//                               ),
//                             );
//                           },
//                           child: const Text("View Details"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// } 