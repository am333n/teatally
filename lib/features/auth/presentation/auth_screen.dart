import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/core/widgets/common_widgets.dart';
import 'package:teatally/core/widgets/form_components.dart';
import 'package:teatally/features/auth/application/cubit/auth_cubit.dart';
import 'package:teatally/features/auth/application/cubit/auth_state.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final GlobalKey<FormBuilderState> _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CommonWidgets.modelProgressIndicator(
          inAsyncCall: state.maybeWhen(
            orElse: () => false,
            authloadingState: () => true,
          ),
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/bevimages/tealogo.png',
                        height: 160,
                        width: double.maxFinite,
                      ),
                      const Txt(
                        'TeaTally',
                        style: TxtStyle.headerLBold,
                      ),
                    ],
                  ),
                ),
                state.maybeWhen(
                  orElse: () => const SizedBox.shrink(),
                  authErrorState: (errorMessage) => Txt(
                    errorMessage ?? '-',
                    color: context.theme.appColors.danger,
                    maxLines: 3,
                  ),
                ),
                Container(
                  color: context.theme.dialogBackgroundColor,
                  padding: EdgeInsets.all(15),
                  child: FormBuilder(
                    key: _formkey,
                    child: Column(
                      children: [
                        FormComponents.formBuilderTextField(context,
                            fieldName: 'email',
                            label: '',
                            hintText: '',
                            isRequired: true),
                        FormComponents.formBuilderTextField(context,
                            fieldName: 'pass',
                            label: '',
                            hintText: '',
                            isRequired: true),
                        VerticalSpacing(15),
                        CommonWidgets.coloredTextButton(context, text: 'Login',
                            onPressed: () {
                          if (_formkey.currentState?.validate() ?? false) {
                            final email =
                                _formkey.currentState?.fields['email']?.value;
                            final password =
                                _formkey.currentState?.fields['pass']?.value;
                            context
                                .read<AuthCubit>()
                                .signInWithEmailAndPassowrd(email, password);
                          }
                        }),
                        VerticalSpacing(15),
                        CommonWidgets.coloredTextButton(context,
                            text: 'Sign In With Google', onPressed: () {
                          context.read<AuthCubit>().signInWithGoogle();
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
