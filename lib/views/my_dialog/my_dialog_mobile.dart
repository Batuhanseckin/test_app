part of my_dialog_view;

class _MyDialogMobile extends StatefulWidget {
  final MyDialogViewModel viewModel;
  final Function(bool) isLogin;

  _MyDialogMobile(this.viewModel, this.isLogin);

  @override
  __MyDialogMobileState createState() => __MyDialogMobileState();
}

class __MyDialogMobileState extends State<_MyDialogMobile> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      content: Container(
        width: UIHelper.dynamicHeight(371),
        height: UIHelper.dynamicWidth(344),
        child: Form(
          key: _formKey,
          autovalidateMode: widget.viewModel.autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Welcome back!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: UIHelper.dynamicSp(24),
                      fontWeight: FontWeight.w700,
                    ),
              ),
              widget.viewModel.showError
                  ? SizedBox(height: UIHelper.dynamicHeight(4))
                  : Container(),
              widget.viewModel.showError
                  ? Text(
                      widget.viewModel.errorText,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xFFFE0101),
                            fontSize: UIHelper.dynamicSp(14),
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  : Container(),
              SizedBox(
                height: UIHelper.dynamicHeight(
                    widget.viewModel.showError ? 12 : 24),
              ),
              EmailInput(
                controller: _emailController,
              ),
              SizedBox(height: UIHelper.dynamicHeight(24)),
              PasswordInput(
                controller: _passwordController,
              ),
              SizedBox(height: UIHelper.dynamicHeight(30)),
              widget.viewModel.fetchingLogin
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MyOrangeButton(
                      height: UIHelper.dynamicHeight(54),
                      width: UIHelper.dynamicWidth(153),
                      text: "LOG IN",
                      onPress: () async {
                        if (_formKey.currentState.validate()) {
                          await widget.viewModel.submitLogin(
                            _emailController.text,
                            _passwordController.text,
                          );
                          if (widget.viewModel.userModel.userId != null) {
                            await widget.viewModel.setPrefs();
                            widget.isLogin(true);
                            Navigator.pop(context);
                          }
                        } else {
                          widget.viewModel.autovalidateMode =
                              AutovalidateMode.always;
                          widget.viewModel.notifyListeners();
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
