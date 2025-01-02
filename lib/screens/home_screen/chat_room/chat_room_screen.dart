import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegramclone/screens/home_screen/chat_room/wdiget/chat_item.dart';
import 'package:telegramclone/screens/widget/auth_text_from_field.dart';
import 'package:telegramclone/utils/app_colors.dart';
import 'package:telegramclone/utils/app_images.dart';
import 'package:telegramclone/utils/app_size.dart';
import 'package:telegramclone/utils/app_text_style.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 68.he,
          shape: Border(
            bottom: BorderSide(
              color: AppColors.c333333.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42.we,
                height: 42.we,
                decoration: BoxDecoration(
                  color: AppColors.c333333.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              ),
              10.getW(),
              Expanded(
                child: Text(
                  "Sharifjon Muminov",
                  style: AppTextStyle.poppinsSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.c1A1A1A,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.threeDotSvg,
                width: 24.we,
                height: 24.we,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20.he),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ChatItem(
                      title: '',
                      isMyMessage: index.isEven,
                    );
                  },
                ),
              ),
              4.getH(),
              Row(
                children: [
                  5.getW(),
                  Expanded(
                    child: CostumeTextFromField(
                      hintText: "message",
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.folder,
                    ),
                  ),
                ],
              ),
              10.getH(),
            ],
          ),
        ),
      ),
    );
  }
}
