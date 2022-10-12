import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/main/myCard.dart';
import 'package:weather_app/presentation/main/my_list.dart';
import 'package:weather_app/presentation/resources/assets_maneger.dart';
import 'package:weather_app/provider/provider.dart';

import '../resources/color_maneger.dart';
import '../resources/responsive.dart';
import '../resources/strings_maneger.dart';
import '../resources/value_maneger.dart';
import 'my_chart.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, val, child) {
        return Scaffold(
          body: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: responsive.responsiveHigh(context, .35),
                    width: responsive.responsiveHigh(context, 1),
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              ColorManager.lightBlack, BlendMode.darken),
                          image: const AssetImage(ImageAssets.cloudInBlue),
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: AppPadding.p8,
                              left: AppPadding.p20,
                              right: AppPadding.p20),
                          child: TextField(
                            onChanged: (value) {
                              val.city = value;
                            },
                            onSubmitted: (value) {
                              val.getCurrentWeatherDate();
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: ColorManager.white,
                              ),
                              hintStyle: Theme.of(context).textTheme.titleMedium,
                              hintText: AppStrings.search,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: ColorManager.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: responsive.sHeight(context) * .01,
                        ),
                        const MyCard(),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Text(
                          'other city'.toUpperCase(),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const MyList(),
                        const SizedBox(
                          height: AppSize.s12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'forcast next 5 days'.toUpperCase(),
                              style:
                                  Theme.of(context).textTheme.headline6!.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                            ),
                            const Icon(
                              Icons.next_plan_outlined,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        const MyChart(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
