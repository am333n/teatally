import 'package:flutter/material.dart';
import 'package:teatally/core/styles/text/txt.dart';
import 'package:teatally/core/theme/presentation/app_theme.dart';
import 'package:teatally/features/auth/infrastructure/credential_storage.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.theme.appColors.formBorder)),
          child: ClipOval(
            child: FutureBuilder(
                future: CredentialStorage.getUserDetails(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return const Icon(Icons.error);
                      } else {
                        return (snapshot.data?['photoURL'] != null)
                            ? Image.network(
                                snapshot.data!['photoURL']!,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.warning,
                                  color: Colors.amber,
                                ),
                              )
                            : Txt(snapshot.data!['displayName']![0]);
                      }
                  }
                }),
          ),
        ),
      ),
    );
  }
}
