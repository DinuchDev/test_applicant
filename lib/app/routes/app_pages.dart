import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/book_detail/bindings/book_detail_binding.dart';
import '../modules/book_detail/views/book_detail_view.dart';
import '../modules/course_detail/bindings/course_detail_binding.dart';
import '../modules/course_detail/views/course_detail_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/tabbar/bindings/tabbar_binding.dart';
import '../modules/tabbar/views/tabbar_view.dart';
import '../modules/theme_screen/bindings/theme_screen_binding.dart';
import '../modules/theme_screen/views/theme_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABBAR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.TABBAR,
      page: () => TabbarView(),
      binding: TabbarBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.THEME_SCREEN,
      page: () => const ThemeScreenView(),
      binding: ThemeScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAIL,
      page: () => const BookDetailView(),
      binding: BookDetailBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => const CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
  ];
}
