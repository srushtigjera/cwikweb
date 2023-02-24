
import '../models/chat_msg.dart';
import '../models/chat_user_model.dart';
import 'app_images.dart';
import 'app_string.dart';

List<String> navigation = [
  AppString.yourListing,
  AppString.addListing,
  AppString.messages,
  AppString.profile
];

List<String> buttonList = [
  AppString.published,
  AppString.drafts,
  AppString.rented,
];

//List Data
List image = [
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
];
List imageProperty = [
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
  AppImages.homeOne,
  AppImages.homeTwo,
];

List<String> propertyType = [
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
  'Student Hall',
  'Flat Share',
];

List<String> propertyName = [
  'Westwood Student Mews',
  'Red Queen',
  'Westwood Student Mews',
  'Red Queen',
  'Westwood Student Mews',
  'Red Queen',
  'Westwood Student Mews',
  'Red Queen',
];

List<String> propertyArea = [
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
  'University of Warwick',
];

List<String> amenities = [
  'Pets',
  'White Goods',
  'Close to Shops',
  'Concierge',
  'Music Allowed',
  'House Keeping',
  'Gym Location',
  'On site Security',
  'Same Sex',
  'Cable TV',
  'Library Location',
  'Game Room',
  '1st Years Only',
  'Bike Store',
  'Bills Included',
  'Social Community',
  'Wheelchair Access',
  'Car Parking',
  'Wifi Included',
  'PetsPets',
  'Meals Provided',
  'Central Hiding',
  'Laundry Facilities',
];

List<String> propertyRent = [
  '156',
  '250',
  '156',
  '250',
  '156',
  '250',
  '156',
  '250',
];

var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

List<ChatUserModel> chateUserModel = [
  ChatUserModel(userName: 'Srushti', propertyName: 'Red Queen', propertyType: 'Shared Flat', msg: 'Hi Clarissa, thank you for your...', date: '29 Sep', time: '15:20'),
  ChatUserModel(userName: 'Drashti', propertyName: 'Westwood Student Mews', propertyType: 'Private Hall', msg: 'Hi Clarissa, thank you for your...', date: '1 Jan', time: '17:53'),
  ChatUserModel(userName: 'Purvik', propertyName: 'New Bridewell Bristol', propertyType: 'Shared Flat', msg: 'Hi Clarissa, thank you for your...', date: '14 Feb', time: '16:00'),
  ChatUserModel(userName: 'Sahaj', propertyName: 'Newarke Street Leicester', propertyType: 'University Hall', msg: 'Hi Clarissa, thank you for your...', date: '29 Sep', time: '1:45'),
  ChatUserModel(userName: 'Payal', propertyName: 'Red Queen', propertyType: 'Flat Share', msg: 'Hi Clarissa, thank you for your...', date: '5 Apr', time: '5:25'),
  ChatUserModel(userName: 'Ankita', propertyName: 'New Bridewell Bristol', propertyType: 'Shared Flat', msg: 'Hi Clarissa, thank you for your...', date: '29 Sep', time: '7:20'),
  ChatUserModel(userName: 'Anil', propertyName: 'Newarke Street Leicester', propertyType: 'Private Hall', msg: 'Hi Clarissa, thank you for your...', date: '3 Des', time: '9:15'),
  ChatUserModel(userName: 'Rathin', propertyName: 'Westwood Student Mews', propertyType: 'Flat Share', msg: 'Hi Clarissa, thank you for your...', date: '8 Nov', time: '16:22'),
];

List<ChatMassage> chatMassage = [
  ChatMassage(msgContent: "Hello, Will", msgType: "receiver"),
  ChatMassage(msgContent: "How have you been?", msgType: "receiver"),
  ChatMassage(msgContent: "Hey Kriss, I am doing fine dude. wbu?", msgType: "sender"),
  ChatMassage(msgContent: "ehhhh, doing OK.", msgType: "receiver"),
  ChatMassage(msgContent: "Is there any thing wrong?", msgType: "sender"),
 /* ChatMassage(msgContent: "Hello, Will", msgType: "receiver"),
  ChatMassage(msgContent: "Hello, Will", msgType: "receiver"),
  ChatMassage(msgContent: "Hello, Will", msgType: "receiver"),
  ChatMassage(msgContent: "Hello, Will", msgType: "receiver"),*/
];

List<String> propertyListing = [
  'Private Room',
  'Private Ensuite',
  'Studio',
  'Apartment',
];
