import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/assets/assets.gen.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.profileRoute),
      child: Container(
        height: 100.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: ColorManager.yellow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state is SettingsSuccess) {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 100.r,
                      backgroundImage: NetworkImage(state.user.imageUrl),
                      onBackgroundImageError: (exception, stackTrace) =>
                          Assets.images.placeholder.image(),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox.expand()),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          state.user.name,
                          style: TextStyles.font15WhiteNormal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          state.user.email,
                          style: TextStyles.font15WhiteNormal,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox.expand()),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ));
            }
          },
        ),
      ),
    );
  }
}
