# Collapse-Header-iOS

스크롤한 정도에 따라 헤더가 접히거나 펼쳐지는 레이아웃


## Collapse Header1

헤더의 bottom과 scrollView의 top이 제약조건으로 서로 붙어있기 때문에 스크롤은 스크롤뷰에서만 가능하다. 헤더에서 드래그를 시작하면 아무 일도 일어나지 않는다.

<img src='./Documentation/collapsed_header1.gif' width='30%'/>
<br>


## Collapse Header2

scrollView가 헤더를 가리면서 Superview.top에 붙어있고 scrollView에 contentInset을 줬기 때문에 스크롤뷰의 뒤에 있는 헤더가 보인다.

<p>
  <img src='./Documentation/collapsed_header2.gif' width='30%'/>
  <img src='./Documentation/collapsed_header2_ex1.png' width='30%'>
  <img src='./Documentation/collapsed_header2_ex2.png' width='30%'> 
</p><br>


## Collapse Header3

스크롤한 정도에 따라 타이틀이 사라졌다가 나타난다.

<img src='./Documentation/collapsed_header3.gif' width='30%'/>
