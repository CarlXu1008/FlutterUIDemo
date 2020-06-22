import 'package:flutter/material.dart';

class ImageViewWidget extends StatefulWidget {
  @override
  _ImageViewWidget createState() => _ImageViewWidget();
}

class _ImageViewWidget extends State<ImageViewWidget> {

  NetworkImage networkImage;

  var imageUrl =
      "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg";

  var imageUrl2 =
      "http://n.sinaimg.cn/sports/2_img/upload/4f160954/107/w1024h683/20181128/Yrxn-hpinrya6814381.jpg";

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Image(image: new AssetImage('images/logo.png')),
      new Image.asset('images/logo.png'),
      // new Image.file(new File('/storage/xxx/xxx/test.jpg'))
      new Image.network('http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg'),
      new FadeInImage.assetNetwork(
        placeholder: 'images/logo.png',
        image: 'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
        fit: BoxFit.cover
      )
    ],);
  }

}
