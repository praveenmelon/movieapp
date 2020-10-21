import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/app_localizations.dart';
import 'package:movieapp/common/extensions/string_extensions.dart';
import 'package:movieapp/presentation/themes/app_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';
import 'package:movieapp/common/extensions/size_extensions.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key key,
    @required this.title,
    @required this.onTap,
    this.isSelected = false,
  })  : assert(title != null, 'title should be null'),
        assert(title != null, 'onTap should be null'),
        assert(isSelected != null, 'isSelected should be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ))),
        child: Text(
          title.t(context),
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
