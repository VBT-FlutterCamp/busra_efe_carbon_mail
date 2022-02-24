import 'package:flutter/material.dart';
import 'package:hm_carbon_mail/core/constants/app_color.dart';
import 'package:hm_carbon_mail/core/constants/app_text.dart';
import 'package:hm_carbon_mail/feature/httpService/model/mail_model.dart';
import 'package:hm_carbon_mail/feature/httpService/service/mail_service.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  MailService _mailService = MailService();
  List<MailModel>? _mailModel;
  bool isLoading = false;

  int _selectedIndex = 0;

  Future<void> init() async {
    _mailModel = await _mailService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().textColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(children: [
          mainTitle(context),
          rowInfo(context),
          Expanded(
              child: isLoading
                  ? mainList()
                  : const SizedBox(
                      height: 10,
                      child: Center(child: CircularProgressIndicator()))),
        ]),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Padding mainTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, context.dynamicHeight(0.05),
          context.dynamicWidth(0.4), context.dynamicHeight(0.03)),
      child: Text(
        AppText().keepTitle,
        style: context.textTheme.headline4?.copyWith(
            color: AppColor().keepTextColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row rowInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Subscriptions (${_mailModel?.length})',
          style: context.textTheme.bodyText1?.copyWith(
              color: AppColor().keepTextColor, fontWeight: FontWeight.bold),
        ),
        Container(
          width: context.dynamicWidth(0.3),
          height: context.dynamicHeight(0.05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(context.lowRadius),
            color: AppColor().cleanBack,
          ),
          child: Center(
            child: Text(
              AppText().cleaned,
              style: context.textTheme.bodyText1?.copyWith(
                  color: AppColor().keepTextColor, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  ListView mainList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _mailModel?.length,
        itemBuilder: (BuildContext context, int index) {
          return cardItem(index, context);
        });
  }

  Card cardItem(int index, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _mailModel?[index].title ?? '',
          style: context.textTheme.bodyLarge,
        ),
        leading: Container(
          width: context.dynamicWidth(0.07),
          height: context.dynamicHeight(0.05),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(context.normalRadius),
            color: AppColor().cleanBack,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: context.lowValue),
            child: Text(
              _mailModel?[index].id.toString() ?? '',
              style: context.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: AppColor().homeBlue,
      selectedItemColor: AppColor().homeBlue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'School',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
