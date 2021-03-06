<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="com.lattice.entity.*" %>
<%@ page language="java" import="com.lattice.dao.*,java.util.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数学</title>
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
<div id="box">
    <div id="xs" class="xianshi">
        <div>
            <div class="title_name" style="" id="xst"></div>
            <div class="title_num" style="" id="xs1"></div>
        </div>
        <div>
            <div class="title_name" id="xsn"></div>
            <div class="title_num" id="xs2">0</div>
        </div>
        <div>
            <div class="title_name" id="xsq"></div>
            <div class="title_num" id="xs3">0</div>
        </div>
    </div>
    <div id="reward" class="item hide" style="position: fixed;z-index: 1000">
        <div class="item itemImg">
            <img id="reward_img" class="img-rounded" src="" alt="">
        </div>
    </div>
    <div id="item1" class="item" style="background: #ff6700;">
        <div style="position: absolute;bottom: 0px;cursor: pointer;">
            <label style="cursor: pointer;" for="input1">
                <input id="input1" type="checkbox"><span id="bTime"></span>
            </label>
        </div>
        <div class="item1_text item1_imgBox1" style="">
            <div style="position: relative;top: 20%;">
                <span id="name"><%=realname %></span><span id="respectfully"></span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span><%=ots.get(0).getInstruction() %></span>
            </div>


        </div>

        <div class="item1_img item1_imgBox2">
            <img id="img1" src="taiyang.png" alt="">
        </div>
    </div>
    <div id="item2" class="item hide" style="background: #afdcff;">
        <div class="item" style="background-image: url('timg.gif');background-size: 100% 100%;">
            <div style="display: flex;align-items:center;justify-content:center;height: 50%;">
                <div id="topic" class="item2_ti">
                </div>
            </div>
            <div class="item2_ans_box" style="">
                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_A"></div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_B"></div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_C"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="item3" class="item hide" style="">
        <div style="z-index: 9999;position: fixed;right: 34px;bottom: 40px;text-align: right;">
            <button id="out" class="btn btn-danger btn-lg"></button>
        </div>
        <div class="container">
            <div class="row" style="margin: 16px 0px">
                <!--<div class="col-md-12">
                    <div id="main" style="width: 600px;height:400px;"></div>
                </div>-->
                <div class="col-md-12" style="display: flex;justify-content:center;">
                    <table class="table table-hover" style="width: 80%;">
                        <caption style="font-size: 24px;font-weight: 900;text-align: center;color: #000;" id="captionTitle"></caption>
                        <thead>
                        <tr>
                            <th id="th1"></th>
                            <th id="th2"></th>
                            <th id="th3"></th>
                            <th id="th4"></th>
                        </tr>
                        </thead>
                        <tbody id="topic_result">

                        </tbody>
                    </table>
                </div>
            </div>
            <!--<div class="row" style="margin: 16px 0px">
                <div class="statistics_box" style="">
                    <div class="statistics_item_box">
                        <div class="statistics_item">
                            <div class="statistics_item1">平均分排名</div>
                            <div class="statistics_item2 average_rank">1</div>
                        </div>
                    </div>
                    <div class="statistics_item_box">
                        <div class="statistics_item">
                            <div class="statistics_item1">总分排名</div>
                            <div class="statistics_item2 total_score_rank">1</div>
                        </div>
                    </div>
                    <div class="statistics_item_box">
                        <div class="statistics_item">
                            <div class="statistics_item1">项目排名</div>
                            <div class="statistics_item2 project_rank">1</div>
                        </div>
                    </div>
                    <div class="statistics_item_box">
                        <div class="statistics_item">
                            <div class="statistics_item1">正确数</div>
                            <div class="statistics_item2 xs2">10</div>
                        </div>
                    </div>
                    <div class="statistics_item_box">
                        <div class="statistics_item">
                            <div class="statistics_item1">正确率</div>
                            <div class="statistics_item2 xs3">10</div>
                        </div>
                    </div>
                </div>
            </div>-->
            <div class="row" style="margin: 16px 0px">
                <div style="padding: 16px;font-weight: 900;font-size: 24px;" id="knowledge"></div>
            </div>


        </div>
    </div>
