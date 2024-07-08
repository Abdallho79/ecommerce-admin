class AppLink {
  static const String server = "http://10.0.2.2/coursephp/ecommerce/admin";
  // Image
  static const String imageststatic =
      "http://10.0.2.2/coursephp/ecommerce/upload";
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //Auth
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static const String signup = "$server/Auth/signup.php";
  static const String verifycodesignup = "$server/Auth/veridycode.php";
  static const String login = "$server/Auth/login.php";
  static const String resend = "$server/Auth/resend.php";
  static const String checkemail = "$server/Auth/forgetpassword/cheakemail.php";
  static const String verifycodefprgetpassword =
      "$server/Auth/forgetpassword/verifycode.php";
  static const String changepassword =
      "$server/Auth/forgetpassword/ressetpassword.php";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Home
  static const String homepage = "$server/home.php";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Orders
  static const String pindingfolder = "$server/orders/pinding";
  static const String pindingvieworder = "$pindingfolder/view.php";
  static const String approveorders = "$pindingfolder/approve.php";

  static const String preparefolder = "$server/orders/prepare";
  static const String prepareorders = "$preparefolder/prepare.php";
  static const String doneprepareorders = "$preparefolder/doneprepare.php";
  static const String preparevieworders = "$preparefolder/view.php";

  static const String archiveorders = "$server/orders/archive.php";
  static const String detailsorders = "$server/orders/details.php";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Categorires
  static const String catadd = "$server/categories/add.php";
  static const String catedit = "$server/categories/edit.php";
  static const String catdelete = "$server/categories/delete.php";
  static const String catview = "$server/categories/view.php";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Items
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";
  static const String itemsview = "$server/items/view.php";
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
