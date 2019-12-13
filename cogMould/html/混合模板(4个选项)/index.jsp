<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="com.lattice.entity.*" %>
<%@ page language="java" import="com.lattice.dao.*,java.util.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>混合模板(4个选项)</title>
    <link rel="stylesheet" href="/lattice/css/bootstrap-3.3.1.min.css">
    <link rel="stylesheet" href="index.css">
    <SCRIPT src="/lattice/js/Statistics/Statistics.js" type=text/javascript></SCRIPT>
    <script src="/lattice/js/oneui/opes_post_result_util.js"></script>
</head>
<%
    Users u=(Users)request.getSession().getAttribute("cu");
    int uid=u.getUserid();
    String realname=u.getRealName();
    int taskid=Integer.parseInt(request.getParameter("taskid"));
    String lan=request.getParameter("lan");
    String targetpagename=request.getParameter("targetpagename");

    int projectid=0;
    if (!(request.getParameter("projectid")==null)) {
        projectid=Integer.parseInt(request.getParameter("projectid"));
    }

    int codematerial=0;
    if (!(request.getParameter("codematerial")==null)) {
        codematerial=Integer.parseInt(request.getParameter("codematerial"));
    }

    int sumitcoids=u.getCoid();


    Vector
            <OPES_Task> ots=OPES_TaskDAO.getOPES_aTask(Integer.parseInt(request.getParameter("taskid")),lan);
    if (ots.size()==0)
    {
        response.sendRedirect("/lattice/"+targetpagename);
        return;
    }
    ots.get(0).setProjectid(Integer.parseInt(request.getParameter("projectid")));
    request.getSession().setAttribute("ot",ots.get(0));

%>
<body>
    <div id="xs1"></div>
    <div id="reward" class="div_flex hide font_color">
        <div id="reward_item" class="reward_item hide">
            <div>
                <span>正确答案</span>
                <span id="ans"></span>
                <span>&nbsp;&nbsp;&nbsp;你的答案</span>
                <span id="ans1"></span>
            </div>
            <div style="text-align: center" id="reward_text"></div>
        </div>
    </div>
    <div id="box" class="font_color">
        <div id="item1" class="item">
            <div style="position: absolute;bottom: 0px;cursor: pointer;">
                <label style="cursor: pointer;" for="input1">
                    <input id="input1" type="checkbox"><span id="bTime"></span>
                </label>
            </div>
            <div class="item1_text item1_imgBox1 font_size">
                <div style="position: relative;top: 30%;text-indent: 2em;">
                    <%=ots.get(0).getInstruction() %>
                </div>
            </div>
        </div>
        <div id="item2" class="item hide item2">
            <div class="item item2_box">
                <div class="item2_topic">
                    <div id="topic" class="item2_ti font_size">
                    </div>
                </div>
                <div class="item2_ans_box" style="">
                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_A">

                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_B">

                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_C">

                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_D">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="/lattice/js/jquery.3.4.1.js"></script>
