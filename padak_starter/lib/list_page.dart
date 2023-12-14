import 'package:flutter/material.dart';

// 1-3. 리스트 화면 (임포트)
class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1-3. 리스트 화면 (동적 데이터 추가)

    // 1-3. 리스트 화면 (초기 리스트 구현)
    return ListView(
      children: <Widget> [
        Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: <Widget>[
              Image.network(
                "https://raw.githubusercontent.com/riflockle7/ref/master/1.%20ImageRef/padakpadak/1.jpg",
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text(
                          "신과함께-죄와벌",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("12"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: const <Widget>[
                        Text("펑점 : 139"),
                        SizedBox(width: 10,),
                        Text("예매 순위 : 1"),
                        SizedBox(width: 10,),
                        Text("예매율 : 35.5"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text("개봉일 : 2017-12-20"),
                  ],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            )
        )
      ],
    );
  }
}

// 1-3. 리스트 화면 (고정 더미 데이터)

// 1-3. 리스트 화면 (동적 데이터 호출1)

// 1-3. 리스트 화면 (관람 등급 이미지 버튼 함수 생성)