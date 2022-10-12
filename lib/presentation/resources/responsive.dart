import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Responsive responsive = Responsive();

class Responsive{

  MediaQueryData mediaQuery(BuildContext context)=> MediaQuery.of(context);
  double textScale(BuildContext context)=> MediaQuery.textScaleFactorOf(context);
  double sHeight(BuildContext context)=> mediaQuery(context).size.height;
  double sWidth(BuildContext context)=> mediaQuery(context).size.width;

  final SizedBox sizedBoxH20 = const SizedBox(height: 20,);
  final SizedBox sizedBoxH10 = const SizedBox(height: 10,);
  final SizedBox sizedBoxH5 = const SizedBox(height: 5,);
  final SizedBox sizedBoxH8 = const SizedBox(height: 8,);
  final SizedBox sizedBoxW5 = const SizedBox(width: 5,);
  final SizedBox sizedBoxW10 = const SizedBox(width: 10,);
  final SizedBox sizedBoxW80 = const SizedBox(width: 80,);
  final SizedBox sizedBoxW15 = const SizedBox(width: 15,);
  final SizedBox sizedBoxW50 = const SizedBox(width: 50,);



  final Expanded expandedSizedBox = const Expanded(child: SizedBox());
  final Expanded expandedSizedBox2 = const Expanded(flex: 2, child: SizedBox());
  final Expanded expandedSizedBox3 = const Expanded(flex: 3, child: SizedBox());
  final Expanded expandedSizedBox5 = const Expanded(flex: 5, child: SizedBox());
  final EdgeInsets paddingHoriz20 = const EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets paddingHoriz10 = const EdgeInsets.symmetric(horizontal: 10);
  final EdgeInsets paddingVertical5 = const EdgeInsets.symmetric(vertical: 15);


  bool isPortrait(BuildContext context)
  => (
      sHeight(context) > sWidth(context)
          || mediaQuery(context).orientation == Orientation.portrait
  );


  double responsiveHigh (BuildContext context ,double ratio){
    return isPortrait(context) ? sHeight(context) *ratio
        : sWidth(context) *ratio;
  }

  double responsiveWidth (BuildContext context ,double ratio){
    return isPortrait(context) ? sWidth(context) *ratio
        : sHeight(context) *ratio;
  }


  double appbarTopHigh(AppBar appBar ,BuildContext context)
  => appBar.preferredSize.height + mediaQuery(context).padding.top;

  double screenPadding(BuildContext context)
  => mediaQuery(context).padding.top + mediaQuery(context).padding.bottom;

  double stepperAppBarH(BuildContext context)
  => sHeight(context)*.08;

}