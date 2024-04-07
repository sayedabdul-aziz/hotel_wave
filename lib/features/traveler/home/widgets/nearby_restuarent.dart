import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_wave/core/utils/app_text_styles.dart';
import 'package:hotel_wave/features/traveler/home/widgets/resturent_item.dart';

class NearByRestuarent extends StatelessWidget {
  final List items;

  const NearByRestuarent({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Nearby Restuarent', style: getTitleStyle()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ResturentItem(
                  imageUrl: item['imageUrl'],
                  name: item['name'],
                  price: item['price'],
                  rating: item['rating'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
