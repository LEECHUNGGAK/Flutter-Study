import 'package:flutter/material.dart';

// 1-3. 리스트 화면 (임포트)
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 1-3. 리스트 화면 (초기 리스트 구현)
    return ListView(
      children: const [
        Padding(padding: EdgeInsets.all(8.0), child: Text("신과함께-죄와벌"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("저스티스 리그"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("로트:라그나로크"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("러빙 빈센트"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("범죄도시"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("꾼"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("쥬만지: 새로운 세계"),),
        Padding(padding: EdgeInsets.all(8.0), child: Text("뽀로로 극장판 공룡섬 대모험"),),
      ],
    );
  }
}

// 1-3. 리스트 화면 (고정 더미 데이터)

// 1-3. 리스트 화면 (동적 데이터 호출1)

// 1-3. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)