<script src="/lattice/js/bootstrap.min.3.3.1.js"></script>
<script type="text/javascript" src="/lattice/js/oneui/common_utils.js"></script>
<script>
    $(function () {
        //data1为正式测验数据，data2为练习测验数据
        var data1=[
            {"ID":"1","ans":"A","TU":"一个长方形的宽是2厘米，长是宽的3倍，长方形的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"12","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"5","CTAU":"true","D":"D","DTU":"10","DTAU":"true"},
            {"ID":"2","ans":"A","TU":"用一根长30厘米的铁丝，围成一个长为10厘米的长方形．这个长方形的面积为多少平方厘米？","TAU":"true","A":"A","ATU":"50","ATAU":"true","B":"B","BTU":"200","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"250","DTAU":"true"},
            {"ID":"3","ans":"A","TU":"一个正方形果园的周长是400米，它的占地面积是多少平方米？","TAU":"true","A":"A","ATU":"10000","ATAU":"true","B":"B","BTU":"1000","BTAU":"true","C":"C","CTU":"100","CTAU":"true","D":"D","DTU":"2000","DTAU":"true"},
            {"ID":"4","ans":"A","TU":"一个长6米，宽4米，深2米的水池的占地面积是多少平方米？","TAU":"true","A":"A","ATU":"24","ATAU":"true","B":"B","BTU":"42","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"5","ans":"A","TU":"从一张长10米，宽8米的长方形纸上剪一个最大的正方形，剩下图形的面积是多少平方米？","TAU":"true","A":"A","ATU":"16","ATAU":"true","B":"B","BTU":"20","BTAU":"true","C":"C","CTU":"800","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"6","ans":"A","TU":"一块长方形菜地，长7米，宽9米，面积是多少平方米？","TAU":"true","A":"A","ATU":"63","ATAU":"true","B":"B","BTU":"16","BTAU":"true","C":"C","CTU":"32","CTAU":"true","D":"D","DTU":"64","DTAU":"true"},
            {"ID":"7","ans":"A","TU":"一个长方形的宽不变，长增加了3厘米，面积就增加了12平方厘米，它的宽是多少厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"无法确定","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"8","ans":"A","TU":"一个长方形宽6米，长8米，从这个长方形中剪下一个最大的正方形，这个正方形的面积是多少米？","TAU":"true","A":"A","ATU":"36","ATAU":"true","B":"B","BTU":"49","BTAU":"true","C":"C","CTU":"64","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"9","ans":"A","TU":"已知长方形的长是6cm，宽是3cm，长和宽各增加2cm后，面积变为？","TAU":"true","A":"A","ATU":"40","ATAU":"true","B":"B","BTU":"18","BTAU":"true","C":"C","CTU":"4","CTAU":"true","D":"D","DTU":"20","DTAU":"true"},
            {"ID":"10","ans":"A","TU":"一间美术教室的长约5米，宽约4米，几间这样的美术教室的面积是100平方米？","TAU":"true","A":"A","ATU":"5","ATAU":"true","B":"B","BTU":"20","BTAU":"true","C":"C","CTU":"200","CTAU":"true","D":"D","DTU":"15","DTAU":"true"},
            {"ID":"11","ans":"A","TU":"学校有一个长方形花圃，长12米，宽5米；还有一个正方形苗圃，边长8米。花圃与苗圃比，谁的面积大？","TAU":"true","A":"A","ATU":"正方形苗圃","ATAU":"true","B":"B","BTU":"长方形花圃","BTAU":"true","C":"C","CTU":"一样大","CTAU":"true","D":"D","DTU":"无法确定","DTAU":"true"},
            {"ID":"12","ans":"A","TU":"正方形边长为2厘米，若边长增加1厘米，则周长增加多少厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"13","ans":"A","TU":"把一根长20分米的铁线围成一个正方形框架，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"25","ATAU":"true","B":"B","BTU":"400","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"40","DTAU":"true"},
            {"ID":"14","ans":"A","TU":"有两个大小一样的长方形，长都是6厘米，宽都是3厘米，如果拼成一个正方形，周长应是多少厘米？","TAU":"true","A":"A","ATU":"24","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"18","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"15","ans":"A","TU":"一个长方形，长是12厘米，如果宽增加5厘米，则周长增加多少厘米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"17","BTAU":"true","C":"C","CTU":"34","CTAU":"true","D":"D","DTU":"68","DTAU":"true"},
            {"ID":"16","ans":"A","TU":"长方形周长为54厘米，长为20厘米，则宽为多少厘米？","TAU":"true","A":"A","ATU":"7","ATAU":"true","B":"B","BTU":"14","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"17","ans":"A","TU":"把一个边长为5米的正方形木条框拉成一个平行四边形，这个平行四边形的周长是多少米？","TAU":"true","A":"A","ATU":"20","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"10","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"18","ans":"A","TU":"一个正方形的周长是24厘米，它的边长是多少厘米？","TAU":"true","A":"A","ATU":"6","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"96","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"19","ans":"A","TU":"长8厘米，周长为20厘米的长方形，它的宽是多少厘米？","TAU":"true","A":"A","ATU":"2","ATAU":"true","B":"B","BTU":"4","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"20","ans":"A","TU":"边长是4厘米的正方形，它的周长和面积？","TAU":"true","A":"A","ATU":"相等","ATAU":"true","B":"B","BTU":"不相等","BTAU":"true","C":"C","CTU":"无法比较","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"21","ans":"A","TU":"周长为8厘米的正方形的边长为多少厘米？","TAU":"true","A":"A","ATU":"2","ATAU":"true","B":"B","BTU":"4","BTAU":"true","C":"C","CTU":"16","CTAU":"true","D":"D","DTU":"12","DTAU":"true"},
            {"ID":"22","ans":"A","TU":"一个长方形的周长为20厘米，长为7厘米，宽为多少厘米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"13","CTAU":"true","D":"D","DTU":"6","DTAU":"true"},
            {"ID":"23","ans":"A","TU":"一个正方形的周长是24厘米，它的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"36","ATAU":"true","B":"B","BTU":"96","BTAU":"true","C":"C","CTU":"576","CTAU":"true","D":"D","DTU":"72","DTAU":"true"},
            {"ID":"24","ans":"B","TU":"长方体冰柜长是80厘米，宽是50厘米，高是56厘米，这个冰柜的占地面积是多少平方分米？","TAU":"true","A":"A","ATU":"28","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"44","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"25","ans":"B","TU":"从一张长14厘米，宽10厘米的长方形纸上剪出一个最大的正方形，剩下部分的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"100","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"140","DTAU":"true"},
            {"ID":"26","ans":"B","TU":"一个长方形长6厘米，宽4厘米，把它平均分成两个同样大小的小长方形，每个小长方形的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"60","DTAU":"true"},
            {"ID":"27","ans":"B","TU":"一个边长为2厘米的正方形，把它的边长扩大1倍，它的面积变为多少平方厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"16","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"28","ans":"B","TU":"教室的地面长9米，宽6米，用边长1米的方砖铺地，至少需要多少块？","TAU":"true","A":"A","ATU":"45","ATAU":"true","B":"B","BTU":"54","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"29","ans":"B","TU":"长方形长5分米，宽1分米，面积是多少平方分米？","TAU":"true","A":"A","ATU":"50","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"500","CTAU":"true","D":"D","DTU":"300","DTAU":"true"},
            {"ID":"30","ans":"B","TU":"小红从一张长10厘米，宽6厘米的长方形纸上剪下一个最大的正方形，剩下部分的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"40","ATAU":"true","B":"B","BTU":"24","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"31","ans":"B","TU":"用三个长都是4分米，宽都是3分米的长方形拼成一个长方形，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"12","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"48","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"32","ans":"B","TU":"一个正方形花圃，它的周长是4米，面积是多少平方米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"1","BTAU":"true","C":"C","CTU":"16","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"33","ans":"B","TU":"一块正方形绿地面积是36平方米，边长增加2米，扩大后绿地面积是多少平方米？","TAU":"true","A":"A","ATU":"48","ATAU":"true","B":"B","BTU":"64","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"34","ans":"B","TU":"小明家的田地长488米，宽566米，那么他家田地的面积是多少平方米？","TAU":"true","A":"A","ATU":"（488+566）×2","ATAU":"true","B":"B","BTU":"488×566","BTAU":"true","C":"C","CTU":"488×566×2","CTAU":"true","D":"D","DTU":"488X4","DTAU":"true"},
            {"ID":"35","ans":"C","TU":"一块边长是10米的正方形菜地，边长增加10米，菜地面积增加多少平方米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"100","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"200","DTAU":"true"},
            {"ID":"36","ans":"C","TU":"一块正方形手帕，边长是20厘米，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"400","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"4","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"37","ans":"C","TU":"一个长方体，长9分米，宽7分米，高4分米，放在地面上，占地面积最小是多少平方分米？","TAU":"true","A":"A","ATU":"63","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"38","ans":"C","TU":"边长是1米的正方形，可以分成几个边长是1分米的小正方形？","TAU":"true","A":"A","ATU":"1","ATAU":"true","B":"B","BTU":"10","BTAU":"true","C":"C","CTU":"100","CTAU":"true","D":"D","DTU":"1000","DTAU":"true"},
            {"ID":"39","ans":"C","TU":"一块长方形绿地，长9米，宽4米，长不变，宽增加到8米，扩大后绿地周长是多少米？","TAU":"true","A":"A","ATU":"16","ATAU":"true","B":"B","BTU":"26","BTAU":"true","C":"C","CTU":"34","CTAU":"true","D":"D","DTU":"14","DTAU":"true"},
            {"ID":"40","ans":"C","TU":"一张长10厘米，宽6厘米的纸，如果它的四个角各剪去一个边长是2厘米的正方形，剩下的纸片的周长与原长方形的周长比？","TAU":"true","A":"A","ATU":"减少","ATAU":"true","B":"B","BTU":"增加","BTAU":"true","C":"C","CTU":"不变","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"41","ans":"C","TU":"王奶奶用篱笆围一个长方形的花圃，长3米，宽2米，需要多少米长的篱笆？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"10","CTAU":"true","D":"D","DTU":"15","DTAU":"true"},
            {"ID":"42","ans":"C","TU":"在一张长8cm、宽6cm的长方形纸上剪下一个最大的正方形，这个正方形的周长是多少厘米？","TAU":"true","A":"A","ATU":"14","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"24","CTAU":"true","D":"D","DTU":"28","DTAU":"true"},
            {"ID":"43","ans":"C","TU":"强强沿着边长50米的正方形跑道跑了5圈，共跑了多少米？","TAU":"true","A":"A","ATU":"250","ATAU":"true","B":"B","BTU":"800","BTAU":"true","C":"C","CTU":"1000","CTAU":"true","D":"D","DTU":"500","DTAU":"true"},
            {"ID":"44","ans":"A","TU":"边长是多少的正方形，它的面积是1平方米？","TAU":"true","A":"A","ATU":"1米","ATAU":"true","B":"B","BTU":"1分米","BTAU":"true","C":"C","CTU":"1厘米","CTAU":"true","D":"D","DTU":"10厘米","DTAU":"true"},
            {"ID":"45","ans":"B","TU":"边长是10分米的正方形，面积是多少平方分米？","TAU":"true","A":"A","ATU":"10平方分米","ATAU":"true","B":"B","BTU":"100平方分米","BTAU":"true","C":"C","CTU":"100平方厘米","CTAU":"true","D":"D","DTU":"10平方米","DTAU":"true"},
            {"ID":"46","ans":"B","TU":"一个长方形长是10米，宽是6米，它的面积是？","TAU":"true","A":"A","ATU":"60平方厘米","ATAU":"true","B":"B","BTU":"60平方米","BTAU":"true","C":"C","CTU":"60米","CTAU":"true","D":"D","DTU":"60厘米","DTAU":"true"},
            {"ID":"47","ans":"B","TU":"一个长方形花坛，长50米，宽40米，这个花坛的占地面积是？","TAU":"true","A":"A","ATU":"2000米","ATAU":"true","B":"B","BTU":"2000平方米","BTAU":"true","C":"C","CTU":"180米","CTAU":"true","D":"D","DTU":"180平方米","DTAU":"true"},
            {"ID":"48","ans":"B","TU":"一块正方形果园的边长是40米，这个果园的周长是？","TAU":"true","A":"A","ATU":"1600平方米","ATAU":"true","B":"B","BTU":"160米","BTAU":"true","C":"C","CTU":"160平方米","CTAU":"true","D":"D","DTU":"1600米","DTAU":"true"},
            {"ID":"49","ans":"B","TU":"在长4米，宽2米的黑板里面画一幅最大的正方形宣传画，这幅宣传画面积是？","TAU":"true","A":"A","ATU":"16米","ATAU":"true","B":"B","BTU":"4平方米","BTAU":"true","C":"C","CTU":"16平方米","CTAU":"true","D":"D","DTU":"4米","DTAU":"true"},
            {"ID":"50","ans":"C","TU":"边长是300米的正方形草地，占地面积是？","TAU":"true","A":"A","ATU":"9平方米","ATAU":"true","B":"B","BTU":"9公顷","BTAU":"true","C":"C","CTU":"90平方千米","CTAU":"true","D":"D","DTU":"9平方厘米","DTAU":"true"},
            {"ID":"51","ans":"C","TU":"把2个边长是3厘米的正方形拼成一个长方形，这个长方形的面积是？","TAU":"true","A":"A","ATU":"18厘米","ATAU":"true","B":"B","BTU":"24平方厘米","BTAU":"true","C":"C","CTU":"18平方厘米","CTAU":"true","D":"D","DTU":"18平方米","DTAU":"true"},
            {"ID":"52","ans":"C","TU":"学校操场长20米，宽5米，面积是？","TAU":"true","A":"A","ATU":"1000平方米","ATAU":"true","B":"B","BTU":"1平方千米","BTAU":"true","C":"C","CTU":"100平方米","CTAU":"true","D":"D","DTU":"10平方米","DTAU":"true"},
            {"ID":"53","ans":"C","TU":"面积是1平方米的正方形，它的边长是？","TAU":"true","A":"A","ATU":"1分米","ATAU":"true","B":"B","BTU":"10厘米","BTAU":"true","C":"C","CTU":"10分米","CTAU":"true","D":"D","DTU":"10米","DTAU":"true"},
            {"ID":"54","ans":"C","TU":"一个广场长50米，宽80米，占地面积是？","TAU":"true","A":"A","ATU":"40平方米","ATAU":"true","B":"B","BTU":"400平方米","BTAU":"true","C":"C","CTU":"4000平方米","CTAU":"true","D":"D","DTU":"400平方厘米","DTAU":"true"},
            {"ID":"55","ans":"C","TU":"一块地的长是600厘米，宽是200厘米，这块地的周长是？","TAU":"true","A":"A","ATU":"1200平方厘米","ATAU":"true","B":"B","BTU":"1200平方米","BTAU":"true","C":"C","CTU":"1600厘米","CTAU":"true","D":"D","DTU":"1200平方公里","DTAU":"true"},
            {"ID":"56","ans":"C","TU":"一个大长方形的长是10厘米，宽是8厘米，小长方形的长和宽都是大长方形长和宽的一半，小长方形的面积是？","TAU":"true","A":"A","ATU":"20厘米","ATAU":"true","B":"B","BTU":"80平方厘米","BTAU":"true","C":"C","CTU":"20平方厘米","CTAU":"true","D":"D","DTU":"20平方米","DTAU":"true"},
            {"ID":"57","ans":"C","TU":"两个边长是4cm的正方形，拼成一个长方形，这个长方形的周长是？","TAU":"true","A":"A","ATU":"6厘米","ATAU":"true","B":"B","BTU":"12厘米","BTAU":"true","C":"C","CTU":"24厘米","CTAU":"true","D":"D","DTU":"32厘米","DTAU":"true"},
            {"ID":"58","ans":"D","TU":"一个长方体水池长30米，宽20米，深1.5米，这个水池占地面积是多少平方米？","TAU":"true","A":"A","ATU":"900","ATAU":"true","B":"B","BTU":"1200","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"600","DTAU":"true"},
            {"ID":"59","ans":"D","TU":"一个正方形的周长是20厘米，它的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"20","ATAU":"true","B":"B","BTU":"60","BTAU":"true","C":"C","CTU":"80","CTAU":"true","D":"D","DTU":"25","DTAU":"true"},
            {"ID":"60","ans":"D","TU":"一个长方形的长是9米，宽是5米，这个长方形的周长是多少米？","TAU":"true","A":"A","ATU":"14","ATAU":"true","B":"B","BTU":"7","BTAU":"true","C":"C","CTU":"45","CTAU":"true","D":"D","DTU":"28","DTAU":"true"},
            {"ID":"61","ans":"D","TU":"用一张长8厘米，宽5厘米的长方形纸剪一个最大的正方形，这个正方形的边长是多少厘米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"9","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"5","DTAU":"true"},
            {"ID":"62","ans":"D","TU":"一个长方形的长是6米，宽是4米，这个长方形的周长是多少米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"24","CTAU":"true","D":"D","DTU":"20","DTAU":"true"},
            {"ID":"63","ans":"D","TU":"一根铁丝正好围成边长为8厘米的正方形，用同样长的铁丝围成宽6厘米的长方形，长最大是多少米？","TAU":"true","A":"A","ATU":"8","ATAU":"true","B":"B","BTU":"24","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"10","DTAU":"true"},
            {"ID":"64","ans":"D","TU":"用一根长12米的铁丝围成一个正方形，这个正方形的面积是多少平方米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"9","DTAU":"true"},
            {"ID":"65","ans":"D","TU":"从一张长20厘米，宽15厘米的长方形纸上剪下一个最大的正方形，这个正方形的周长是？","TAU":"true","A":"A","ATU":"30厘米","ATAU":"true","B":"B","BTU":"40厘米","BTAU":"true","C":"C","CTU":"50厘米","CTAU":"true","D":"D","DTU":"60厘米","DTAU":"true"},
            {"ID":"66","ans":"D","TU":"长方形的长是8厘米，宽是长的一半，周长是多少厘米？","TAU":"true","A":"A","ATU":"8","ATAU":"true","B":"B","BTU":"64","BTAU":"true","C":"C","CTU":"32","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"67","ans":"D","TU":"边长4米的正方形，周长是？","TAU":"true","A":"A","ATU":"4平方米","ATAU":"true","B":"B","BTU":"32米","BTAU":"true","C":"C","CTU":"16平方米","CTAU":"true","D":"D","DTU":"16米","DTAU":"true"},
            {"ID":"68","ans":"D","TU":"一个正方形花坛的周长是36米，它的边长是？","TAU":"true","A":"A","ATU":"6米","ATAU":"true","B":"B","BTU":"24米","BTAU":"true","C":"C","CTU":"12米","CTAU":"true","D":"D","DTU":"9米","DTAU":"true"}
        ];
        var data2=[
            {"ID":"1","ans":"A","TU":"一个长方形的宽是2厘米，长是宽的3倍，长方形的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"12","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"5","CTAU":"true","D":"D","DTU":"10","DTAU":"true"},
            {"ID":"2","ans":"A","TU":"用一根长30厘米的铁丝，围成一个长为10厘米的长方形．这个长方形的面积为多少平方厘米？","TAU":"true","A":"A","ATU":"50","ATAU":"true","B":"B","BTU":"200","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"250","DTAU":"true"},
            {"ID":"3","ans":"A","TU":"一个正方形果园的周长是400米，它的占地面积是多少平方米？","TAU":"true","A":"A","ATU":"10000","ATAU":"true","B":"B","BTU":"1000","BTAU":"true","C":"C","CTU":"100","CTAU":"true","D":"D","DTU":"2000","DTAU":"true"},
            {"ID":"4","ans":"A","TU":"一个长6米，宽4米，深2米的水池的占地面积是多少平方米？","TAU":"true","A":"A","ATU":"24","ATAU":"true","B":"B","BTU":"42","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"5","ans":"A","TU":"从一张长10米，宽8米的长方形纸上剪一个最大的正方形，剩下图形的面积是多少平方米？","TAU":"true","A":"A","ATU":"16","ATAU":"true","B":"B","BTU":"20","BTAU":"true","C":"C","CTU":"800","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"6","ans":"A","TU":"一块长方形菜地，长7米，宽9米，面积是多少平方米？","TAU":"true","A":"A","ATU":"63","ATAU":"true","B":"B","BTU":"16","BTAU":"true","C":"C","CTU":"32","CTAU":"true","D":"D","DTU":"64","DTAU":"true"},
            {"ID":"7","ans":"A","TU":"一个长方形的宽不变，长增加了3厘米，面积就增加了12平方厘米，它的宽是多少厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"无法确定","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"8","ans":"A","TU":"一个长方形宽6米，长8米，从这个长方形中剪下一个最大的正方形，这个正方形的面积是多少米？","TAU":"true","A":"A","ATU":"36","ATAU":"true","B":"B","BTU":"49","BTAU":"true","C":"C","CTU":"64","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"9","ans":"A","TU":"已知长方形的长是6cm，宽是3cm，长和宽各增加2cm后，面积变为？","TAU":"true","A":"A","ATU":"40","ATAU":"true","B":"B","BTU":"18","BTAU":"true","C":"C","CTU":"4","CTAU":"true","D":"D","DTU":"20","DTAU":"true"},
            {"ID":"10","ans":"A","TU":"一间美术教室的长约5米，宽约4米，几间这样的美术教室的面积是100平方米？","TAU":"true","A":"A","ATU":"5","ATAU":"true","B":"B","BTU":"20","BTAU":"true","C":"C","CTU":"200","CTAU":"true","D":"D","DTU":"15","DTAU":"true"},
            {"ID":"11","ans":"A","TU":"学校有一个长方形花圃，长12米，宽5米；还有一个正方形苗圃，边长8米。花圃与苗圃比，谁的面积大？","TAU":"true","A":"A","ATU":"正方形苗圃","ATAU":"true","B":"B","BTU":"长方形花圃","BTAU":"true","C":"C","CTU":"一样大","CTAU":"true","D":"D","DTU":"无法确定","DTAU":"true"},
            {"ID":"12","ans":"A","TU":"正方形边长为2厘米，若边长增加1厘米，则周长增加多少厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"13","ans":"A","TU":"把一根长20分米的铁线围成一个正方形框架，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"25","ATAU":"true","B":"B","BTU":"400","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"40","DTAU":"true"},
            {"ID":"14","ans":"A","TU":"有两个大小一样的长方形，长都是6厘米，宽都是3厘米，如果拼成一个正方形，周长应是多少厘米？","TAU":"true","A":"A","ATU":"24","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"18","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"15","ans":"A","TU":"一个长方形，长是12厘米，如果宽增加5厘米，则周长增加多少厘米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"17","BTAU":"true","C":"C","CTU":"34","CTAU":"true","D":"D","DTU":"68","DTAU":"true"},
            {"ID":"16","ans":"A","TU":"长方形周长为54厘米，长为20厘米，则宽为多少厘米？","TAU":"true","A":"A","ATU":"7","ATAU":"true","B":"B","BTU":"14","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"17","ans":"A","TU":"把一个边长为5米的正方形木条框拉成一个平行四边形，这个平行四边形的周长是多少米？","TAU":"true","A":"A","ATU":"20","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"10","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"18","ans":"A","TU":"一个正方形的周长是24厘米，它的边长是多少厘米？","TAU":"true","A":"A","ATU":"6","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"96","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"19","ans":"A","TU":"长8厘米，周长为20厘米的长方形，它的宽是多少厘米？","TAU":"true","A":"A","ATU":"2","ATAU":"true","B":"B","BTU":"4","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"20","ans":"A","TU":"边长是4厘米的正方形，它的周长和面积？","TAU":"true","A":"A","ATU":"相等","ATAU":"true","B":"B","BTU":"不相等","BTAU":"true","C":"C","CTU":"无法比较","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"21","ans":"A","TU":"周长为8厘米的正方形的边长为多少厘米？","TAU":"true","A":"A","ATU":"2","ATAU":"true","B":"B","BTU":"4","BTAU":"true","C":"C","CTU":"16","CTAU":"true","D":"D","DTU":"12","DTAU":"true"},
            {"ID":"22","ans":"A","TU":"一个长方形的周长为20厘米，长为7厘米，宽为多少厘米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"13","CTAU":"true","D":"D","DTU":"6","DTAU":"true"},
            {"ID":"23","ans":"A","TU":"一个正方形的周长是24厘米，它的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"36","ATAU":"true","B":"B","BTU":"96","BTAU":"true","C":"C","CTU":"576","CTAU":"true","D":"D","DTU":"72","DTAU":"true"},
            {"ID":"24","ans":"B","TU":"长方体冰柜长是80厘米，宽是50厘米，高是56厘米，这个冰柜的占地面积是多少平方分米？","TAU":"true","A":"A","ATU":"28","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"44","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"25","ans":"B","TU":"从一张长14厘米，宽10厘米的长方形纸上剪出一个最大的正方形，剩下部分的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"100","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"140","DTAU":"true"},
            {"ID":"26","ans":"B","TU":"一个长方形长6厘米，宽4厘米，把它平均分成两个同样大小的小长方形，每个小长方形的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"12","BTAU":"true","C":"C","CTU":"20","CTAU":"true","D":"D","DTU":"60","DTAU":"true"},
            {"ID":"27","ans":"B","TU":"一个边长为2厘米的正方形，把它的边长扩大1倍，它的面积变为多少平方厘米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"16","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"28","ans":"B","TU":"教室的地面长9米，宽6米，用边长1米的方砖铺地，至少需要多少块？","TAU":"true","A":"A","ATU":"45","ATAU":"true","B":"B","BTU":"54","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"32","DTAU":"true"},
            {"ID":"29","ans":"B","TU":"长方形长5分米，宽1分米，面积是多少平方分米？","TAU":"true","A":"A","ATU":"50","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"500","CTAU":"true","D":"D","DTU":"300","DTAU":"true"},
            {"ID":"30","ans":"B","TU":"小红从一张长10厘米，宽6厘米的长方形纸上剪下一个最大的正方形，剩下部分的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"40","ATAU":"true","B":"B","BTU":"24","BTAU":"true","C":"C","CTU":"60","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"31","ans":"B","TU":"用三个长都是4分米，宽都是3分米的长方形拼成一个长方形，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"12","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"48","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"32","ans":"B","TU":"一个正方形花圃，它的周长是4米，面积是多少平方米？","TAU":"true","A":"A","ATU":"4","ATAU":"true","B":"B","BTU":"1","BTAU":"true","C":"C","CTU":"16","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"33","ans":"B","TU":"一块正方形绿地面积是36平方米，边长增加2米，扩大后绿地面积是多少平方米？","TAU":"true","A":"A","ATU":"48","ATAU":"true","B":"B","BTU":"64","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"34","ans":"B","TU":"小明家的田地长488米，宽566米，那么他家田地的面积是多少平方米？","TAU":"true","A":"A","ATU":"（488+566）×2","ATAU":"true","B":"B","BTU":"488×566","BTAU":"true","C":"C","CTU":"488×566×2","CTAU":"true","D":"D","DTU":"488X4","DTAU":"true"},
            {"ID":"35","ans":"C","TU":"一块边长是10米的正方形菜地，边长增加10米，菜地面积增加多少平方米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"100","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"200","DTAU":"true"},
            {"ID":"36","ans":"C","TU":"一块正方形手帕，边长是20厘米，它的面积是多少平方分米？","TAU":"true","A":"A","ATU":"400","ATAU":"true","B":"B","BTU":"40","BTAU":"true","C":"C","CTU":"4","CTAU":"true","D":"D","DTU":"8","DTAU":"true"},
            {"ID":"37","ans":"C","TU":"一个长方体，长9分米，宽7分米，高4分米，放在地面上，占地面积最小是多少平方分米？","TAU":"true","A":"A","ATU":"63","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"16","DTAU":"true"},
            {"ID":"38","ans":"C","TU":"边长是1米的正方形，可以分成几个边长是1分米的小正方形？","TAU":"true","A":"A","ATU":"1","ATAU":"true","B":"B","BTU":"10","BTAU":"true","C":"C","CTU":"100","CTAU":"true","D":"D","DTU":"1000","DTAU":"true"},
            {"ID":"39","ans":"C","TU":"一块长方形绿地，长9米，宽4米，长不变，宽增加到8米，扩大后绿地周长是多少米？","TAU":"true","A":"A","ATU":"16","ATAU":"true","B":"B","BTU":"26","BTAU":"true","C":"C","CTU":"34","CTAU":"true","D":"D","DTU":"14","DTAU":"true"},
            {"ID":"40","ans":"C","TU":"一张长10厘米，宽6厘米的纸，如果它的四个角各剪去一个边长是2厘米的正方形，剩下的纸片的周长与原长方形的周长比？","TAU":"true","A":"A","ATU":"减少","ATAU":"true","B":"B","BTU":"增加","BTAU":"true","C":"C","CTU":"不变","CTAU":"true","D":"D","DTU":"不确定","DTAU":"true"},
            {"ID":"41","ans":"C","TU":"王奶奶用篱笆围一个长方形的花圃，长3米，宽2米，需要多少米长的篱笆？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"10","CTAU":"true","D":"D","DTU":"15","DTAU":"true"},
            {"ID":"42","ans":"C","TU":"在一张长8cm、宽6cm的长方形纸上剪下一个最大的正方形，这个正方形的周长是多少厘米？","TAU":"true","A":"A","ATU":"14","ATAU":"true","B":"B","BTU":"36","BTAU":"true","C":"C","CTU":"24","CTAU":"true","D":"D","DTU":"28","DTAU":"true"},
            {"ID":"43","ans":"C","TU":"强强沿着边长50米的正方形跑道跑了5圈，共跑了多少米？","TAU":"true","A":"A","ATU":"250","ATAU":"true","B":"B","BTU":"800","BTAU":"true","C":"C","CTU":"1000","CTAU":"true","D":"D","DTU":"500","DTAU":"true"},
            {"ID":"44","ans":"A","TU":"边长是多少的正方形，它的面积是1平方米？","TAU":"true","A":"A","ATU":"1米","ATAU":"true","B":"B","BTU":"1分米","BTAU":"true","C":"C","CTU":"1厘米","CTAU":"true","D":"D","DTU":"10厘米","DTAU":"true"},
            {"ID":"45","ans":"B","TU":"边长是10分米的正方形，面积是多少平方分米？","TAU":"true","A":"A","ATU":"10平方分米","ATAU":"true","B":"B","BTU":"100平方分米","BTAU":"true","C":"C","CTU":"100平方厘米","CTAU":"true","D":"D","DTU":"10平方米","DTAU":"true"},
            {"ID":"46","ans":"B","TU":"一个长方形长是10米，宽是6米，它的面积是？","TAU":"true","A":"A","ATU":"60平方厘米","ATAU":"true","B":"B","BTU":"60平方米","BTAU":"true","C":"C","CTU":"60米","CTAU":"true","D":"D","DTU":"60厘米","DTAU":"true"},
            {"ID":"47","ans":"B","TU":"一个长方形花坛，长50米，宽40米，这个花坛的占地面积是？","TAU":"true","A":"A","ATU":"2000米","ATAU":"true","B":"B","BTU":"2000平方米","BTAU":"true","C":"C","CTU":"180米","CTAU":"true","D":"D","DTU":"180平方米","DTAU":"true"},
            {"ID":"48","ans":"B","TU":"一块正方形果园的边长是40米，这个果园的周长是？","TAU":"true","A":"A","ATU":"1600平方米","ATAU":"true","B":"B","BTU":"160米","BTAU":"true","C":"C","CTU":"160平方米","CTAU":"true","D":"D","DTU":"1600米","DTAU":"true"},
            {"ID":"49","ans":"B","TU":"在长4米，宽2米的黑板里面画一幅最大的正方形宣传画，这幅宣传画面积是？","TAU":"true","A":"A","ATU":"16米","ATAU":"true","B":"B","BTU":"4平方米","BTAU":"true","C":"C","CTU":"16平方米","CTAU":"true","D":"D","DTU":"4米","DTAU":"true"},
            {"ID":"50","ans":"C","TU":"边长是300米的正方形草地，占地面积是？","TAU":"true","A":"A","ATU":"9平方米","ATAU":"true","B":"B","BTU":"9公顷","BTAU":"true","C":"C","CTU":"90平方千米","CTAU":"true","D":"D","DTU":"9平方厘米","DTAU":"true"},
            {"ID":"51","ans":"C","TU":"把2个边长是3厘米的正方形拼成一个长方形，这个长方形的面积是？","TAU":"true","A":"A","ATU":"18厘米","ATAU":"true","B":"B","BTU":"24平方厘米","BTAU":"true","C":"C","CTU":"18平方厘米","CTAU":"true","D":"D","DTU":"18平方米","DTAU":"true"},
            {"ID":"52","ans":"C","TU":"学校操场长20米，宽5米，面积是？","TAU":"true","A":"A","ATU":"1000平方米","ATAU":"true","B":"B","BTU":"1平方千米","BTAU":"true","C":"C","CTU":"100平方米","CTAU":"true","D":"D","DTU":"10平方米","DTAU":"true"},
            {"ID":"53","ans":"C","TU":"面积是1平方米的正方形，它的边长是？","TAU":"true","A":"A","ATU":"1分米","ATAU":"true","B":"B","BTU":"10厘米","BTAU":"true","C":"C","CTU":"10分米","CTAU":"true","D":"D","DTU":"10米","DTAU":"true"},
            {"ID":"54","ans":"C","TU":"一个广场长50米，宽80米，占地面积是？","TAU":"true","A":"A","ATU":"40平方米","ATAU":"true","B":"B","BTU":"400平方米","BTAU":"true","C":"C","CTU":"4000平方米","CTAU":"true","D":"D","DTU":"400平方厘米","DTAU":"true"},
            {"ID":"55","ans":"C","TU":"一块地的长是600厘米，宽是200厘米，这块地的周长是？","TAU":"true","A":"A","ATU":"1200平方厘米","ATAU":"true","B":"B","BTU":"1200平方米","BTAU":"true","C":"C","CTU":"1600厘米","CTAU":"true","D":"D","DTU":"1200平方公里","DTAU":"true"},
            {"ID":"56","ans":"C","TU":"一个大长方形的长是10厘米，宽是8厘米，小长方形的长和宽都是大长方形长和宽的一半，小长方形的面积是？","TAU":"true","A":"A","ATU":"20厘米","ATAU":"true","B":"B","BTU":"80平方厘米","BTAU":"true","C":"C","CTU":"20平方厘米","CTAU":"true","D":"D","DTU":"20平方米","DTAU":"true"},
            {"ID":"57","ans":"C","TU":"两个边长是4cm的正方形，拼成一个长方形，这个长方形的周长是？","TAU":"true","A":"A","ATU":"6厘米","ATAU":"true","B":"B","BTU":"12厘米","BTAU":"true","C":"C","CTU":"24厘米","CTAU":"true","D":"D","DTU":"32厘米","DTAU":"true"},
            {"ID":"58","ans":"D","TU":"一个长方体水池长30米，宽20米，深1.5米，这个水池占地面积是多少平方米？","TAU":"true","A":"A","ATU":"900","ATAU":"true","B":"B","BTU":"1200","BTAU":"true","C":"C","CTU":"300","CTAU":"true","D":"D","DTU":"600","DTAU":"true"},
            {"ID":"59","ans":"D","TU":"一个正方形的周长是20厘米，它的面积是多少平方厘米？","TAU":"true","A":"A","ATU":"20","ATAU":"true","B":"B","BTU":"60","BTAU":"true","C":"C","CTU":"80","CTAU":"true","D":"D","DTU":"25","DTAU":"true"},
            {"ID":"60","ans":"D","TU":"一个长方形的长是9米，宽是5米，这个长方形的周长是多少米？","TAU":"true","A":"A","ATU":"14","ATAU":"true","B":"B","BTU":"7","BTAU":"true","C":"C","CTU":"45","CTAU":"true","D":"D","DTU":"28","DTAU":"true"},
            {"ID":"61","ans":"D","TU":"用一张长8厘米，宽5厘米的长方形纸剪一个最大的正方形，这个正方形的边长是多少厘米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"9","BTAU":"true","C":"C","CTU":"8","CTAU":"true","D":"D","DTU":"5","DTAU":"true"},
            {"ID":"62","ans":"D","TU":"一个长方形的长是6米，宽是4米，这个长方形的周长是多少米？","TAU":"true","A":"A","ATU":"10","ATAU":"true","B":"B","BTU":"5","BTAU":"true","C":"C","CTU":"24","CTAU":"true","D":"D","DTU":"20","DTAU":"true"},
            {"ID":"63","ans":"D","TU":"一根铁丝正好围成边长为8厘米的正方形，用同样长的铁丝围成宽6厘米的长方形，长最大是多少米？","TAU":"true","A":"A","ATU":"8","ATAU":"true","B":"B","BTU":"24","BTAU":"true","C":"C","CTU":"28","CTAU":"true","D":"D","DTU":"10","DTAU":"true"},
            {"ID":"64","ans":"D","TU":"用一根长12米的铁丝围成一个正方形，这个正方形的面积是多少平方米？","TAU":"true","A":"A","ATU":"3","ATAU":"true","B":"B","BTU":"6","BTAU":"true","C":"C","CTU":"12","CTAU":"true","D":"D","DTU":"9","DTAU":"true"},
            {"ID":"65","ans":"D","TU":"从一张长20厘米，宽15厘米的长方形纸上剪下一个最大的正方形，这个正方形的周长是？","TAU":"true","A":"A","ATU":"30厘米","ATAU":"true","B":"B","BTU":"40厘米","BTAU":"true","C":"C","CTU":"50厘米","CTAU":"true","D":"D","DTU":"60厘米","DTAU":"true"},
            {"ID":"66","ans":"D","TU":"长方形的长是8厘米，宽是长的一半，周长是多少厘米？","TAU":"true","A":"A","ATU":"8","ATAU":"true","B":"B","BTU":"64","BTAU":"true","C":"C","CTU":"32","CTAU":"true","D":"D","DTU":"24","DTAU":"true"},
            {"ID":"67","ans":"D","TU":"边长4米的正方形，周长是？","TAU":"true","A":"A","ATU":"4平方米","ATAU":"true","B":"B","BTU":"32米","BTAU":"true","C":"C","CTU":"16平方米","CTAU":"true","D":"D","DTU":"16米","DTAU":"true"},
            {"ID":"68","ans":"D","TU":"一个正方形花坛的周长是36米，它的边长是？","TAU":"true","A":"A","ATU":"6米","ATAU":"true","B":"B","BTU":"24米","BTAU":"true","C":"C","CTU":"12米","CTAU":"true","D":"D","DTU":"9米","DTAU":"true"}
        ];
        var taskid1="正式任务ID",taskid2="练习任务ID";
        var maxtime=100;
        var data=[];
        var data_index=0,data_click=false,spkey=true,data_number=0,errorNum=0;
        var time,beginTime,endTime;
        var timer=null,mouldTime,taskid;
        var time1=500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[];
        var practice_formal;
        taskid=getUrlParam("taskid");
        taskidFun(taskid);
        function topicFun(data_index){
            $("#item2_A").text(" ");
            $("#item2_B").text(" ");
            $("#item2_C").text(" ");
            $("#item2_D").text(" ");
            $("#topic").text(" ");
            $("#item2_A").attr("data-data",data[data_index].A);
            if(data[data_index].ATAU=="true"){
                $("#item2_A").append(
                    '<div>'+data[data_index].ATU+'</div>'
                )
            }else {
                $("#item2_A").append(
                    '<img src="'+data[data_index].ATU+'" alt="">'
                )
            }
            $("#item2_B").attr("data-data",data[data_index].B);
            if(data[data_index].BTAU=="true"){
                $("#item2_B").append(
                    '<div>'+data[data_index].BTU+'</div>'
                )
            }else {
                $("#item2_B").append(
                    '<img src="'+data[data_index].BTU+'" alt="">'
                )
            }
            $("#item2_C").attr("data-data",data[data_index].C);
            if(data[data_index].CTAU=="true"){
                $("#item2_C").append(
                    '<div>'+data[data_index].CTU+'</div>'
                )
            }else {
                $("#item2_C").append(
                    '<img src="'+data[data_index].CTU+'" alt="">'
                )
            }
            $("#item2_D").attr("data-data",data[data_index].D);
            if(data[data_index].DTAU=="true"){
                $("#item2_D").append(
                    '<div>'+data[data_index].DTU+'</div>'
                )
            }else {
                $("#item2_D").append(
                    '<img src="'+data[data_index].DTU+'" alt="">'
                )
            }

            if(data[data_index].TAU=="true"){
                $("#topic").append(
                    '<div>'+data[data_index].TU+'</div>'
                )
            }else {
                $("#topic").append(
                    '<img src="'+data[data_index].TU+'" alt="">'
                )
            }

        }
        $(".item2_set").on("click",function () {
            if(data_click){
                var key=$(this).attr("data-data");
                keyFun(key);
            }
        });
        function keyFun(key) {
            endTime=new Date().getTime();
            time=(endTime-beginTime).toFixed(0);
            var ans=data[data_index].ans;
            var ans1=key;
            stimidset.push(data[data_index].ID);
            type4set.push(type4Num);
            correctanswerset.push(ans);
            buttonset.push(ans1);
            timeset.push(time);
            $("#item2").addClass("op");
            if(!practice_formal){
                $("#ans").text(ans);
                $("#ans1").text(ans1);
                if(ans1 == ans){
                    $("#reward_text").text("答对了")
                }else {
                    $("#reward_text").text("答错了");
                }
            }else {
                if(ans1 != ans){
                    if(!mouldTime){
                        errorNum++;
                        if(errorNum>=6){
                            post_result();
                        }
                    }
                }
            }
            nextTopicFun()
        }
        function nextTopicFun() {
            $("#reward").removeClass("hide");
            data_index++;

            timer1=setInterval(function () {
                if(data_number<=data_index){
                    endFun();
                    clearInterval(timer);
                    timer=null;
                    return;
                }else {
                    topicFun(data_index);
                }
                $("#item2").removeClass("op");
                $("#reward_img").attr("src"," ");
                $("#reward").addClass("hide");
                data_click=true;
                beginTime=new Date().getTime();
                clearInterval(timer1);
                timer1=null;
            }, time1);

        }
        function endFun() {
            post_result();
        }
        function CountDown() {
            if (maxtime > 0) {
                --maxtime;
                $("#xs1").text(maxtime+"秒")
            } else{
                endFun();
                clearInterval(timer);
                timer=null;
            }
        }
        function pushArr(array) {
            $("#xs1").text(maxtime+"秒");
            for (var i = array.length - 1; i > 0; i--) {
                var j = Math.floor(Math.random() * (i + 1));
                var temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
        function taskidFun(taskid) {
            if(taskid === taskid1){
                data=data1;
                practice_formal=true;

            }else if(taskid === taskid2){
                data=data2;
                practice_formal=false;
            }
            pushArr(data);
        }
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        $(document).keydown(function (event) {
            var e = event || window.event;
            var k = e.keyCode || e.which;

            if(k==32){
                if(spkey){
                    spkey=false;
                    mouldTime=$("#input1[type='checkbox']").is(':checked');
                    data_number=data.length;
                    data_click=true;
                    topicFun(data_index);
                    $("#item1").addClass("hide");
                    $("#item2").removeClass("hide");
                    $("#xs1").text(maxtime+"秒");
                    if(practice_formal){
                        time1=300;
                        $("#reward_item").addClass("hide")
                    }else {
                        time1=2000;
                        $("#reward_item").removeClass("hide")
                    }
                    if(!mouldTime){
                        timer = setInterval(function () {
                            CountDown();
                        }, 1000);
                    }else {
                        type4Num="99";
                        time1=500;
                    }
                    beginTime=new Date().getTime();
                }
            }
        });
        function post_result() {
            // sumscore,meanscore,meanart;
            var opes_result_data = {};
            opes_result_data.taskid =<%= taskid %>;
            opes_result_data.sumitcoids =<%= sumitcoids %>;
            opes_result_data.targetpagename = "<%=targetpagename%>";
            opes_result_data.codematerial =<%= codematerial %>;
            opes_result_data.uid =<%= uid %>;
            opes_result_data.lan = "<%=lan%>";
            opes_result_data.projectid =<%= projectid %>;
            opes_result_data.duration = 0;
            opes_result_data.timeaverage = Math.round(0);
            opes_result_data.type4set = type4set.join(";");
            opes_result_data.stimidset = stimidset.join(";");
            opes_result_data.correctanswerset = correctanswerset.join(";");
            opes_result_data.time = "0";
            opes_result_data.level = "0";
            opes_result_data.timeset = timeset.join(";");
            opes_result_data.radioset = "";
            opes_result_data.buttonset = buttonset.join(";");
            opes_result_data.commentset = "0";
            opes_result_data.numset = "";
            opes_post_result_util_js_opes_post_result(opes_result_data);
            return;
        }
    })
</script>
</html>