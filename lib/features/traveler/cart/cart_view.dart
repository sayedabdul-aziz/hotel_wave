import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hotel_wave/core/utils/app_text_styles.dart';
import 'package:hotel_wave/core/utils/colors.dart';
import 'package:hotel_wave/core/widgets/custom_button.dart';
import 'package:hotel_wave/features/traveler/home/widgets/resturent_item.dart';

class CustomerCartView extends StatefulWidget {
  const CustomerCartView({super.key});

  @override
  State<CustomerCartView> createState() => _CustomerCartViewState();
}

class _CustomerCartViewState extends State<CustomerCartView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('hotel-booking')
              .where('userId', isEqualTo: user!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //  else if (snapshot.data!) {
            //   return Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           Icons.favorite_outlined,
            //           size: 150,
            //           color: AppColors.shadeColor,
            //         ),
            //         const Gap(20),
            //         Text(
            //           'No Items in your favourite\nExplore and add to your favourite',
            //           textAlign: TextAlign.center,
            //           style: getbodyStyle(
            //             fontSize: 16,
            //             color: AppColors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }
            else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data!.docs[index].data();
                    return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => CustomerFoodDetailsView(
                          //       id: item[keyy[index]]['name']),
                          // ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: AppColors.bottomBarColor,
                              border: Border.all(color: AppColors.shadeColor)),
                          child: Column(
                            children: [
                              ResturentItem(
                                imageUrl: item['hotel']['cover'],
                                name: item['hotel']['name'],
                                price: item['totalPrice'].toString(),
                                rating: (item['hotel']['rating']).toString(),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Text(
                                    'Check In: ',
                                    style:
                                        getTitleStyle(color: AppColors.primary),
                                  ),
                                  Text(
                                    item['checkIn'].toString().split(' ')[0],
                                    style: getbodyStyle(),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Row(
                                children: [
                                  Text(
                                    'Check Out: ',
                                    style:
                                        getTitleStyle(color: AppColors.primary),
                                  ),
                                  Text(
                                    item['checkOut'].toString().split(' ')[0],
                                    style: getbodyStyle(),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Row(
                                children: [
                                  Text(
                                    'No. of gests: ',
                                    style:
                                        getTitleStyle(color: AppColors.primary),
                                  ),
                                  Text(
                                    ' ${item['numberOfGuests'].toString()}',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      onTap: () {
                                        cancelRoom(
                                            snapshot.data!.docs[index].id);
                                      },
                                      height: 40,
                                      color: AppColors.redColor,
                                      text: 'Cancel Room',
                                    ),
                                  ),
                                  const Gap(20),
                                  Text(
                                    ' ${item['totalPrice'].toString()} \$',
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) => const Gap(15),
                ),
              );
            }
          }),
    );
  }

  cancelRoom(id) {
    FirebaseFirestore.instance
        .collection('hotel-booking')
        .doc(id)
        .set({'status': 2}, SetOptions(merge: true));
  }
}
