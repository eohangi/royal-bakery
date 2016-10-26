<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/code39.js"></script>

</head>
<body>

 <%@ include file="/WEB-INF/inc/topbar.jsp"%>

 <div class="page-header"></div>
 <div class="container">

  <div class="row">


   <div class="join">
    <h1>주문 완료</h1>
    <hr />
    <!-- 가입폼 시작 -->
    <form class="form-horizontal" id="myform">
     <p>고객님의 주문이 정상적으로 처리 되었습니다.</p>
     <p>Royal Bakery를 선택해 주셔서 감사합니다.</p>
     <hr />
     <div class="form-group row">
      <label for="user_id" class="col-md-2">상품 정보</label>
      <div class="col-md-10">
       <table class="table table-hover">
        <thead>
         <tr>
          <th class="text-center">품명</th>
          <th class="text-center">수량</th>
          <th class="text-center">가격</th>
         </tr>
        </thead>
        <tbody>
         <tr>
          <td class="text-center">크로와상</td>
          <td class="text-center">3개</td>
          <td class="text-center">3000원</td>
         </tr>
        </tbody>
       </table>
      </div>
     </div>

     <div class="barcode">
      <div class="col-md-12">
       <canvas id="ean" width="200" height="100">
        <script type="text/javascript">
         $("#ean").EAN13("5901234123457");
        </script></canvas>
      </div>
     </div>
     <div class="form-group">
      <label for="user_id" class="col-md-2">주문자</label>
      <div class="col-md-10">
       <input type="text" name="user_id" id="user_id"
        class="form-control" placeholder="어" disabled>
      </div>
     </div>
     <div class="form-group">
      <label for="name" class="col-md-2">주문일시</label>
      <div class="col-md-10">
       <input type="text" name="name" id="name" class="form-control"
        placeholder="2016년 11월 23일 18:25" disabled>
      </div>
     </div>
     <div class="form-group">
      <label for="name" class="col-md-2">결제방법</label>
      <div class="col-md-10">
       <input type="text" name="name" id="name" class="form-control"
        placeholder="무통장 입금" disabled>
      </div>
     </div>
     <div class="form-group">
      <label for="name" class="col-md-2">결제금액</label>
      <div class="col-md-10">
       <input type="text" name="name" id="name" class="form-control"
        placeholder="30000원" disabled>
      </div>
     </div>
     <hr />
     <p>생성된 바코드로 매장에서 주문 수령 가능합니다.</p>
     <hr />
     <!-- ---------------------------------------------- -->
     <div class="col-md-offset-3 col-md-10 col-sm-12">
      <div id="externalbox" style="width: 5in;">
       <div id="inputdata">111111</div>
      </div>

      <script type="text/javascript">
       /* <![CDATA[ */
       function get_object(id) {
        var object = null;
        if (document.layers) {
         object = document.layers[id];
        } else if (document.all) {
         object = document.all[id];
        } else if (document.getElementById) {
         object = document.getElementById(id);
        }
        return object;
       }
       get_object("inputdata").innerHTML = DrawCode39Barcode(
         get_object("inputdata").innerHTML, 1);
       /* ]]> */
      </script>

      <!-------------------------------------------------->
     </div>

     <br />

     <div class="button">
      <!-- 들여쓰기 -->
      <button type="button" class="btn btn-primary"
       onclick="location.href='MainIndex2.jsp'">메인으로</button>
      <button type="button" class="btn btn-danger"
       onclick="location.href='bread.jsp'">계속 쇼핑하기</button>
     </div>


    </form>
    <!-- 가입폼 끝 -->
   </div>
  </div>
 </div>

 <%@ include file="/WEB-INF/inc/Footer.jsp"%>
</body>

</html>