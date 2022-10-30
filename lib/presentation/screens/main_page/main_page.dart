// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cv_pdf/presentation/common/logic/cubit/cv_list/cv_list_cubit.dart';
import 'package:cv_pdf/presentation/common/service/ad_helper.dart';
import 'package:cv_pdf/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../app/app_prefs.dart';
import 'tab1/settings_tab.dart';
import 'tab2/stepper_tab.dart';
import 'tab3/local_files_tab.dart';
import 'tab4/internal_files_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BannerAd? _banner;
  @override
  void initState() {
    createBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: SafeArea(
          child: Scaffold(
        body: Column(
          children: const [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.settings),
                ),
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.edit),
                ),
                Tab(
                  icon: Icon(Icons.file_download_outlined),
                )
              ],
            ),
            //////////////////////////////////////////////
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // 1 tab
                  SettingsTab(), // setting page
                  // 2 tab
                  StepperTab(),
                  //  3 tab
                  LocalFilesTab(), //  cv files page
                  // 3 tab
                  InternalFilesTab(), // to show the pdf files in the phone memory
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _banner == null
            ? const SizedBox()
            : Container(
                margin: EdgeInsets.only(bottom: AppMargin.m10H),
                height: AppSize.s60H,
                child: AdWidget(ad: _banner!),
              ),
      )),
    );
  }

  Future<void> setList() async {
    var list = await AppPreferences.getListCvFile();
    context.read<CvListCubit>().toggleCVFiles(list);
  }

  void createBannerAd() {
    BannerAd(
            size: AdSize.banner,
            adUnitId: AdHelper.bannerAdUnitId,
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                setState(() {
                  _banner = ad as BannerAd;
                });
                // debugPrint("Ad loaded.");
              },
              onAdFailedToLoad: (ad, error) {
                ad.dispose();
                // debugPrint("Ad failed to load: $error");
              },
              // onAdOpened: (ad) => debugPrint("Ad opened."),
              // onAdClosed: (ad) => debugPrint("Ad closed."),
            ),
            request: const AdRequest())
        .load();
  }
}
