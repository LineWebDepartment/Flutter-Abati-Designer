enum APIPath {
  login,
  signUp,
  editUserProfile,
  getVideos,
  getSetting,
  videoDetails,
  myAddresses,
  changePassword,
  myFavorites,
  favorite,
  getCategories,
  getServiceCategories,
  home,
  getDesigners,
  getCelebrities,
  celebrityDetails,
  celebrityServices,
  getServices,
  serviceDetails,
  checkoutBookService,
  checkPromoCodeForBookingService,
  myBookings,
  bookingDetails,
  getCategoryDetails,
  productDetails,
  addToCart,
  myCart,
  removeFromCart,
  changeQuantity,
  addNewAddress,
  deleteAddress,
  editAddress,
  checkoutPage,
  checkPromoCodeForProducts,
  storeOrder,
  myOrders,
  orderDetails,
  services,
  contactUs,
  bestSeller,
  newCollection,
  bookService,
  forgotPassword,
  designerDetails,
  designerRates,
  search,
  designerStatistics,
  designerOrders,
  changeOrderStatusFromDesignerApp

}

class APIPathHelper {
  static String getValue(APIPath path) {
    switch (path) {
      case APIPath.login:
        return "login";
      case APIPath.signUp:
        return "signUp";
        case APIPath.editUserProfile:
        return "editUserProfile";
        case APIPath.getVideos:
        return "getVideos";
        case APIPath.getSetting:
        return "getSetting";
        case APIPath.videoDetails:
        return "videoDetails";
        case APIPath.myAddresses:
        return "myAddresses";
        case APIPath.changePassword:
        return "changePassword";
        case APIPath.myFavorites:
        return "myFavorites";
        case APIPath.favorite:
        return "favorite";
        case APIPath.getCategories:
        return "getCategories";
        case APIPath.getServiceCategories:
        return "getServiceCategories";
        case APIPath.home:
        return "home";
        case APIPath.getDesigners:
        return "getDesigners";
        case APIPath.getCelebrities:
        return "getCelebrities";
        case APIPath.celebrityDetails:
        return "celebrityDetails";
        case APIPath.celebrityServices:
        return "celebrityServices";
        case APIPath.getServices:
        return "getServices";
        case APIPath.serviceDetails:
        return "serviceDetails";
        case APIPath.checkoutBookService:
        return "checkoutBookService";
        case APIPath.checkPromoCodeForBookingService:
        return "checkPromoCodeForBookingService";
        case APIPath.myBookings:
        return "myBookings";
        case APIPath.bookingDetails:
        return "bookingDetails";
        case APIPath.getCategoryDetails:
        return "getCategoryDetails";
        case APIPath.productDetails:
        return "productDetails";
        case APIPath.addToCart:
        return "addToCart";
        case APIPath.myCart:
        return "myCart";
        case APIPath.removeFromCart:
        return "removeFromCart";
        case APIPath.changeQuantity:
        return "changeQuantity";
        case APIPath.addNewAddress:
        return "addNewAddress";
        case APIPath.deleteAddress:
        return "deleteAddress";
        case APIPath.editAddress:
        return "editAddress";
        case APIPath.checkoutPage:
        return "checkoutPage";
        case APIPath.checkPromoCodeForProducts:
        return "checkPromoCodeForProducts";
        case APIPath.storeOrder:
        return "storeOrder";
        case APIPath.myOrders:
        return "myOrders";
        case APIPath.orderDetails:
        return "orderDetails";
        case APIPath.services:
        return "services";
        case APIPath.contactUs:
        return "contactUs";
        case APIPath.bestSeller:
        return "bestSeller";
        case APIPath.newCollection:
        return "newCollection";
        case APIPath.bookService:
        return "bookService";
        case APIPath.forgotPassword:
        return "forgotPassword";
        case APIPath.designerDetails:
        return "designerDetails";
        case APIPath.designerRates:
        return "designerRates";
        case APIPath.search:
        return "search";
        case APIPath.designerStatistics:
        return "designerStatistics";
        case APIPath.designerOrders:
          return "designerOrders";
        case APIPath.changeOrderStatusFromDesignerApp:
        return "changeOrderStatusFromDesignerApp";
      default:
        return "";
    }
  }
}
