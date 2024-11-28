enum IconProvider {
  dialog(imageName: 'dialog.png'),
  splash(imageName: 'splash.webp'),
  calc(imageName: 'calc.png'),
  back(imageName: 'back.png'),
  history(imageName: 'history.png'),
  port(imageName: 'port.png'),
  tips(imageName: 'tips.png'),
  ai(imageName: 'ai.png'),
  polygon(imageName: 'polygon.png'),
  chainlink(imageName: 'chainlink.png'),
  usdc(imageName: 'usdc.png'),
  avax(imageName: 'avax.png'),
  shib(imageName: 'shib.png'),
  polkadot(imageName: 'polkadot.png'),
  solana(imageName: 'solana.png'),
  dogecoin(imageName: 'dogecoin.png'),
  litecoin(imageName: 'litecoin.png'),
  xrp(imageName: 'XRP.png'),
  cardano(imageName: 'cardano.png'),
  bnb(imageName: 'bnb.png'),
  eth(imageName: 'eth.png'),
  dollar(imageName: 'dollar.png'),
  tron(imageName: 'tron.png'),
  tether(imageName: 'tether.png'),
  home(imageName: 'home.png'),
  bitcoin(imageName: 'bitcoin.png'),
  splashItem(imageName: 'splash_item.png'),
  ipadDialog(imageName: 'ipad_dialog.png'),
  unknown(imageName: '');

  const IconProvider({
    required this.imageName,
  });

  final String imageName;
  static const _imageFolderPath = 'assets/images';

  String buildImageUrl() => '$_imageFolderPath/$imageName';
  static String buildImageByName(String name) => '$_imageFolderPath/$name';
}
