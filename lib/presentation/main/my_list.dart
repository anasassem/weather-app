import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/provider.dart';

import '../../domain/models/current_weather_data.dart';
import '../resources/assets_maneger.dart';
import '../resources/responsive.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (BuildContext context, val, Widget? child) => SizedBox(
        height: responsive.responsiveHigh(context, .2),
        width: responsive.responsiveHigh(context, 1),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const VerticalDivider(
            color: Colors.transparent,
            width: 5,
          ),
          itemCount: val.dataList.length,
          itemBuilder: (context, index) {
            CurrentWeatherData? data;
            (val.dataList.isNotEmpty)
                ? data = val.dataList[index]
                : data = null;
            return SizedBox(
              width: MediaQuery.of(context).size.width * .37,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        (data != null) ? '${data.name}' : '',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontFamily: 'flutterfonts',
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .09,
                        width: MediaQuery.of(context).size.width * .2,
                        child: LottieBuilder.asset(ImageAssets.cloudAnime),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        (data != null)
                            ? '${(data.main!.temp! - 273.15).round().toString()}\u2103'
                            : '',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontFamily: 'flutterfonts',
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        (data != null) ? '${data.weather![0].description}' : '',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.black45,
                              fontFamily: 'flutterfonts',
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
