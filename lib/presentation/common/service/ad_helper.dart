import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9961259405275341/2062510499';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9961259405275341/2256584634';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  // static final BannerAdListener bannerAdListener = BannerAdListener(
  //   onAdLoaded: (ad) => debugPrint("Ad loaded."),
  //   onAdFailedToLoad: (ad, error) {
  //     ad.dispose();
  //     debugPrint("Ad failed to load: $error");
  //   },
  //   onAdOpened: (ad) => debugPrint("Ad opened."),
  //   onAdClosed: (ad) => debugPrint("Ad closed."),
  // );

  // BannerAd? createBannerAd() {
  //   BannerAd? banner = BannerAd(
  //       size: AdSize.fullBanner,
  //       adUnitId: bannerAdUnitId,
  //       listener: bannerAdListener,
  //       request: const AdRequest())
  //     ..load();
  //   return banner;
  // }

  // InterstitialAd? createInterstitialAd() {
  //   InterstitialAd? _interstitialAd;
  //   InterstitialAd.load(
  //     adUnitId: bannerAdUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) => _interstitialAd = ad,
  //       onAdFailedToLoad: (LoadAdError error) => _interstitialAd = null,
  //     ),
  //   );
  //   return _interstitialAd;
  // }

  // void showInterstitialAd(InterstitialAd? interstitialAd) {
  //   if (interstitialAd != null) {
  //     interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdDismissedFullScreenContent: (ad) {
  //         ad.dispose();
  //         createInterstitialAd();
  //       },
  //       onAdFailedToShowFullScreenContent: (ad, error) {
  //         ad.dispose();
  //         createInterstitialAd();
  //       },
  //     );
  //     interstitialAd.show();
  //     interstitialAd = null;
  //   }
  // }
}
