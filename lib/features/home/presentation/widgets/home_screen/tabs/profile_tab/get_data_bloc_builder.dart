import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import '../../../../../../auth/update_profile_screen/presentation/bloc/update_cubit.dart';
import '../../../../../../auth/update_profile_screen/presentation/bloc/user_data_states.dart';
import 'get_date_widget.dart';

class GetDataBlocBuilder extends StatelessWidget {
  // final UpdateUserModel updateUserModel;

  const GetDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataStates>(
      buildWhen: (previous, current) {
        return (current is GetDataOnLoadingStates ||
            current is GetDataOnErrorStates ||
            current is GetDataOnSuccessStates);
      },
      builder: (context, state) {
        if (state is GetDataOnLoadingStates) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetDataOnErrorStates) {
          return Center(
            child: Text("Error",
                style: textTheme.bodyMedium!
                    .copyWith(color: AppColors.backgroundColor)),
          );
        }
        if (state is GetDataOnSuccessStates) {
          return GetDateWidget(
            updateUserModel: state.updateUserModel!,
          );
        }
        return const SizedBox();
      },
    );
  }
}
