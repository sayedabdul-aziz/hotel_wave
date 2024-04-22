import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hotel_wave/core/constants/constant.dart';
import 'package:hotel_wave/core/functions/routing.dart';
import 'package:hotel_wave/core/widgets/custom_back_action.dart';
import 'package:hotel_wave/core/widgets/custom_button.dart';
import 'package:hotel_wave/features/models/restaurant_model.dart';
import 'package:hotel_wave/features/traveler/booking/view/restu_booking_view.dart';
import 'package:hotel_wave/features/traveler/booking/widgets/detail_info.dart';

class RestuarentDetailView extends StatelessWidget {
  const RestuarentDetailView({
    super.key,
    required this.model,
  });
  final RestuarentModel model;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      child: Image.network(
                        model.cover ?? '',
                        scale: 4,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Image.asset('assets/logo.png');
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(top: 40, left: 35, child: CustomBackAction()),
            ],
          ),
          const Gap(20),
          DetailInfo(
            title: model.name ?? '',
            rating: model.rating.toString(),
            reviews: model.reviews!.length.toString(),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Description',
              style: nunito16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'saldkjas; as;d;asd ;askdasd' ?? '',
              style: nunito14,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              text: 'Book Now',
              onTap: () {
                navigateTo(
                    context,
                    RestuarentBookingView(
                      restuarentModel: model,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
