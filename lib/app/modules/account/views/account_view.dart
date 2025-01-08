import 'package:buddhismapp/app/routes/app_pages.dart';
import 'package:buddhismapp/app/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/profile_images/1235695105467707394/I-e9byb2_400x400.png",
                        scale: 1.0),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContentText(
                          title: "Mr. John Avatar",
                          color: Colors.grey.withOpacity(1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      ContentText(
                          title: '+855 069 636 481',
                          color: Colors.grey.withOpacity(1),
                          fontSize: 12),
                      ContentText(
                          title: 'បង្កើត ថ្ងៃទី០៧ ខែមករា ឆ្នាំ២០២៥',
                          color: Colors.grey.withOpacity(1),
                          fontSize: 12)
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 16, right: 16),
              child: ContentText(
                title: 'គណនី',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              child: IconText(
                svg: SvgPicture.asset(
                  'assets/svg/id_card.svg',
                  color: Colors.grey.withOpacity(1),
                ),
                title: 'ប្ដូរព័តមានផ្ទាល់ខ្លួន',
              ),
              onTap: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
            IconText(
              svg: SvgPicture.asset(
                'assets/svg/layers.svg',
                color: Colors.grey.withOpacity(1),
              ),
              title: 'ភ្ចាប់ជាមួយគណនី',
            ),
            IconText(
              svg: SvgPicture.asset(
                'assets/svg/lock.svg',
                color: Colors.grey.withOpacity(1),
              ),
              title: 'ប្ដូរពាក្យសម្ងាត់',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 16, right: 16),
              child: ContentText(
                title: 'ការកំណត់',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconText(
              svg: SvgPicture.asset(
                'assets/svg/donation.svg',
                color: Colors.grey.withOpacity(1),
              ),
              title: 'បរិច្ចាកទាន',
            ),
            InkWell(
              child: IconText(
                svg: SvgPicture.asset(
                  'assets/svg/appearance.svg',
                  color: Colors.grey.withOpacity(1),
                ),
                title: 'ផ្ទៃបង្ហាញ',
              ),
              onTap: () {
                Get.toNamed(Routes.THEME_SCREEN);
              },
            ),
            IconText(
              svg: SvgPicture.asset(
                'assets/svg/help.svg',
                color: Colors.grey.withOpacity(1),
              ),
              title: 'លក្ខខណ្ឌ និងគោលការណ៍',
            ),
            IconText(
              svg: SvgPicture.asset(
                'assets/svg/information.svg',
                color: Colors.grey.withOpacity(1),
              ),
              title: 'អំពីយើង',
            ),
          ],
        ),
      ),
    );
  }
}
