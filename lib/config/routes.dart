import 'package:get/get.dart';
import 'package:getx_app/drawer/item.dart';
import 'package:getx_app/drawer/shop/shop.dart';
import 'package:getx_app/start/home_screen.dart';
import 'package:getx_app/start/splash_screen.dart';

appRoutes() => [
  GetPage(
        name: '/splash',
        page: () => const SplashScreen(),
        transition: Transition.leftToRight,
        
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
         GetPage(
        name: '/shop',
        page: () => Shop(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
           GetPage(
        name: '/item',
        page: () => Item(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
     
    ];

class Routes extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