</div>
</body>
<script src="/lattice/js/jquery.3.4.1.js"></script>
<script src="/lattice/js/rank.js"></script>
<script src="/lattice/js/bootstrap.min.3.3.1.js"></script>
<script src="/lattice/js/echarts.min.js"></script>
<script type="text/javascript" src="/lattice/js/oneui/common_utils.js"></script>
<script>
    $(function () {
        var data=[
            {"ID":"1","topic":"一个长方形的宽是2厘米，长是宽的3倍，长方形的面积是？","ans":"A","A":"A","AText":"12平方厘米","B":"B","BText":"6平方厘米","C":"C","CText":"5平方厘米","ansText":"12平方厘米"},
            {"ID":"3","topic":"用一根长30厘米的铁丝，围成一个长为10厘米的长方形．这个长方形的面积为多少平方厘米？","ans":"A","A":"A","AText":"50","B":"B","BText":"200","C":"C","CText":"300","ansText":"50"},
            {"ID":"11","topic":"一个正方形果园的周长是400米，它的占地面积是平方千米？","ans":"A","A":"A","AText":"10000平方千米","B":"B","BText":"1000平方千米","C":"C","CText":"100平方千米","ansText":"10000平方千米"},
            {"ID":"13","topic":"一个长6米，宽4米，深2米的水池的占地面积是几平方米？","ans":"A","A":"A","AText":"24","B":"B","BText":"42","C":"C","CText":"8","ansText":"24"},
            {"ID":"15","topic":"从一张长10米，宽8米的长方形纸上剪一个最大的正方形，剩下图形的面积是？","ans":"A","A":"A","AText":"16","B":"B","BText":"20","C":"C","CText":"800","ansText":"16"},
            {"ID":"20","topic":"一个长方形，如果宽增加3厘米，面积就增加24平方厘米，这时的图形正好是一个正方形，原来长方形的面积是多少平方厘米？","ans":"A","A":"A","AText":"64","B":"B","BText":"40","C":"C","CText":"16","ansText":"64"},
            {"ID":"24","topic":"一块长方形菜地，长7米，宽9米，面积是　　几平方米？","ans":"A","A":"A","AText":"63","B":"B","BText":"16","C":"C","CText":"32","ansText":"63"},
            {"ID":"26","topic":"边长是多少的正方形，它的面积是1平方米？","ans":"A","A":"A","AText":"1米","B":"B","BText":"1分米","C":"C","CText":"1厘米","ansText":"1米"},
            {"ID":"27","topic":"把正方形的边长扩大10倍，正方形的面积会扩大？","ans":"A","A":"A","AText":"100倍","B":"B","BText":"10倍","C":"C","CText":"1倍","ansText":"100倍"},
            {"ID":"28","topic":"《九章算术》中的“方田”一章，专门讲述了平面图形面积的计算方法“方田”是指？","ans":"A","A":"A","AText":"正方形","B":"B","BText":"圆形","C":"C","CText":"梯形","ansText":"正方形"},
            {"ID":"29","topic":"一个长方形的宽不变，长增加了3厘米，面积就增加了12平方厘米，它的宽是多少　　厘米？","ans":"A","A":"A","AText":"4","B":"B","BText":"12","C":"C","CText":"不确定","ansText":"4"},
            {"ID":"31","topic":"一个长方形宽6米，长8米，从这个长方形中剪下一个最大的正方形，这个正方形的面积是？","ans":"A","A":"A","AText":"36平方米","B":"B","BText":"49平方米","C":"C","CText":"64平方米","ansText":"36平方米"},
            {"ID":"38","topic":"用一根绳子分别围成一个正方形和一个长方形，谁的面积大？","ans":"A","A":"A","AText":"正方形","B":"B","BText":"长方形","C":"C","CText":"不确定谁","ansText":"正方形"},
            {"ID":"39","topic":"已知长方形的长是6cm，宽是3cm，它们各增加2cm后，面积增加？","ans":"A","A":"A","AText":"22","B":"B","BText":"18","C":"C","CText":"4","ansText":"22"},
            {"ID":"42","topic":"一间美术教室的长约5米，宽约4米，几间这样的美术教室的面积是100平方米？","ans":"A","A":"A","AText":"5","B":"B","BText":"20","C":"C","CText":"200","ansText":"5"},
            {"ID":"45","topic":"学校有一个长方形花圃，长12米，宽5米；还有一个正方形苗圃，边长8米．花圃与苗圃比，谁的面积大？","ans":"A","A":"A","AText":"正方形苗圃","B":"B","BText":"长方形花圃","C":"C","CText":"一样大","ansText":"正方形苗圃"},
            {"ID":"48","topic":"一个边长10米的正方形荷花池周围有一条宽2米的小路，小路的周长是？","ans":"A","A":"A","AText":"36米","B":"B","BText":"100米","C":"C","CText":"64米","ansText":"36米"},
            {"ID":"50","topic":"正方形边长为2厘米，若边长增加1厘米，则周长增加？","ans":"A","A":"A","AText":"8厘米","B":"B","BText":"5厘米","C":"C","CText":"16厘米","ansText":"8厘米"},
            {"ID":"52","topic":"一个正方形的边长扩大到原来的4倍，周长就扩大到原来的几倍？","ans":"A","A":"A","AText":"4","B":"B","BText":"8","C":"C","CText":"16","ansText":"4"},
            {"ID":"55","topic":"把一根长20分米的铁线围成一个正方形框架，它的面积是？","ans":"A","A":"A","AText":"25平方分米","B":"B","BText":"400平方分米","C":"C","CText":"20平方分米","ansText":"25平方分米"},
            {"ID":"63","topic":"有两个大小一样的长方形，长都是6厘米，宽都是3厘米，如果拼成一个正方形，周长应是？","ans":"A","A":"A","AText":"24厘米","B":"B","BText":"36厘米","C":"C","CText":"18厘米","ansText":"24厘米"},
            {"ID":"65","topic":"一个长方形，长是12厘米，如果宽增加5厘米，则周长增加？","ans":"A","A":"A","AText":"10厘米","B":"B","BText":"17厘米","C":"C","CText":"34厘米","ansText":"10厘米"},
            {"ID":"67","topic":"长方形周长为54厘米，长为20厘米，则宽为多少厘米？","ans":"A","A":"A","AText":"7","B":"B","BText":"14","C":"C","CText":"20","ansText":"7"},
            {"ID":"74","topic":"用两根同样长的铁丝分别围成一个长方形和一个正方形，则它们的？","ans":"A","A":"A","AText":"周长相等","B":"B","BText":"正方形周长大","C":"C","CText":"长方形周长大","ansText":"周长相等"},
            {"ID":"75","topic":"把一个边长5米的正方形木条框拉成一个平行四边形，这个平行四边形的周长是多少米？","ans":"A","A":"A","AText":"20","B":"B","BText":"5","C":"C","CText":"不确定","ansText":"20"},
            {"ID":"82","topic":"一个正方形的周长是24厘米，它的边长是？","ans":"A","A":"A","AText":"6厘米","B":"B","BText":"12厘米","C":"C","CText":"96厘米","ansText":"6厘米"},
            {"ID":"83","topic":"长8厘米，周长20厘米的长方形，它的宽是？","ans":"A","A":"A","AText":"2厘米","B":"B","BText":"4厘米","C":"C","CText":"12厘米","ansText":"2厘米"},
            {"ID":"85","topic":"边长是4厘米的正方形，它的周长和面积？","ans":"A","A":"A","AText":"相等","B":"B","BText":"不相等","C":"C","CText":"无法比较","ansText":"相等"},
            {"ID":"88","topic":"周长为8厘米的正方形的边长为？","ans":"A","A":"A","AText":"2厘米","B":"B","BText":"4厘米","C":"C","CText":"16厘米","ansText":"2厘米"},
            {"ID":"89","topic":"一个长方形的周长为20厘米，长为7厘米，宽为？","ans":"A","A":"A","AText":"3厘米","B":"B","BText":"5厘米","C":"C","CText":"13厘米","ansText":"3厘米"},
            {"ID":"90","topic":"一个正方形的周长是24厘米，它的面积是？","ans":"A","A":"A","AText":"36平方厘米","B":"B","BText":"96平方厘米","C":"C","CText":"576平方厘米","ansText":"36平方厘米"},
            {"ID":"2","topic":"长方体冰柜长是80厘米，宽是50厘米，高是56厘米，这个冰柜的占地面积是？","ans":"B","A":"A","AText":"28平方分米","B":"B","BText":"40平方分米","C":"C","CText":"44立方分米","ansText":"40平方分米"},
            {"ID":"7","topic":"从一张长14厘米，宽10厘米的长方形纸上剪出一个最大的正方形，剩下部分的面积是？","ans":"B","A":"A","AText":"100平方厘米","B":"B","BText":"40平方厘米","C":"C","CText":"60平方厘米","ansText":"40平方厘米"},
            {"ID":"8","topic":"一个长方形长6厘米，宽4厘米，把它平均分成两个同样大小的小长方形，每个小长方形的面积是？","ans":"B","A":"A","AText":"10平方厘米","B":"B","BText":"12平方厘米","C":"C","CText":"20平方厘米","ansText":"12平方厘米"},
            {"ID":"10","topic":"把一个正方形边长扩大到原来的4倍，它的面积扩大到原来的几倍？","ans":"B","A":"A","AText":"4","B":"B","BText":"16","C":"C","CText":"8","ansText":"16"},
            {"ID":"12","topic":"一个边长为2厘米的正方形，把它的边长扩大1倍，它的面积变为？","ans":"B","A":"A","AText":"4平方厘米","B":"B","BText":"16平方厘米","C":"C","CText":"12平方厘米","ansText":"16平方厘米"},
            {"ID":"17","topic":"教室的地面长9米，宽6米，用边长3米的方砖铺地，需要几块？","ans":"B","A":"A","AText":"18","B":"B","BText":"6","C":"C","CText":"600","ansText":"6"},
            {"ID":"19","topic":"长方形长1分米，宽5分米，面积是？","ans":"B","A":"A","AText":"50平方分米","B":"B","BText":"5平方分米","C":"C","CText":"500平方分米","ansText":"5平方分米"},
            {"ID":"21","topic":"正方形的边长扩大到原来的两倍，面积就扩大到原来的几倍？","ans":"B","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"6","ansText":"4"},
            {"ID":"22","topic":"边长是10分米的正方形，面积是？","ans":"B","A":"A","AText":"10平方厘米","B":"B","BText":"100平方分米","C":"C","CText":"100平方厘米","ansText":"100平方分米"},
            {"ID":"23","topic":"小红从一张长10厘米，宽6厘米的长方形纸上剪下一个最大的正方形，剩下部分的面积是几平方厘米？","ans":"B","A":"A","AText":"40","B":"B","BText":"24","C":"C","CText":"60","ansText":"24"},
            {"ID":"25","topic":"用三个长都是4分米，宽都是3分米的长方形拼成一个长方形，它的面积是几平方分米？","ans":"B","A":"A","AText":"12","B":"B","BText":"36","C":"C","CText":"48","ansText":"36"},
            {"ID":"30","topic":"一个正方形纸巾，它的周长是4米，面积是多少平方米？","ans":"B","A":"A","AText":"4","B":"B","BText":"1","C":"C","CText":"16","ansText":"1"},
            {"ID":"33","topic":"一个长方形长是10米，宽是6米，它的面积是？","ans":"B","A":"A","AText":"32平方米","B":"B","BText":"60平方米","C":"C","CText":"60米","ansText":"60平方米"},
            {"ID":"34","topic":"一个长方形花坛，长50米，宽40米，这个花坛的占地面积是？","ans":"B","A":"A","AText":"2000米","B":"B","BText":"2000平方米","C":"C","CText":"180米","ansText":"2000平方米"},
            {"ID":"36","topic":"一块正方形果园的边长是40米，这个果园的周长是？","ans":"B","A":"A","AText":"1600平方米","B":"B","BText":"160米","C":"C","CText":"160平方米","ansText":"160米"},
            {"ID":"37","topic":"在长4米，宽2米的黑板里面画一幅最大的正方形宣传画，计算这幅宣传画面积是？","ans":"B","A":"A","AText":"16米","B":"B","BText":"4平方米","C":"C","CText":"16平方米","ansText":"4平方米"},
            {"ID":"40","topic":"一块正方形绿地面积是36平方米，边长增加到8米，扩大后绿地面积是多少平方米？","ans":"B","A":"A","AText":"48","B":"B","BText":"64","C":"C","CText":"28","ansText":"64"},
            {"ID":"44","topic":"边长是300米的正方形草地，占地面积是？","ans":"B","A":"A","AText":"9平方米","B":"B","BText":"9公顷","C":"C","CText":"90平方千米","ansText":"9公顷"},
            {"ID":"46","topic":"学校有一个长方形花圃，长12米，宽5米；还有一个正方形苗圃，边长8米．花圃与苗圃比，谁的周长大？","ans":"B","A":"A","AText":"正方形苗圃","B":"B","BText":"长方形花圃","C":"C","CText":"一样大","ansText":"长方形花圃"},
            {"ID":"49","topic":"正方形边长为2厘米，若边长增加1厘米，则面积增加？","ans":"B","A":"A","AText":"9平方厘米","B":"B","BText":"5平方厘米","C":"C","CText":"5厘米","ansText":"5平方厘米"},
            {"ID":"53","topic":"长方形的面积计算公式是？","ans":"B","A":"A","AText":"（长+宽）×2","B":"B","BText":"长×宽","C":"C","CText":"长×宽×2","ansText":"长×宽"},
            {"ID":"54","topic":"用18根1厘米长的小棒摆长方形，一共有多少种不同摆法？","ans":"B","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"5","ansText":"4"},
            {"ID":"57","topic":"一个长方形的长和宽分别为2米和1米，长和宽各增加为原来的3倍，它的面积就？","ans":"B","A":"A","AText":"增加9 平方米","B":"B","BText":"扩大原来的9倍","C":"C","CText":"无法确定","ansText":"扩大原来的9倍"},
            {"ID":"58","topic":"一个正方形的边长乘5，它的面积就乘？","ans":"B","A":"A","AText":"5","B":"B","BText":"25","C":"C","CText":"10","ansText":"25"},
            {"ID":"59","topic":"一个长方体水池长30米，宽20米，深1.5米，这个水池占地面积是多少平方米？","ans":"B","A":"A","AText":"900","B":"B","BText":"600","C":"C","CText":"300","ansText":"600"},
            {"ID":"62","topic":"用长14m的栅栏围成一块长方形果园，长与宽的比是4：3，这块长方形果园的面积是？","ans":"B","A":"A","AText":"7平方米","B":"B","BText":"12平方米","C":"C","CText":"14平方米","ansText":"12平方米"},
            {"ID":"64","topic":"一个正方形的周长是20厘米，它的面积是　　多少平方厘米？","ans":"B","A":"A","AText":"20","B":"B","BText":"25","C":"C","CText":"80","ansText":"25"},
            {"ID":"68","topic":"一个长方形的长是9米，宽是5米，这个长方形的周长是？","ans":"B","A":"A","AText":"14米","B":"B","BText":"28米","C":"C","CText":"45米","ansText":"28米"},
            {"ID":"69","topic":"用一张长8厘米，宽5厘米的长方形纸剪一个最大的正方形，这个正方形的边长是？","ans":"B","A":"A","AText":"3米","B":"B","BText":"5米","C":"C","CText":"8米","ansText":"5米"},
            {"ID":"70","topic":"一个长方形的长是6米，宽是4米，这个长方形的周长是？","ans":"B","A":"A","AText":"10米","B":"B","BText":"12米","C":"C","CText":"20米","ansText":"12米"},
            {"ID":"71","topic":"一根铁丝正好围成边长为8厘米的正方形，用同样长的铁丝围成宽6厘米的长方形，长最大是？","ans":"B","A":"A","AText":"8米","B":"B","BText":"10米","C":"C","CText":"28米","ansText":"10米"},
            {"ID":"72","topic":"用一根8米的铁丝围成一个正方形，这个正方形的周长是多少米？","ans":"B","A":"A","AText":"2","B":"B","BText":"8","C":"C","CText":"32","ansText":"8"},
            {"ID":"73","topic":"从一张长20厘米，宽15厘米的长方形纸上剪下一个最大的正方形，这个正方形的周长是？","ans":"B","A":"A","AText":"40厘米","B":"B","BText":"60厘米","C":"C","CText":"80厘米","ansText":"60厘米"},
            {"ID":"78","topic":"长方形的长是8厘米，宽是长的一半，周长是多少厘米？","ans":"B","A":"A","AText":"8","B":"B","BText":"24","C":"C","CText":"32","ansText":"24"},
            {"ID":"86","topic":"边长4米的正方形，周长是？","ans":"B","A":"A","AText":"4平方米","B":"B","BText":"16米","C":"C","CText":"16平方米","ansText":"16米"},
            {"ID":"87","topic":"一个正方形花坛的周长是36米，它的边长是？","ans":"B","A":"A","AText":"6米","B":"B","BText":"9米","C":"C","CText":"12米","ansText":"9米"},
            {"ID":"4","topic":"一块边长是10米的正方形菜地，边长增加10米，菜地面积增加多少平方米？","ans":"C","A":"A","AText":"10","B":"B","BText":"100","C":"C","CText":"300","ansText":"300"},
            {"ID":"5","topic":"一块正方形手帕，边长是20厘米，它的面积是多少平方分米？","ans":"C","A":"A","AText":"400","B":"B","BText":"40","C":"C","CText":"4","ansText":"4"},
            {"ID":"6","topic":"把2个边长是3厘米的正方形拼成一个长方形，这个长方形的面积是？","ans":"C","A":"A","AText":"18厘米","B":"B","BText":"24平方厘米","C":"C","CText":"18平方厘米","ansText":"18平方厘米"},
            {"ID":"9","topic":"学校操场长20米，宽5米，面积是？","ans":"C","A":"A","AText":"1000平方米","B":"B","BText":"1平方千米","C":"C","CText":"100平方米","ansText":"100平方米"},
            {"ID":"14","topic":"一个长方体，长9分米，宽7分米，高4分米，放在地面上，占地面积最小是多少平方分米？","ans":"C","A":"A","AText":"63","B":"B","BText":"36","C":"C","CText":"28","ansText":"28"},
            {"ID":"16","topic":"边长是1米的正方形，可以分成几个边长是1分米的小正方形？","ans":"C","A":"A","AText":"1","B":"B","BText":"10","C":"C","CText":"100","ansText":"100"},
            {"ID":"18","topic":"边长是（ ）的正方形，它的面积是1平方米","ans":"C","A":"A","AText":"1分米","B":"B","BText":"10厘米","C":"C","CText":"10分米","ansText":"10分米"},
            {"ID":"32","topic":"一个广场长50米，宽80米，占地面积是？","ans":"C","A":"A","AText":"40平方米","B":"B","BText":"400平方米","C":"C","CText":"4000平方米","ansText":"4000平方米"},
            {"ID":"35","topic":"一块地的长是600厘米，宽是200厘米，这块地是？","ans":"C","A":"A","AText":"1200平方厘米","B":"B","BText":"1600平方米","C":"C","CText":"1600厘米","ansText":"1600厘米"},
            {"ID":"41","topic":"一块长方形绿地，长9米，宽4米，长不变，宽增加到8米，扩大后绿地周长是　　米？","ans":"C","A":"A","AText":"16","B":"B","BText":"26","C":"C","CText":"34","ansText":"34"},
            {"ID":"43","topic":"一张长方形的画纸，长9分米，宽7分米，如果长和宽都减少2分米，则面积减少几平方分米？","ans":"C","A":"A","AText":"63","B":"B","BText":"35","C":"C","CText":"28","ansText":"28"},
            {"ID":"47","topic":"一个边长10米的正方形荷花池周围有一条宽1米的小路，小路的面积是？","ans":"C","A":"A","AText":"81平方米","B":"B","BText":"100平方米","C":"C","CText":"19平方米","ansText":"19平方米"},
            {"ID":"51","topic":"一个正方形的边长扩大到原来的3倍，面积就扩大到原来的几倍？","ans":"C","A":"A","AText":"3","B":"B","BText":"12","C":"C","CText":"9","ansText":"9"},
            {"ID":"56","topic":"一个长方形的长和宽各增加3米，它的面积就？","ans":"C","A":"A","AText":"增加9 平方米","B":"B","BText":"扩大原来的9倍","C":"C","CText":"无法确定","ansText":"无法确定"},
            {"ID":"60","topic":"一个大长方形的长是10厘米，宽是8厘米，小长方形的长和宽都是大长方形长和宽的一半，小长方形的面积是？","ans":"C","A":"A","AText":"20厘米","B":"B","BText":"80平方厘米","C":"C","CText":"20平方厘米","ansText":"20平方厘米"},
            {"ID":"61","topic":"一张长10厘米，宽6厘米的纸，如果它的四个角各剪去一个边长是2厘米的正方形，剩下的纸片的周长与原长方形周长比？","ans":"C","A":"A","AText":"减少","B":"B","BText":"增加","C":"C","CText":"不变","ansText":"不变"},
            {"ID":"66","topic":"王奶奶靠墙用簧笆围一个长方形的花圃，长3米，宽2米，至少需要多少米长的篱笆？","ans":"C","A":"A","AText":"3","B":"B","BText":"5","C":"C","CText":"10","ansText":"10"},
            {"ID":"76","topic":"两个周长是4cm的正方形，拼成一个长方形，这个长方形的周长是？","ans":"C","A":"A","AText":"6厘米","B":"B","BText":"12厘米","C":"C","CText":"24厘米","ansText":"24厘米"},
            {"ID":"77","topic":"在一张长8cm、宽6cm的长方形纸上剪下一个最大的正方形，这个正方形的周长是？","ans":"C","A":"A","AText":"14cm","B":"B","BText":"16cm","C":"C","CText":"24cm","ansText":"24cm"},
            {"ID":"79","topic":"一个长方形的长增加了3厘米，宽减少了3厘米，它的周长？","ans":"C","A":"A","AText":"增加","B":"B","BText":"减少","C":"C","CText":"不变","ansText":"不变"},
            {"ID":"80","topic":"强强沿着边长50米的正方形跑道跑了5圈，跑了？","ans":"C","A":"A","AText":"250米","B":"B","BText":"800米","C":"C","CText":"1000米","ansText":"1000米"},
            {"ID":"81","topic":"要求长方形的周长，必须知道它的？","ans":"C","A":"A","AText":"长","B":"B","BText":"宽","C":"C","CText":"长和宽","ansText":"长和宽"},
            {"ID":"84","topic":"把一个长方形框架拉成一个平行四边形后，它的周长？","ans":"C","A":"A","AText":"变长","B":"B","BText":"变短","C":"C","CText":"没有变化","ansText":"没有变化"}
        ];
        var data_index=0,data_click=true,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=30,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],topicArr=[],commentset=[],ansText=[],buttonsetText=[];

        pushArr(data);
        function topicFun(data_index){
            $("#item2_A").text(data[data_index].AText);
            $("#item2_A").attr("data-data",data[data_index].A);
            $("#item2_B").text(data[data_index].BText);
            $("#item2_B").attr("data-data",data[data_index].B);
            $("#item2_C").text(data[data_index].CText);
            $("#item2_C").attr("data-data",data[data_index].C);
            // $(".item2_item img").addClass("revolve");
            $("#topic").text(data[data_index].topic);
        }
        function textFun(ans, ans1) {
            if(ans == "Q"){
                ansText.push(data[data_index].QText)
            }else if(ans=="P"){
                ansText.push(data[data_index].PText)
            }else if(ans=="A"){
                ansText.push(data[data_index].AText)
            }else if(ans=="B"){
                ansText.push(data[data_index].BText)
            }else if(ans=="C"){
                ansText.push(data[data_index].CText)
            }else if(ans=="D"){
                ansText.push(data[data_index].DText)
            }else if(ans=="E"){
                ansText.push(data[data_index].EText)
            }else if(ans=="F"){
                ansText.push(data[data_index].FText)
            }
            if(ans1 == "Q"){
                buttonsetText.push(data[data_index].QText)
            }else if(ans1=="P"){
                buttonsetText.push(data[data_index].PText)
            }else if(ans1=="A"){
                buttonsetText.push(data[data_index].AText)
            }else if(ans1=="B"){
                buttonsetText.push(data[data_index].BText)
            }else if(ans1=="C"){
                buttonsetText.push(data[data_index].CText)
            }else if(ans1=="D"){
                buttonsetText.push(data[data_index].DText)
            }else if(ans1=="E"){
                buttonsetText.push(data[data_index].EText)
            }else if(ans1=="F"){
                buttonsetText.push(data[data_index].FText)
            }
        }
        $("#img1").on("click",function () {
            mouldTime=$("#input1[type='checkbox']").is(':checked');
            data_number=data.length;
            topicFun(data_index);
            $("#item1").addClass("hide");
            $("#item2").removeClass("hide");
            $("#xs1").text(maxtime+"秒");
            if(!mouldTime){
            timer = setInterval(function () {
                CountDown();
            }, 1000);
        }else {
            type4Num="99";
            time1=500;
        }
            beginTime=new Date().getTime();
        });
        $(".item2_set").on("click",function () {
            if(data_click){
                endTime=new Date().getTime();
                time=(endTime-beginTime).toFixed(0);
                var ans=data[data_index].ans;
                var ans1=$(this).attr("data-data");
                stimidset.push(data[data_index].ID);
                type4set.push(type4Num);
                topicArr.push(data[data_index].topic);
                correctanswerset.push(ans);
                buttonset.push(ans1);
                timeset.push(time);
                textFun(ans, ans1);
                $("#item2").addClass("op");
                if(ans1 == ans){
                    correct_number++;
                    great++;
                    $("#xs2").text(correct_number);
                    if(great>=5){
                        great=0;
                        $("#reward_img").attr("src","jiangli.gif");
                    }else {
                        $("#reward_img").attr("src","yes.gif");
                    }

                }else {
                    great=0;
                    $("#reward_img").attr("src","no.gif");
                }
                $("#xs3").text(Math.round((correct_number/(data_index+1))*100)+"%");
                nextTopicFun()
            }

        });


        function nextTopicFun() {
            $("#reward").removeClass("hide");
            data_index++;
            if(data_number<=data_index){
                endFun();
                clearInterval(timer);
                timer=null;
                return;
            }
            timer1=setInterval(function () {
                $("#item2").removeClass("op");
                $("#reward_img").attr("src"," ");
                $("#reward").addClass("hide");
                data_click=true;
                beginTime=new Date().getTime();
                topicFun(data_index);

                clearInterval(timer1);
                timer1=null;
            }, time1);

        }

        function endFun() {

            /*var myChart = echarts.init(document.getElementById('main'));
            var option = {
                xAxis: {
                    type: 'category',
                    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri']
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: [120, 200, 150, 80, 70],
                    type: 'bar'
                }]
            };
            myChart.setOption(option);*/
            commentset.push(((correct_number/stimidset.length)*100).toFixed(2)+"%");
            commentset.push(correct_number);
            commentset.push(correct_number);
            topicResultFun(stimidset);
            $("#reward").addClass("hide");
            $("#item2").addClass("hide");
            $("#item3").removeClass("hide");


        }

        function topicResultFun(arr) {
            for (var i = 0; i < arr.length; i++) {
                $("#topic_result").append(
                    '<tr>' +
                    '<td>'+topicArr[i]+'</td>' +
                    '<td>'+ansText[i]+'</td>' +
                    '<td>'+buttonsetText[i]+'</td>' +
                    '<td>'+timeset[i]+'</td>' +
                    '</tr>'
                )
            }
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
        $("#out").on("click",function () {
            post_result();
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
            opes_result_data.commentset = commentset.join(";");
            opes_result_data.numset = "";
            opes_post_result_util_js_opes_post_result(opes_result_data);
            return;
        }
    })
</script>
</html>