import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/constants/assets.dart';
import 'package:repsoft_assignment_app/screens/select_courier_screen/widgets/location_selector.dart';
import 'package:repsoft_assignment_app/screens/select_courier_screen/widgets/location_status_indicator.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/widgets/sign_in_widgets.dart';
import 'package:repsoft_assignment_app/utils/app_colors.dart';
import 'package:repsoft_assignment_app/utils/app_text_styles.dart';

class SelectCourierScreen extends StatelessWidget {
  const SelectCourierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Select Courier',
          style: AppTextStyles.supermercadoOneTextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.greyTextColor,
              ))
        ],
      ),
      body: SafeArea(
          //Base-Container
          child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Stack(
          children: [
            //Image-container-stack
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          Assets.mapBgImage,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  left: MediaQuery.sizeOf(context).width * 0.075,
                  child: Material(
                    color: Colors.white,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      margin: const EdgeInsets.all(20),
                      height: 171,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Where is it going?',
                            style: AppTextStyles.supermercadoOneTextStyle(
                                color: const Color(0xff424242),
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          //Location Status widget
                          Row(
                            children: [
                              const LocationStatusIndicator(),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  LocationSelector(
                                    label: 'Current location',
                                    labelStyle:
                                        AppTextStyles.ttChocolateTextStyle(
                                            color: AppColors.darkGreenIconColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  LocationSelector(
                                    label: 'Choose recipients location',
                                    labelStyle:
                                        AppTextStyles.ttChocolateTextStyle(
                                            color: const Color(0xff7D7D7D),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Bottom-button
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.08,
              left: 0,
              right: 0,
              child: AuthenticationButton(
                  label: 'Continue', onTap: () {}, isLoading: false),
            )
          ],
        ),
      )),
    );
  }
}
