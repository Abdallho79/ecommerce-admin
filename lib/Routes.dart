import 'package:admin/view/screen/Home_Screen.dart';
import 'package:admin/view/screen/categories/addCat_Screen.dart';
import 'package:admin/view/screen/categories/editCat_Screen.dart';
import 'package:admin/view/screen/categories/viewCat_Screen.dart';
import 'package:admin/view/screen/items/add_Screen.dart';
import 'package:admin/view/screen/items/edit_Screen.dart';
import 'package:admin/view/screen/items/view_Screen.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/bending.dart';
import 'package:admin/view/screen/orders/ordersdetails.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:admin/Test.dart';
import 'package:admin/core/Constant/Routes_Const.dart';
import 'package:admin/core/Middleware/MyMiddleWare.dart';
import 'package:admin/view/screen/orders/Orders_Screen.dart';
import 'package:admin/view/screen/Language_Screen.dart';
import 'package:admin/view/screen/OnBoarding_Screen.dart';
import 'package:admin/view/screen/auth/Login_Screen.dart';
import 'package:admin/view/screen/auth/forgetpassword/Changepssword_Screen.dart';
import 'package:admin/view/screen/auth/forgetpassword/ForgetPAsswordSuccess_Screen.dart';
import 'package:admin/view/screen/auth/forgetpassword/ForgetPasswordEmail_Screen.dart';
import 'package:admin/view/screen/auth/forgetpassword/ForgetPasswordVerifyCode_Screen.dart';
import 'package:admin/view/screen/auth/signup/SignUpSuccess_Screen.dart';
import 'package:admin/view/screen/auth/signup/SignUp_Screen.dart';
import 'package:admin/view/screen/auth/signup/VerifyCodeSignUp_Screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: "/",
      page: () => const LanguageScreen(),
      middlewares: [MyMiddaleWare()]),
  GetPage(name: AppRouts.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRouts.logIn, page: () => const LoginScreen()),
  GetPage(name: AppRouts.signUp, page: () => const SignUpScreen()),
  GetPage(name: AppRouts.home, page: () => const HomeScreen()),
  GetPage(
      name: AppRouts.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpScreen()),
  GetPage(
      name: AppRouts.verifyCodeForgetPassword,
      page: () => const VerifyCodeForgetPaswordScreen()),
  GetPage(name: AppRouts.successSignUp, page: () => const SignUpSuccess()),
  GetPage(
      name: AppRouts.forgetPassword,
      page: () => const ForgetPasswordEmailScreen()),
  GetPage(
      name: AppRouts.changePassword, page: () => const ChangePasswordScreen()),
  GetPage(
      name: AppRouts.successChangePassword,
      page: () => const ForgetPasswordSuccessScreen()),
  // GetPage(name: AppRouts.homepage, page: () => const HomeScreen()),
  // GetPage(name: AppRouts.items, page: () => const Items()),
  // GetPage(name: AppRouts.productdetails, page: () => const ProductDetails()),
  // GetPage(name: AppRouts.myFavorite, page: () => const MyFavorite()),
  // GetPage(name: AppRouts.myCart, page: () => const Cart()),
  // GetPage(name: AppRouts.addressview, page: () => const ViewwAddress()),
  // GetPage(name: AppRouts.addressadd, page: () => const AddAddress()),
  // GetPage(name: AppRouts.checkout, page: () => const CheckOut()),
  GetPage(name: AppRouts.orderaarchive, page: () => const ArchiveOrders()),
  GetPage(name: AppRouts.orderscreen, page: () => const OrderScreen()),
  GetPage(name: AppRouts.orderabinding, page: () => const BendingOrders()),
  GetPage(name: AppRouts.ordersdetails, page: () => const OrdersDetails()),
  //categories
  GetPage(name: AppRouts.catview, page: () => const ViewCategriesScreen()),
  GetPage(name: AppRouts.catadd, page: () => const AddCatScreen()),
  GetPage(name: AppRouts.catedit, page: () => const EditCatScreen()),
  //items
  GetPage(name: AppRouts.itemview, page: () => const ViewItemsScreen()),
  GetPage(name: AppRouts.itemadd, page: () => const AddItemsScreen()),
  GetPage(name: AppRouts.itemedit, page: () => const EditItemsScreen()),
];
