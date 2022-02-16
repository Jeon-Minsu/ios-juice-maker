# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

## Step 1: 쥬스 메이커 타입 정의
### UML
![JuiceMaker-4](https://user-images.githubusercontent.com/46441723/154023716-08ce429c-f4b0-491d-8080-bc008da1f2f9.png)
### 요구사항 분석
- FruitStore 타입
    - 공통사항
        - FruitStore 타입은 과일의 재고를 관리한다.
        - FruitStore 타입이 관리하는 과일의 종류는 다음과 같다.
            - 딸기
            - 바나나
            - 파인애플
            - 키위
            - 망고
    - FruitStore 타입 생성
        - FruitStore 타입은 관리하는 과일의 초기 재고를 10개로 이니셜라이즈 한다.
    - FruitStore 타입은 관리하는 과일의 재고에 N개의 재고를 더 추가할 수 있다.
    - FruitStore 타입은 관리하는 과일의 재고에서 N개의 재고를 제거할 수 있다.
        - (관리하는 과일의 재고 ≥ N) 인 경우
        - (관리하는 과일의 재고 < N) 인 경우

- JuiceMaker 타입
    - 공통사항
        - JuiceMaker 타입은 FruitStore를 소유한다.
        - JuiceMaker 타입은 소유한 FruitStore의 과일을 사용하여 과일 주스를 제조한다.
        - JuiceMaker 타입이 제조할 수 있는 과일 주스의 종류와 레시피는 다음과 같다.
            - 딸기쥬스 : 딸기 16개 소모
            - 바나나쥬스 : 바나나 2개 소모
            - 키위쥬스 : 키위 3개 소모
            - 파인애플 쥬스 : 파인애플 2개 소모
            - 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
            - 망고 쥬스 : 망고 3개 소모
            - 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
    - 과일 주스 제조
        - JuiceMaker 타입은 제조 요청 받은 과일 주스의 종류를 확인한다.
            - JuiceMaker 타입이 제조할 수 있는 과일 주스를 제조 요청한 경우
                - JuiceMaker 타입은 제조 요청 받은 과일 주스의 레시피를 확인한다.
                - JuiceMaker 타입은 제조 요청 받은 과일 주스 레시피에 필요한 과일(들)이 있는지 확인한다.
                    - *JuiceMaker 타입은 [(필요한 과일, 그 과일의 필요한 개수)]를 소유하고 있는 FruitStore 타입의 프로퍼티의 메소드의  parameter로 넘긴다.*
                    - 제조 요청 받은 과일 주스 레시피에 필요한 과일(들)이 없는 경우
                        - JuiceMaker 타입은 제조 요청을 한 주체에게 에러 상황을 전달한다.
                    - 제조 요청 받은 과일 주스 레시피에 필요한 과일(들)이 있는 경우
                        - JuiceMaker 타입은 제조 요청 받은 과일 주스 레시피에 필요한 과일들의 재고를 제거한다.
            - JuiceMaker 타입이 제조할 수 없는 과일 주스를 제조 요청한 경우
                - JuiceMaker 타입은 제조 요청을 한 주체에게 에러 상황을 전달한다.
