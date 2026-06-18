
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_images.dart';
import 'appbarwidget.dart';
class HomeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(AssetsPath.navLogoSvg),


      actions: [
        AppbarIcon(onTap: () {  },
          icon: Icons.person,),

        const SizedBox(width: 5,),


        AppbarIcon(onTap: () {  },
          icon: Icons.call,),

        const SizedBox(width: 5,),


        AppbarIcon(onTap: () {  },
          icon: Icons.notifications_active,),


        SizedBox(width: 8,),


      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

