import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/add_address/cubit/add_address_cubit.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddAddressCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.addAddress.tr()),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: context.read<AddAddressCubit>().formKey,
              child: Column(
                children: [
                  AddAddressTitleField(),
                  Gap(20.h),
                  AddAddressStreetField(),
                  Gap(20.h),
                  AddAddressGoverateField(),
                  Gap(20.h),
                  AddAddressButton(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
