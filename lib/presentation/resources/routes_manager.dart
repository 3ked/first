import 'package:cv_pdf/presentation/common/logic/cubit/Flow/flow_cubit.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/cv_format/cv_format_cubit.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/cv_list/cv_list_cubit.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/cv_theme/cv_theme_cubit.dart';
import 'package:cv_pdf/presentation/common/logic/cubit/drop_down_selected/drop_down_selected_cubit.dart';

import '../../app/di.dart';
import '../screens/app_info_page/app_info_page.dart';
import '../screens/contact_us_page.dart/contact_us_page.dart';
import '../screens/cv_theme_page.dart/cv_theme_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/add_cv_page/add_cv_page.dart';
import '../screens/main_page/main_page.dart';
import '../screens/pdf_viewer_page/pdf_viewer_page.dart';
import 'strings_manager.dart';

class Routes {
  static const String mainRoute = "/";
  static const String addCVRoute = "/addCV";
  static const String pdfViewerRoute = "/pdfViewer";
  static const String cvThemeRoute = "/cvTheme";
  static const String contactUsRoute = "/contactUs";
  static const String appInfoRoute = "/AppInfo";
}

class RouteGenerator {
  final CvListCubit _cvCubit = CvListCubit();
  final CvThemeCubit _cvThemeCubit = CvThemeCubit();
  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _cvCubit,
                  child: const MainPage(),
                ));
      case Routes.addCVRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => CvFormatCubit()),
                    BlocProvider(create: (_) => DropDownSelectedCubit()),
                    BlocProvider.value(
                      value: _cvCubit,
                    ),
                    BlocProvider.value(
                      value: _cvThemeCubit,
                    ),
                  ],
                  child: const AddCvPage(),
                ),
            settings: settings);
      case Routes.pdfViewerRoute:
        return MaterialPageRoute(
          builder: (_) => const PdfViewerPage(),
          settings: settings,
        );

      case Routes.cvThemeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _cvThemeCubit,
                  child: const CvThemePage(),
                ));

      case Routes.contactUsRoute:
        initContactUsModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FlowCubit(),
            child: ContactUsPage(),
          ),
        );
      case Routes.appInfoRoute:
        return MaterialPageRoute(builder: (_) => const AppInfoPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(AppStrings.noRouteFound.tr()),
              ),
              body: Center(
                child: Text(AppStrings.noRouteFound.tr()),
              ),
            ));
  }

  void dispose() {
    _cvCubit.close();
    _cvThemeCubit.close();
  }
}
