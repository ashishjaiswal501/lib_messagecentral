enum RoutePath {
  // initial(path: "/"),
  login(path: "/login"),
  signup(path: "/signup"),
  forgotpassword(path: "/forgotpassword"),
  home(path: "/");
  // productdetails(path: "product-details/:id");

  final String path;
  const RoutePath({required this.path});
}
