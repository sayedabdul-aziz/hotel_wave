import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_wave/core/constants/constant.dart';
import 'package:hotel_wave/core/functions/routing.dart';
import 'package:hotel_wave/features/traveler/home/view/search_view.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 109,
                child: TextField(
                  style: TextStyle(color: kAccentColor),
                  decoration: InputDecoration(
                    hintText: 'Search Hotel',
                    hintStyle: nunitoRegular12.copyWith(color: kAccentColor),
                  ),
                ),
              ),
              const SizedBox(width: 17),
              InkWell(
                onTap: () {
                  navigateTo(context, const SearchView());
                  // FirebaseFirestore.instance
                  //     .collection("hotels")
                  //     .doc(DateTime.now().toString())
                  //     .set({
                  //   "id": DateTime.now().toString(),
                  //   "name": "Afandina Hotel",
                  //   "location": "10 Abbas St, Cairo",
                  //   "contactNumber": "+1234567890",
                  //   "email": "info@gmail.com",
                  //   "cover": "https://example.com/cover.jpg",
                  //   "description": "Luxury hotel with stunning views",
                  //   "images": [
                  //     "https://example.com/image1.jpg",
                  //     "https://example.com/image2.jpg",
                  //     "https://example.com/image3.jpg"
                  //   ],
                  //   "rating": 4.5,
                  //   "rooms": [
                  //     {
                  //       "id": "101",
                  //       "type": "Single Room",
                  //       "description":
                  //           "Cozy single room with a comfortable bed",
                  //       "amenities": ["Wi-Fi", "TV", "Air Conditioning"],
                  //       "pricePerNight": 100.0
                  //     },
                  //     {
                  //       "id": "102",
                  //       "type": "Double Room",
                  //       "description":
                  //           "Spacious double room with a king-sized bed",
                  //       "amenities": [
                  //         "Wi-Fi",
                  //         "TV",
                  //         "Air Conditioning",
                  //         "Mini Bar"
                  //       ],
                  //       "pricePerNight": 150.0
                  //     }
                  //   ],
                  //   "reviews": [
                  //     {
                  //       "name": "John Doe",
                  //       "rate": 4.0,
                  //       "comment": "Great experience, friendly staff!"
                  //     },
                  //     {
                  //       "name": "Jane Smith",
                  //       "rate": 5.0,
                  //       "comment":
                  //           "Absolutely loved my stay. Highly recommended!"
                  //     }
                  //   ]
                  // });
                },
                child: Container(
                  height: 44,
                  width: 44,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
