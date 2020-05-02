import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_dinner/core/services/injection.dart';
import 'package:my_dinner/features/my_diet/presentation/pages/my_diet_page.dart';
import 'package:my_dinner/features/profile/domain/models/profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/get_profile.dart';
import 'package:my_dinner/features/profile/domain/usecases/update_profile.dart';
import 'package:my_dinner/features/profile/presentation/mobx/profile_store.dart';
import 'package:my_dinner/features/profile/presentation/widgets/profile_form.dart';
import 'package:my_dinner/widgets/navigation_drawer.dart';

class ProfilePage extends StatefulWidget {
  static ModalRoute<ProfilePageResponse> routeWithRequest(
    ProfilePageRequest request,
  ) {
    return MaterialPageRoute<ProfilePageResponse>(
      builder: (_) => ProfilePage(request: request),
    );
  }

  final ProfilePageRequest request;

  const ProfilePage({Key key, this.request}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ProfileStore _profileStore;
  List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();
    _profileStore = ProfileStore(
      locator.get<GetProfile>(),
      locator.get<UpdateProfile>(),
    );
    _disposers.addAll([
      autorun((_) {
        if (_profileStore.updateSuccess) {
          if (widget.request.shouldReturnDataOnSave) {
            Navigator.of(context).pop(
              ProfilePageResponse(profile: _profileStore.profile),
            );
          } else {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Dane zostały zaktualizowane'),
            ));
          }
        }
      }),
      autorun((_) {
        if (_profileStore.error) {
          showDialog(
            context: _scaffoldKey.currentContext,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Błąd serwera'),
                content: Text('Coś poszło nie tak...'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        }
      }),
    ]);

    _profileStore.getProfile();
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop(ProfilePageResponse(
            profile: _profileStore.profile,
          ));
        } else {
          Navigator.of(context).pushReplacement(MyDietPage.routeWithParams());
        }
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Moje dane'),
          leading: Navigator.of(context).canPop() ? CloseButton() : null,
        ),
        body: Column(
          children: <Widget>[
            Observer(
              builder: (_) => AnimatedOpacity(
                child: const LinearProgressIndicator(),
                duration: const Duration(milliseconds: 200),
                opacity: _profileStore.loading ? 1.0 : 0.0,
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => ProfileForm(
                  key: GlobalKey(),
                  profile: _profileStore.profile,
                  onUpdate: (profile) => _profileStore.updateProfile(profile),
                ),
              ),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
      ),
    );
  }
}

class ProfilePageResponse {
  final Profile profile;

  ProfilePageResponse({this.profile});
}

class ProfilePageRequest {
  final Profile profile;
  final bool shouldReturnDataOnSave;

  ProfilePageRequest({
    this.profile,
    this.shouldReturnDataOnSave = false,
  });

  factory ProfilePageRequest.editProfile(Profile profile) => ProfilePageRequest(
        profile: profile,
        shouldReturnDataOnSave: true,
      );
}
