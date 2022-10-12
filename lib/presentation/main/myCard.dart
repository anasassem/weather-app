import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/resources/assets_maneger.dart';
import 'package:weather_app/presentation/resources/responsive.dart';
import 'package:weather_app/provider/provider.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
        builder: (context, val, child) => SizedBox(
              height: responsive.responsiveHigh(context, .28),
              width: responsive.responsiveHigh(context, 1.8),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: responsive.responsiveWidth(context, 1.95),
                      height: responsive.responsiveHigh(context, 1.1),
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.only(top: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    val.currentWeatherData.name == null
                                        ? const Center(
                                            child: SizedBox(
                                                height: 15,
                                                width: 15,
                                                child:
                                                    CircularProgressIndicator()))
                                        : Center(
                                            child: Text(
                                              '${val.currentWeatherData.name}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                    Center(
                                      child: Text(
                                        DateFormat()
                                            .add_MMMMEEEEd()
                                            .format(DateTime.now()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: <Widget>[
                                        val.currentWeatherData.weather?[0]
                                                    .description ==
                                                null
                                            ? const Center(
                                                child: SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              )
                                            : Text(
                                                '${val.currentWeatherData.weather?[0].description}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 22,
                                                    ),
                                              ),
                                        const SizedBox(height: 15),
                                        Text(
                                          val.currentWeatherData.main?.temp != null
                                              ? "${(val.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103"
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                color: Colors.black45,
                                              ),
                                        ),
                                        Text(
                                          val.currentWeatherData.main?.temp_min !=
                                                      null &&
                                                  val.currentWeatherData.main
                                                          ?.temp_max !=
                                                      null
                                              ? 'min: ${(val.currentWeatherData.main!.temp_min! - 273.15).round().toString()}\u2103 / max: ${(val.currentWeatherData.main!.temp_max! - 273.15).round().toString()}\u2103'
                                              : '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: LottieBuilder.asset(
                                              ImageAssets.cloudAnime),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            val.currentWeatherData.wind?.speed !=
                                                    null
                                                ? 'wind ${val.currentWeatherData.wind!.speed} m/s'
                                                : '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
