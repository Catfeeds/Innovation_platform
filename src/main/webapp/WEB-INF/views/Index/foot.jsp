<%@page pageEncoding="UTF-8"%>
<div id="footer">
    <div class="footer">
        <div class="footer_h3 clearFloat">

            <div class="footer_right">
                <div class="nav">

                    <ul>
                        <li>友情连接：</li>
                        <c:forEach var="fl" items="${requestScope.friendLinks}">
                            <li><a href="${fl.url}" target="_blank">${fl.nameLink}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="footer_h3 footer_copyright clearFloat">
            <p>Copyright 2018 | 版权所有   山东科技大学电气与自动化工程学院   </p>

        </div>
    </div>
</div>