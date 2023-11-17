import 'apiConstants.dart';

final Uri getUserRegister = Uri.parse('${baseUrl}Apicontroller/signUp');
final Uri verifyOTPAPI = Uri.parse('${baseUrl}Apicontroller/otpVerify');
final Uri sendOTPAPI= Uri.parse('${baseUrl}Apicontroller/otpLogin');


final Uri getCountry = Uri.parse('${baseUrl}get_countries');
final Uri getSate= Uri.parse('${baseUrl}get_states');
final Uri getUserLogin= Uri.parse('${baseUrl}login');

final Uri forgotAPI= Uri.parse('${baseUrl}forgot_password');
final Uri homeSliderAPI= Uri.parse('${baseUrl}golf_banners');
final Uri homeCategoryAPI= Uri.parse('${baseUrl}ground_category');
final Uri homeGroundAPI= Uri.parse('${baseUrl}all_ground?category=');

final Uri getPrivacyPolicyAPI = Uri.parse('${baseUrl}policies?slug=');
final Uri changePasswordAPI = Uri.parse('${baseUrl}change_password');
final Uri getProfileApi = Uri.parse('${baseUrl}get_profile');
final Uri updateProfileApi = Uri.parse('${baseUrl}update_profile');
final Uri contactSupplierOrClientApi = Uri.parse('${baseUrl}save_inquiry');
final Uri getProductsApi = Uri.parse('${baseUrl}get_home_products');
final Uri fetchProductByFillters = Uri.parse('${baseUrl}fetch_product_by_fillters');
final Uri getCommunity = Uri.parse('${baseUrl}get_community');
final Uri deleteCommunity = Uri.parse('${baseUrl}delete_community');
final Uri getMedia = Uri.parse('${baseUrl}get_media');
final Uri getMediaApi = Uri.parse('${baseUrl}get_media');
final Uri UpdatePurchesProducttt = Uri.parse('${baseUrl}product_update');

