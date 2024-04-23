import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hotel_wave/core/constants/constant.dart';
import 'package:hotel_wave/core/constants/dummy.dart';
import 'package:hotel_wave/core/functions/routing.dart';
import 'package:hotel_wave/core/utils/colors.dart';
import 'package:hotel_wave/core/widgets/custom_button.dart';
import 'package:hotel_wave/features/models/hotel_model/hotel_model.dart';
import 'package:hotel_wave/features/traveler/booking/view/hotel_booking_view.dart';
import 'package:hotel_wave/features/traveler/booking/widgets/detail_info.dart';
import 'package:hotel_wave/features/traveler/booking/widgets/facility_item.dart';
import 'package:hotel_wave/features/traveler/booking/widgets/image_container.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.model,
  });
  final HotelModel model;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      bottomNavigationBar: (FirebaseAuth.instance.currentUser?.photoURL != '0')
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                color: AppColors.redColor,
                text: 'Delete Hotel',
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('hotels')
                      .doc(model.id)
                      .delete();
                  Navigator.pop(context);
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                text: 'Book Now',
                onTap: () {
                  navigateTo(
                      context,
                      HotelBookingView(
                        hotel: model,
                      ));
                },
              ),
            ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainer(
                model: model,
              ),
              const Gap(10),
              DetailInfo(
                title: model.name ?? '',
                rating: model.rating.toString(),
                reviews: model.reviews!.length.toString(),
                price: model.rooms!.first.pricePerNight.toString(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Facilities',
                  style: nunito16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(10),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: facilities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FacilityItem(svgPath: facilities[index]),
                      );
                    },
                  ),
                ),
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
                  model.description ?? '',
                  style: nunito14,
                ),
              ),
              const Gap(10),
            ],
          )),
    );
  }
}
