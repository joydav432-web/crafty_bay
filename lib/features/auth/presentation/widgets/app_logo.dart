
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_images.dart';

class Applogo extends StatelessWidget {
  const Applogo({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(AssetsPath.logoSvg,width: 130,));
  }
}
