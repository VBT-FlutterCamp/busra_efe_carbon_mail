import 'package:flutter/material.dart';
import 'package:hm_carbon_mail/core/constants/app_color.dart';
import 'package:hm_carbon_mail/core/constants/app_text.dart';
import 'package:hm_carbon_mail/feature/home/home_view.dart';
import 'package:kartal/kartal.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox.expand(
              child: backgroundImage(),
            ),
            Padding(
              padding: context.paddingMedium,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    title(context),
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: startedButton(context),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  FittedBox backgroundImage() {
    return FittedBox(
        fit: BoxFit.fill, child: Image.asset('assets/images/background.png'));
  }

  Expanded title(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Column(
        children: [
          Text(AppText().firsTitle,
              textAlign: TextAlign.center,
              style: context.textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColor().textColor)),
          const SizedBox(
            height: 20,
          ),
          subtitle(context),
        ],
      ),
    );
  }

  Column subtitle(BuildContext context) {
    return Column(
      children: [
        Text(
          AppText().secondTitle,
          style: context.textTheme.headline6
              ?.copyWith(color: AppColor().textColor.withOpacity(0.6)),
        ),
        Text(
          AppText().secondSubtitle,
          style: context.textTheme.headline6
              ?.copyWith(color: AppColor().textColor),
        ),
      ],
    );
  }

  SizedBox startedButton(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      height: context.dynamicHeight(0.08),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: context.normalBorderRadius),
            primary: AppColor().buttonColor,
            onPrimary: AppColor().textColor,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeView()));
          },
          child: buttonContent(context)),
    );
  }

  Row buttonContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppText().buttonName,
          style: context.textTheme.headline6
              ?.copyWith(color: AppColor().textColor.withOpacity(0.8)),
        ),
        const Icon(Icons.keyboard_arrow_right)
      ],
    );
  }
}
