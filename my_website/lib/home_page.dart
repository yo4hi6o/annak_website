import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatelessWidget {
  final GlobalKey _menuKey1 = GlobalKey();
  final GlobalKey _menuKey2 = GlobalKey();
  final GlobalKey _menuKey3 = GlobalKey();
  final GlobalKey _menuKey4 = GlobalKey();
  final GlobalKey _menuKey5 = GlobalKey();

  final GlobalKey _appBarKey = GlobalKey();

  void _showMenu(GlobalKey menuKey) {
    final RenderBox button =
        menuKey.currentContext?.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);
    final buttonSize = button.size;
    final RenderBox appBar =
        _appBarKey.currentContext?.findRenderObject() as RenderBox;
    final appBarSize = appBar.size;

    showMenu(
      context: menuKey.currentContext!,
      position: RelativeRect.fromLTRB(buttonPosition.dx, appBarSize.height,
          buttonPosition.dx + buttonSize.width, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Option 1',
          child: Text('知能ロボット開発 ➣'),
        ),
        PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('ROS制御開発 ➣'),
        ),
        // Add more menu options here if needed...
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        key: _appBarKey,
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/annak_logo.png',
                      fit: BoxFit.contain,
                      height: 60.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    key: _menuKey1,
                    child: TextButton(
                      child: Text('ANNAKとは ∇',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      onPressed: () => _showMenu(_menuKey1),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    key: _menuKey2,
                    child: TextButton(
                      child: Text('知能ロボット開発 ∇',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      onPressed: () => _showMenu(_menuKey2),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    key: _menuKey3,
                    child: TextButton(
                      child: Text('AI製品情報 ∇',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      onPressed: () => _showMenu(_menuKey3),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    key: _menuKey4,
                    child: TextButton(
                      child: Text('その他サービス ∇',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      onPressed: () => _showMenu(_menuKey4),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    key: _menuKey5,
                    child: TextButton(
                      child: Text('会社概要 ∇',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      onPressed: () => _showMenu(_menuKey5),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 40.0, // ここでボタンの高さを指定します
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text('お問い合わせ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => CounselingPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 600,
              child: Image.asset(
                'assets/robot_arm5.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0), // パディングをゼロに設定
              child: Container(
                color: Colors.grey[300], // 背景色を薄いグレーに設定
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0, top: 36.0),
                      child: Text(
                        'ピックプレース知能ロボット',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Text(
                        '「Pick Placer」', // ここに二段目のタイトルを追加します
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 36.0, top: 36.0),
                      child: Text(
                        'AIによる物体検出を行いロボットが対象物のピック作業を行います。\n'
                        '事前に対象容器を学習させておけば、品目切替を行う必要が無くなります。',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Movie
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VideoPlayerWidget(
                  'assets/movie2.mp4'), // ここでVideoPlayerWidgetを使用します
            ),

            // YouTube
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: YoutubePlayerIFrame(
            //     controller: YoutubePlayerController(
            //       initialVideoId: 'bZ1ld3TPaDQ', // YouTubeのビデオIDを設定します
            //       params: YoutubePlayerParams(
            //         showControls: true,
            //         showFullscreenButton: true,
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  VideoPlayerWidget(this.url);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller?.play(); // ここで再生を開始します。
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller!.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(_controller!),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}

class CounselingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('無料カウンセリング'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '無料カウンセリングの内容について説明する部分です。詳細な情報や取り組みなどを記載します。',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
