'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "5fc10240b73452c6a64964c44206397c",
"index.html": "4042bcc5b0ffc6a3bd8abb6c319fa680",
"/": "4042bcc5b0ffc6a3bd8abb6c319fa680",
"main.dart.js": "b5250dcbd84c49e3caf633a83023078b",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2e80b11771bfece860bf33f24e3b47ca",
".git/config": "38881ccff4dc4e249623736f3cd97a15",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
"assets/AssetManifest.json": "f94af52192dcb6c0922737fc428e4fee",
"assets/NOTICES": "02401cc19f007a2da6b7a12141a8bae0",
"assets/FontManifest.json": "24636421a941e1a973ed7962700ca341",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "b72c617acdf2227c8b1413215f620711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a5d7457fda15b7622c14f432ba63039a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "c1b505018116243fb024fb2e605a1fdc",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "40469726c5ed792185741388e68dd9e8",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "dc62a013eb8d0cd4180a387d44a9db05",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/images/ios-down-arrow.png": "fa4679d2972f1d11355142a60ed34ede",
"assets/assets/images/DAVID_COBBINA_CV.pdf": "0516a6d443027d43295e07518ea5c67a",
"assets/assets/images/video_share_icon.png": "5e88a205429f2c443e44c9b938905ab7",
"assets/assets/images/down-arrow.png": "4393cd5feeb20fb468c7eb223d1bbd06",
"assets/assets/images/david-cobbina-cv.pdf": "056eac309f96f0152447de93b0d9f6ab",
"assets/assets/images/associate_android_dev.png": "496dc53d08eec0434eeeae9887955ec8",
"assets/assets/images/cloud_developer_cert.png": "1ca2e8a34f3acd90d81a67673b3b42be",
"assets/assets/images/data_science_cert.png": "1364c23105bfbb8c9197f7ad1f9dd245",
"assets/assets/images/projects/aerium-v1/portfolio_cover.png": "44d787594b26ade2562489ced20d9914",
"assets/assets/images/projects/aerium-v1/portfolio_design_2.png": "415b12138860ce60055b3ce39e517fde",
"assets/assets/images/projects/aerium-v1/portfolio_design_3.png": "4b8a024161c0d3f30b858ac60b9286d0",
"assets/assets/images/projects/roam/wireframes_signup_login.jpeg": "3f9c2d5af711cbc401036749fca0ec76",
"assets/assets/images/projects/roam/roam_profile.jpeg": "3351fb0171a75f53d2974e20e586db86",
"assets/assets/images/projects/roam/roam_onboarding.jpeg": "d6f2a2c09df8af0fc8708db8bd3c9a93",
"assets/assets/images/projects/roam/roam_home.jpeg": "9bcacb5453047dca89cf69352742765f",
"assets/assets/images/projects/roam/wireframes_app.jpeg": "2fba25598d725ec44a6b828448535e3a",
"assets/assets/images/projects/roam/wireframes_onboarding.jpeg": "0793bcaad704dc77c2115eca32ec488b",
"assets/assets/images/projects/roam/roam_cover.jpeg": "a67b0ed338d81feb4cf60955c3a821b2",
"assets/assets/images/projects/roam/roam_explore.jpeg": "545a73fcfd824fdc7aa66ec3b5601cf8",
"assets/assets/images/projects/roam/roam_overall.jpeg": "5c76cf22ede0a7955733f39d4439a055",
"assets/assets/images/projects/roam/roam_flow_chart.png": "50aa1d22e98a682fb24ad8beca7f306f",
"assets/assets/images/projects/login_catalog/login7.jpeg": "34412e31d874c3147f29d3bc522efbd2",
"assets/assets/images/projects/login_catalog/login_catalog_cover.jpg": "8142a609044c0f5b26df2964fe9304c4",
"assets/assets/images/projects/login_catalog/login8.png": "2bf8b3ab8d940dfb5c48069195c2d039",
"assets/assets/images/projects/login_catalog/login9.png": "4eb5737139e26eb31c1bea5e6e2c0a6b",
"assets/assets/images/projects/login_catalog/login4.png": "f5eb46c00b1ad99b48dc75648ae232c0",
"assets/assets/images/projects/login_catalog/login5.png": "bafb620a4388df5ef86cff21ef895491",
"assets/assets/images/projects/drop/drop_simple.png": "c4c00ba6b1933a304067dda102a922dd",
"assets/assets/images/projects/drop/drop_flowchart.png": "6601108c834215bb982c5fa49f586591",
"assets/assets/images/projects/drop/drop_minimal_design.png": "06c3434542050151428b3f66a0193244",
"assets/assets/images/projects/drop/drop_easy_access.gif": "7657c8f99a7a3a405cb71cb1f4bee892",
"assets/assets/images/projects/drop/drop_wireframes.gif": "155af5f6c5def746328626cfce09c163",
"assets/assets/images/projects/drop/drop_description.gif": "7a0eede4ed79d2468eeaec6d30347b3c",
"assets/assets/images/projects/drop/drop_thanks.gif": "7f63f39ed7c894ee6e0755f77a39afb5",
"assets/assets/images/projects/drop/drop_cover.png": "c50dd8fc206812051747e58cf5a8b345",
"assets/assets/images/projects/nimbus/nimbus.jpg": "9f925a888c2ff02c9f1206f99c2b155d",
"assets/assets/images/projects/nimbus/nimbus_cover.jpg": "454409edbf32cc8432d70c69155a6016",
"assets/assets/images/projects/outfitr/outfitr_2.jpeg": "b5c6638904552202a14d3d65f6d69116",
"assets/assets/images/projects/outfitr/outfitr_5.jpeg": "32317c7e7d7bf50c3ca110d6d393e670",
"assets/assets/images/projects/outfitr/outfitr_4.jpeg": "4f45a2d1f2735a813f9e3ce4ca83f351",
"assets/assets/images/projects/outfitr/outfitr_6.jpeg": "8a986255dfcd301d00891cf0a6288df8",
"assets/assets/images/projects/outfitr/outfitr_cover.jpg": "73c49501f831207eb63ca115c5b1dd31",
"assets/assets/images/projects/outfitr/outfitr_1.jpeg": "5a72c14039670e01bcbfaccbff889551",
"assets/assets/images/projects/otp_package/otp_cover.png": "6fc7ff3a9d1b6d8cbb81348c8f2df184",
"assets/assets/images/projects/flutter_catalog/screens.png": "f384d904e19edcdf3b83ac9fab4a2514",
"assets/assets/images/projects/flutter_catalog/typography.png": "b12b17f85e8e12bd2ccab08e987c640c",
"assets/assets/images/projects/flutter_catalog/flutter_catalog_cover.png": "529c018ceb7db5d85e0bba13a4cd19c3",
"assets/assets/images/projects/flutter_catalog/stats.png": "c6c5da388e4771644e3a0057737cc018",
"assets/assets/images/projects/flutter_catalog/onboarding.png": "78cd62661bd65bca48016781ec5af76d",
"assets/assets/images/projects/flutter_catalog/activities.png": "56b8a82f91b3bb17fc2da735be8309e2",
"assets/assets/images/projects/flutter_catalog/thanks.png": "f23385476a0df7db049d7b8f94714706",
"assets/assets/images/projects/aerium-v2/typography.jpg": "e16664ace87aa12b2266e6f8127ca05f",
"assets/assets/images/projects/aerium-v2/aerium_v2.jpg": "33ec4d62fe74fb6ee3b01301f92ceb9c",
"assets/assets/images/projects/aerium-v2/overall.jpg": "f114c609432d9115658f5477900f66a7",
"assets/assets/images/projects/aerium-v2/last.jpg": "ee1b6eee2d5df5a5bfdcb686266b75a0",
"assets/assets/images/projects/aerium-v2/first.jpg": "d7a4be69fcea5718ce8fdaa844ce0988",
"assets/assets/images/projects/foodybite/foodybite_home_flow.png": "f144497bae302b17e440392f547410e7",
"assets/assets/images/projects/foodybite/foodybite_cover.png": "969daa4932408c630eb26f795cd84840",
"assets/assets/images/projects/foodybite/foodybite_starting_flow.png": "77c7833485f0a71c95e3a74f3f01b7c4",
"assets/assets/images/projects/foodybite/foodybite_typography.png": "af6e1b156ad00cfb382824b30ba38a35",
"assets/assets/images/projects/foodybite/foodybite_home.png": "831c86f2e1dd6fa238acd532e41b3607",
"assets/assets/images/projects/foodybite/foodybite_review_favorite_notifications_flow.png": "e80ce1073e823a2fc83ddbf1515794f7",
"assets/assets/images/projects/disneyplus/disneyplus_header.png": "1ef584f42c10fd2f994f44e35d281751",
"assets/assets/images/projects/disneyplus/disneyplus_great_menu.png": "d13b01ee672be2e3e884fe866db90359",
"assets/assets/images/projects/disneyplus/disneyplus_downloads_feature.png": "3bb3d18e2b7af7b62e3bc90a8deed037",
"assets/assets/images/projects/disneyplus/disneyplus_more_description.png": "54c40930e0035fee095cc5f26e09e8d4",
"assets/assets/images/projects/disneyplus/disneyplus_components.png": "74d9e2263cebd38337ac2ae9d2f23b16",
"assets/assets/images/projects/disneyplus/disneyplus_cover.png": "ffa11a0c8f114e0a24b31bb1790f2ef8",
"assets/assets/images/projects/disneyplus/disneyplus_mockups.png": "ec3d2333044bc2622030e38eb84a1b90",
"assets/assets/images/projects/disneyplus/disneyplus_the_end.png": "32e658209ce45e9227860a8c0fbf1b54",
"assets/assets/images/projects/disneyplus/mockups.png": "bfec31223be46e6c269d8bc71f3f707e",
"assets/assets/images/projects/disneyplus/disneyplus_profiles.png": "ee5c8f987396dbb6157911982b9e983d",
"assets/assets/images/projects/disneyplus/disneyplus_description.png": "f049e03a0d786b44d57f80e702f10a5c",
"assets/assets/images/projects/disneyplus/disneyplus_theme.png": "b4a28335035d4b169f1033313801fcc5",
"assets/assets/images/projects/disneyplus/disneyplus_designs.png": "084289a49e4ec07af37d41eb0b919123",
"assets/assets/images/projects/disneyplus/disneyplus_home.png": "7c3f46edc91974a22db6ecab11e49cbd",
"assets/assets/images/cmu_cert.png": "522cfd8c2bf621d86dbbca32c7624377",
"assets/assets/images/love.jpeg": "7b5ecb85853d9a0203a22bd559d958c4",
"assets/assets/images/circle.png": "663d5187ada8666bfa87120d1665605f",
"assets/assets/images/right-arrow.png": "62a7bab73a0fe40acd3f4555adfcab91",
"assets/assets/images/android_basics_cert.png": "3279aee63a95e1b4df4e4999364f8749",
"assets/assets/images/works.png": "5c6f8eb3a22f703781aad6c2528cf0cd",
"assets/assets/images/david_legend.png": "bac667358275697e63db4c888a736df9",
"assets/assets/images/man.png": "f73f13df049ad84129a3c958a8128651",
"assets/assets/images/icons-google.png": "a7c1786ae33c01ce63c12cc5c22eaf4f",
"assets/assets/images/ic_launcher.png": "52e6fde1958cb93e2a32c1ce0389810f",
"assets/assets/images/dev_meditate.png": "742e79b9b388e0a9304a12eb0f8f6291",
"assets/assets/images/aliuser_title_back_normal.9.png": "88f47782628856eba68dafe39664b675",
"assets/assets/images/ic_playing.png": "5f6cd678f9eb221b3bc891d3190bab4a",
"assets/assets/images/down-arrow-2.png": "de203dedb01f2871b4ebbec490c20a6c",
"assets/assets/images/reading.png": "a55b8b1f86a67efec99b3309b36ce198",
"assets/assets/images/actionbar_search.png": "63acbee38126be6a4408b74e68c1a2e3",
"assets/assets/images/google_play.png": "7c42f3803d546db3d393106501dba541",
"assets/assets/images/account_header.png": "4c03370bfc85216bbb2c93db2b061ed7",
"assets/assets/images/skills.png": "2bd1870ebedbbd39a41827675a2846c3",
"assets/assets/images/up-arrow.png": "d0c6457f5704962b99f0e6aa3e9b18e7",
"assets/assets/images/boy.png": "04f2c4444a4bb2aedd62c25d3ba74640",
"assets/assets/images/skills1.png": "77752281625f377820cdc5de7e66512c",
"assets/assets/images/icons-twitter.png": "4ea6081c9718a12d8d55a28b55787898",
"assets/assets/images/video_icon_praise.png": "faa3494f379f3161ef598b521b7d4e4f",
"assets/assets/images/video_msg_icon.png": "ef2b59f70fa36afe219fb976f7c30023",
"assets/assets/images/icons-facebook.png": "1227f6e2aeb0572db0b6be1fe6ae179a",
"assets/assets/images/skills2.png": "5849f99db0aaf1026199cd184087deae",
"assets/assets/icons/Image(1).png": "bab75cfa47858ee7d46d8815dd0fc250",
"assets/assets/icons/add.png": "e171472f2e89f5131f67628e4476990e",
"assets/assets/icons/resume_mysql.png": "4c6ce57441b1180c1b25aa0112cd5d3c",
"assets/assets/icons/plus.png": "33316baefe50db82879a3f7d4b29a909",
"assets/assets/icons/cube.png": "8059e3660dec516746c520bb5ba80c62",
"assets/assets/icons/video(2).png": "9cb5638a63ead540c05a902fda40dbc3",
"assets/assets/icons/image(12).png": "7a426b056bdcf57d330e4a435f3daed4",
"assets/assets/icons/arrow_right.png": "da93fbacc747b1fa2d51d8fa2392e24c",
"assets/assets/icons/phone_login.png": "d452d57680f0f50744cea69774e792e3",
"assets/assets/icons/icon.png": "9351f4cfaa7050069bc7b8fdd468a1fb",
"assets/assets/icons/headpic.png": "12f2f3758ae0036235888163766059ec",
"assets/assets/icons/element.png": "b9043197d9d9587a49db7cb359028253",
"assets/assets/icons/bell.png": "c8743bbec2996ef6c9e06f433998cb92",
"assets/assets/icons/expand.png": "77368cc066fafdbbfbf8310e7e832e3d",
"assets/assets/icons/download.png": "71172626368bd21cd23140c99e3a2ed3",
"assets/assets/icons/rewind-left(1).png": "5ed6a2ab5c528313a0ccf39893df6dfd",
"assets/assets/icons/search2.png": "345ce59ebd02b80be0abe7819110177d",
"assets/assets/icons/play-circle1.png": "4c813d73c2f14f395f5999ba17e08977",
"assets/assets/icons/image(13).png": "d221d55565ba06614cd80513c71c171a",
"assets/assets/icons/settings.png": "337bff4cabfcd20b337ba37931d407b6",
"assets/assets/icons/video(3).png": "6731cb8f0c5144d311bc9451efaf01cb",
"assets/assets/icons/profile_book.png": "e52dcbe34ac86af85539ce7e9a0b5033",
"assets/assets/icons/resume_react.png": "048891582290c6cd09c71a5b17bf6086",
"assets/assets/icons/log-out.png": "9db18552fc50e3bbdaaf28b0e81c2062",
"assets/assets/icons/edit_3.png": "96accb628117714fe65344fa94f44467",
"assets/assets/icons/resume_swift.png": "d2801ddcbaa44beba47d47d2e6feadf7",
"assets/assets/icons/bell2.png": "8f7e50d5ee662c3322d9d5e5f3bd8f72",
"assets/assets/icons/vv.mp4": "198918f40ecc7cab0fc4231adaf67c96",
"assets/assets/icons/a_microphone.png": "2c7e52c5f31be239b224af1820b732d0",
"assets/assets/icons/by.png": "4073eab7df0bb33b151db4d23502965b",
"assets/assets/icons/lock.png": "e87a1343c94e5e9904bbcfec29969698",
"assets/assets/icons/file-text.png": "8fbc13bedfdf35443ec05f2c9648f442",
"assets/assets/icons/message-circle.png": "006c105095b1b24f7aabaf15aa85b910",
"assets/assets/icons/play%2520button.png": "6679a9fcd8ecce789d2f2e934012e9d9",
"assets/assets/icons/mic(1).png": "c1166787a7fc3d4d4b216227b4a207f0",
"assets/assets/icons/bo_trumpet.png": "eed542427fdc198d75749bf082d5c21a",
"assets/assets/icons/b_photo.png": "d046b7134abdc9a74a6f3f043e529bd5",
"assets/assets/icons/file.png": "3ebffd6ec518ff861282f228511a20cb",
"assets/assets/icons/01.png": "0a40b1eae318d78815a89bf7f9c5d630",
"assets/assets/icons/download_detail.png": "3528046e5b2f0014758f960ffc525daf",
"assets/assets/icons/image(7).png": "ed9581688c55991440a6c6fbf9b68ccb",
"assets/assets/icons/ang.png": "5b2a6dfa8aa2190c380631d526233d93",
"assets/assets/icons/Vector.png": "a014f357b7c722599b51c5eb486451ca",
"assets/assets/icons/down.png": "dc826a39917a88033b98718a3ca6bdd9",
"assets/assets/icons/star(1).png": "9a9282f5dd06b638e599972e9384dac2",
"assets/assets/icons/Logout.png": "5be0901d69860f44620a66fa1708cf75",
"assets/assets/icons/02.png": "a46d721db4df98a351d14634bb9ad04e",
"assets/assets/icons/rewind-right.png": "6276cbd1de91c61ec49f42c9dfebbca5",
"assets/assets/icons/b_video.png": "c9141c1903de87fbca92453a9046e5a4",
"assets/assets/icons/home.png": "a4b5ea75eb1de8df7b141b5dbfc1522a",
"assets/assets/icons/person.png": "43e1effab2dafe2e407eefdef5a46d02",
"assets/assets/icons/user.png": "5b0111010c1f5815a859bf94d32432aa",
"assets/assets/icons/img.png": "3ecee8b2472f3d8df77d2d68ea8318d3",
"assets/assets/icons/arrow.png": "64f6083dbc6e9b72b3a485c54eaa9511",
"assets/assets/icons/profile_video.png": "582e2548d8185ca91d0609bd9e279857",
"assets/assets/icons/send2.png": "7455d6f087c50ac257f1df92254b1b50",
"assets/assets/icons/image(6).png": "d7f4c2ac6c04a939e860f5ed2967cb21",
"assets/assets/icons/b_microphone.png": "c72c29678152dec061b83779d32b94af",
"assets/assets/icons/play-circle.png": "84efcdd2ad0c36a71e67e36da2ba00e3",
"assets/assets/icons/icon(3).png": "3d152792c70f5ebf9440bc275ea9ac85",
"assets/assets/icons/05.png": "dbd5441305f8c942a8ecbc498a0c0d26",
"assets/assets/icons/video%25202.png": "9c3111cf53e42e27d92f10dd47d385bf",
"assets/assets/icons/b_phone.png": "85c70c4e486de43dd200b8547ab5991c",
"assets/assets/icons/person2.png": "43e1effab2dafe2e407eefdef5a46d02",
"assets/assets/icons/list.png": "1f3ceb0cdb9a7a3cdb786a18a52ceb7d",
"assets/assets/icons/contact.png": "8bc71582ba58dcea640c0bb45d91e51c",
"assets/assets/icons/background.png": "67e331822e2da73b730cf3d3cff4200c",
"assets/assets/icons/search.png": "0b43f61e8c32c52bd79831cbddde4354",
"assets/assets/icons/heart.png": "56531a7965ec492d3e3aab0f60b86575",
"assets/assets/icons/video_detail.png": "9f78048cba834c2375aa8411bc0ead94",
"assets/assets/icons/ao_trumpet.png": "75721a296a76376edbcfe0b80030dd3d",
"assets/assets/icons/photo.png": "b9cca5bf143dbc5238330e05868a0b32",
"assets/assets/icons/bell(1).png": "c8743bbec2996ef6c9e06f433998cb92",
"assets/assets/icons/a_photo.png": "33b537beee592b92a281dcf426702ee2",
"assets/assets/icons/apple.png": "71aead52cf24fb23c412ffc96471c248",
"assets/assets/icons/image(9).png": "a4f80270543ede7f3c8e783ada7e9cb8",
"assets/assets/icons/menu.png": "3aa2bf11a8069b662dfee85d0e1129ad",
"assets/assets/icons/shopping-cart.png": "e1c308fda36ae3727f7efca4732673db",
"assets/assets/icons/cloud-download.png": "155d6b91af5456461adbe4b98e1f6552",
"assets/assets/icons/a_trumpet.png": "5034dcdaa2774da1a482119c2fe39cf2",
"assets/assets/icons/resume_flutter.png": "6637b6c64481c76692760d0729b9c10a",
"assets/assets/icons/pause.png": "f8878d1f314f419f03ce510e64543992",
"assets/assets/icons/image(5).png": "e4393a9e9f14b8f1d148c8d2d7038bca",
"assets/assets/icons/messi.jpeg": "be99b133859a3c3b5f4ce8ce6f700a68",
"assets/assets/icons/image(4).png": "a7a274bafa8891224a36c36c5b2cc0dd",
"assets/assets/icons/star(2).png": "f726a645b26a1e7b9571a4b97df71444",
"assets/assets/icons/filter.png": "e202eb78f97b3d31fb874f6f9f143db8",
"assets/assets/icons/heart(1).png": "f51a3ee2365086759e00e9cea65cfa64",
"assets/assets/icons/a_video.png": "067a79bddc1ef197b0047b1ff9cd1330",
"assets/assets/icons/video.png": "6daad7d676d42abbcce27e5c5267eb32",
"assets/assets/icons/more-vertical.png": "9d8b53e5959e776ff6100d1630598aa3",
"assets/assets/icons/image(8).png": "1700b1d7aa888f6914521f1fbc079873",
"assets/assets/icons/options.png": "c024b740f9890e6aa88fae063cfa0628",
"assets/assets/icons/phone-call(1).png": "382feba4670397514ff6992dcb93fe28",
"assets/assets/icons/a_phone.png": "6dc5ecda66701887315ed6a75527da6a",
"assets/assets/icons/call.png": "03c25538e5c3f3bb262aaae418063de5",
"assets/assets/icons/more-vertical-2.png": "74c16b266aee56f7cace7c4bad7c7484",
"assets/assets/icons/icon(1).png": "febdda30f1ff0a763a029c158adb6384",
"assets/assets/icons/credit-card.png": "5e024b06eb7db6fdeb2d67efcc8f797a",
"assets/assets/icons/person(1).png": "a544ef8efc78bd605eb0ffe7b7775be0",
"assets/assets/icons/file_detail.png": "2331f1291d935e9baae23c86eb691878",
"assets/assets/icons/rewind-left.png": "5ed6a2ab5c528313a0ccf39893df6dfd",
"assets/assets/icons/edit.png": "6d9f94ca37f87a98b653df4966dbdc81",
"assets/assets/icons/message-square.png": "5c2ec2747e16596795dfb156deb2e37e",
"assets/assets/icons/image(3).png": "eeac31ec7f3ff97486e0c522bad40112",
"assets/assets/icons/star.png": "e07b5ed9242d1329f0f81955849026b1",
"assets/assets/icons/Art.png": "b736a43278e42afd54c7976ca503acd1",
"assets/assets/icons/play%2520button(1).png": "53f7a7a57d75c9933848548603800a1c",
"assets/assets/icons/a_telephone.png": "8875ffda9378e29520eca555a36a4a70",
"assets/assets/icons/rewind-left(2).png": "5ed6a2ab5c528313a0ccf39893df6dfd",
"assets/assets/icons/edit%25202.png": "ab92fe859bd0a004b63ba9fc6db25c34",
"assets/assets/icons/star2.png": "0d156ee5bb0697773285e5843261588d",
"assets/assets/icons/image(10).png": "b8e575b5ce46541d54839c1a94e6a0ba",
"assets/assets/icons/google.png": "245b284505e4541c95d9e2982ea68005",
"assets/assets/icons/voice.png": "d7f198958d2855df8b4de1c28214ca53",
"assets/assets/icons/video(1).png": "582e2548d8185ca91d0609bd9e279857",
"assets/assets/icons/facebook.png": "56384a6d5f8d846a2f832fc063f35122",
"assets/assets/icons/profile_star.png": "f726a645b26a1e7b9571a4b97df71444",
"assets/assets/icons/phone-call.png": "bb2f1f458bd352e8a4b2d79ee51cef91",
"assets/assets/icons/image(11).png": "17f0bc361eafbcf3aeeefa2436f96f3a",
"assets/assets/icons/b_telephone.png": "09b4058eb39f1fd927b1cfa00d000119",
"assets/assets/icons/send.png": "ede02235024e2fff140bc9d32005395a",
"assets/assets/icons/b_trumpet.png": "758e897af5ffcbc59b98427a140b1923",
"assets/assets/icons/resume_ruby.png": "d92489091fe3f2a958433896ecbd44fa",
"assets/assets/icons/award.png": "c8ecc06350e63a8b277896d4a6f89bf8",
"assets/assets/icons/message.png": "e6ebd997fa3ea18764b2a54cc7a80087",
"assets/assets/icons/Image(2).png": "8662677af2e8128d8137af0329681f6f",
"assets/assets/icons/Image.png": "f69bca13500091c80f948119dce801e2",
"assets/assets/icons/resume_php.png": "fd9085d0582aa4318711fb7f1cac1b1d",
"assets/assets/icons/people.png": "c2b001d3a8ea4d42c1a1df9569b85253",
"assets/assets/icons/close.png": "a99b0e0b6c0a13905b2bce1b2d779d16",
"assets/assets/icons/mic.png": "85d2506a5c9c4506ecade6c7943bc745",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
