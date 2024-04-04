현재 vmc 내부에 public eip를 사용하는 vm에 접속하여 동작 합니다.
비밀번호는 항상 저희가 사용하는 그것입니다.

## 배포 방법
cd terra/1.0/ && terraform plan

terraform apply 


## 구성 설명

- vmc 내부에 30.20.10.0/24 대역에 centos 템플릿 하나 만들어두었는데 
- data block에서 변경 하셔서 필요한 vm template들 복제해서 쓰시면 됩니다.
- main.tf에 선언된 data block들은 저희 sddc에 배포되어 있는 클러스터,데이터센터,데이터스토어,네트워크등을 불러와서 선언하는 용도입니다.
- vm.tf 내부의 파일은 vm resource를 배포하는 영역입니다.


