import 'package:flutter/material.dart';
import 'package:hotel_wave/core/functions/routing.dart';
import 'package:hotel_wave/core/utils/app_text_styles.dart';
import 'package:hotel_wave/features/models/restaurant_model.dart';
import 'package:hotel_wave/features/traveler/booking/view/restuarent_details_view.dart';
import 'package:hotel_wave/features/traveler/home/widgets/resturent_item.dart';

class NearByRestuarent extends StatelessWidget {
  const NearByRestuarent({
    super.key,
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
                child: InkWell(
                  onTap: () {
                    navigateTo(context, RestuarentDetailView(model: item));
                  },
                  child: ResturentItem(
                    imageUrl: item.cover ?? '',
                    name: item.name ?? '',
                    location: item.address ?? '',
                    rating: item.rating.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

List<RestuarentModel> items = [
  RestuarentModel(
    address: 'cairo',
    cover:
        'https://bsmedia.business-standard.com/_media/bs/img/article/2023-09/14/full/1694673859-4182.jpeg?im=FeatureCrop,size=(826,465)',
    name: 'Hadr Moot',
    rating: 5,
    reviews: [],
    contactNumber: '01260131301',
    id: '13',
  ),
  RestuarentModel(
    address: 'cairo',
    cover:
        'https://bsmedia.business-standard.com/_media/bs/img/article/2023-09/14/full/1694673859-4182.jpeg?im=FeatureCrop,size=(826,465)',
    name: 'Hadr Moot',
    rating: 5,
    reviews: [],
    contactNumber: '01260131301',
    id: '14',
  ),
  RestuarentModel(
    address: 'cairo',
    cover:
        'https://bsmedia.business-standard.com/_media/bs/img/article/2023-09/14/full/1694673859-4182.jpeg?im=FeatureCrop,size=(826,465)',
    name: 'Hadr Moot',
    rating: 5,
    reviews: [],
    contactNumber: '01260131301',
    id: '15',
  ),
];
