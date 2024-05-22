import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/assets/assets.gen.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/layers/domain/entities/user.dart';
import 'package:shopink/layers/presentation/settings/cubit/profile_card_cubit/profile_card_cubit.dart';
import 'package:shopink/layers/presentation/settings/cubit/settings_cubit/settings_cubit.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCardCubit>()..getUser(),
      child: InkWell(
        onTap: () => context.pushNamed(Routes.profileRoute),
        child: Container(
            height: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: ColorManager.yellow,
              borderRadius: BorderRadius.circular(15),
            ),
            child: BlocConsumer<ProfileCardCubit, ProfileCardState>(
              listener: (context, state) {
                if (state is ProfileCardUnauthrizedError) {
                  context.read<SettingsCubit>().logout();
                }
              },
              builder: (context, state) {
                switch (state) {
                  case ProfileCardSuccess _:
                    return _SuccessState(user: state.user);
                  case ProfileCardError _:
                    return _ErrorState(message: state.message);
                  default:
                    return const _LoadingState();
                }
              },
            )),
      ),
    );
  }
}

class _SuccessState extends StatelessWidget {
  final UserEntity user;
  const _SuccessState({required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CircleAvatar(
            radius: 100.r,
            backgroundImage: NetworkImage(user.imageUrl),
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
                user.name,
                style: TextStyles.font15WhiteNormal,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email,
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
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyles.font15WhiteNormal,
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
    );
  }
}
