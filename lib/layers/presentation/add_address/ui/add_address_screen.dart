import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/add_address/cubit/add_address_cubit.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/add_button.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/city_field.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/cubit_listener.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/governorate_field.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/street_field.dart';
import 'package:shopink/layers/presentation/add_address/ui/widgets/title_field.dart';

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
          body: AddAddressCubitListener(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: context.read<AddAddressCubit>().formKey,
                child: Column(
                  children: [
                    const AddAddressTitleField(),
                    Gap(20.h),
                    const AddAddressGovernorateField(),
                    Gap(20.h),
                    const AddAddressCityField(),
                    Gap(20.h),
                    const AddAddressStreetField(),
                    Gap(200.h),
                    const AddButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
