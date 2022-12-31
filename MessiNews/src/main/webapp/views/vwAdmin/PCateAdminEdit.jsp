<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="pcate" scope="request" type="com.messi.king.messinews.models.ParentCategories"/>

<m:main>
  <jsp:body>
    <form id="form" action="" method="post">
      <div class="d-flex justify-content-center bgColorGray">
        <!--    left-->
        <div class="bgColorGray" style="width: 15%">

        </div>

        <!--    center-->
        <div style="width: 70%; background-color: white" class="m-4 p-3">
          <h4>Chỉnh sửa chuyên mục lớn</h4>

          <hr>
          <h5>Đang chỉnh chuyên mục đề: ${pcate.name_parent_cate}</h5>
          <br>
          <label for="namePCate">Tên chủ đề</label>
          <input type="text" class="form-control" name="namePCate" id="namePCate" autofocus required
                 value="${pcate.name_parent_cate}"/>

          <hr>
          <div id="save" align="end">
            <a href="${pageContext.request.contextPath}/Admin/Categories/ListPCate"
               class="btn btn-secondary mr-2">
              <i class="fa fa-times" aria-hidden="true"></i>
              Hủy bỏ
            </a>
            <button class="btn btn-success" type="submit" formaction="${pageContext.request.contextPath}/Admin/Categories/EditPCate?id=${pcate.id}">
              <i class="fa fa-check" aria-hidden="true"></i>
              Lưu lại
            </button>
          </div>
        </div>


        <!--    right-->
        <div style="width: 15%" class="d-flex align-items-end flex-column bgColorGray">
          <div class="mt-auto p-2" style="position: fixed; bottom: 10px; right: 10px">
            <a href="">
              <i class="fa fa-arrow-circle-o-up fa-3x" aria-hidden="true"></i>
            </a>
          </div>
        </div>
      </div>
    </form>
  </jsp:body>
</m:main>
