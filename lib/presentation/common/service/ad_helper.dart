import 'dart:io';

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
}
