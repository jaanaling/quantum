enum RouteValue {
  splash(
    path: '/',
  ),
  home(
    path: '/home',
  ),
  portfolio(
    path: '/portfolio',
  ),
  calc(
    path: '/calc',
  ),
  tips(
    path: '/tips',
  ),
  history(
    path: '/home',
  ),

  unknown(
    path: '',
  );

  final String path;
  const RouteValue({
    required this.path,
  });
}