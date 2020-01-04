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
    <div id="item1" class="item">
        <div style="position: absolute;bottom: 0px;cursor: pointer;">
            <label style="cursor: pointer;" for="input1">
                <input id="input1" type="checkbox"><span id="bTime"></span>
            </label>
        </div>
        <div class="item1_text item1_imgBox1">
            <div style="position: relative;top: 20%;">
                <span id="name"><%=realname %></span><span id="respectfully"></span><br/>
                <span style="text-indent: 2em;display: inline-block;"><%=ots.get(0).getInstruction() %></span>
            </div>


        </div>

        <div class="item1_img item1_imgBox2">
            <img id="img1" src="kaishi.png" alt="">
        </div>
    </div>
    <div id="item2" class="item item2 div_flex hide">
        <div id="byBox" class="byBox">
            <div id="byBox_1" class="byBox_1 byBox_move">
                <img src="yun.png" alt="">
            </div>
        </div>
        <div id="xrBox" class="xrBox" style="">
            <div id="xrBox_1" class="byBox_1 xrBox_move">
                <img src="xiao.png" alt="">
            </div>
        </div>
        <div class="item item2_box">
            <div id="item2_topic" class="item2_topic">
                <div id="item2_topic_box" class="item2_topic_box topic_move">
                    <div class="div_flex imgBox">
                        <img id="img" src="" alt="">
                    </div>
                    <div id="topic" class="topic">
                        8个笑脸，一个人分3个，最后还剩下（）个。
                    </div>
                </div>
            </div>
            <div id="item2_ans_box" class="item2_ans_box">
                <div id="item2_item_box" class="item2_item_box item2_set_move">
                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_A" style="margin-top: -16px;">
                                1
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_B">
                                1
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_C" style="margin-top: -12px;">
                                1
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="" class="item2_set" id="item2_D">
                                1
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="item3" class="item hide">
        <div class="outBox">
            <button id="out" class="btn btn-danger btn-lg"></button>
        </div>
        <div class="container">
            <div class="row" style="margin: 16px 0px">
                <div class="col-md-12" style="display: flex;justify-content:center;">
                    <table class="table table-hover" style="width: 80%;">
                        <caption class="tableTitle" id="captionTitle"></caption>
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
            {"ID":"1","ans":"B","url":"img/1.png","topic":"8个笑脸，一个人分3个，最后还剩下（）个。","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"2","ans":"C","url":"img/2.png","topic":"7个桃子，一个人分3个，最多可以分给（）个人。","A":"A","AText":"1","B":"B","BText":"6","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"3","ans":"D","url":"img/3.png","topic":"13根小棒做三角形，最后还剩（）根小棒。","A":"A","AText":"3","B":"B","BText":"2","C":"C","CText":"4","D":"D","DText":"1"},
            {"ID":"4","ans":"A","url":"img/4.png","topic":"一个人分2个冰激凌，那么9个冰激凌会剩下（）个分不出去。","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"5","ans":"B","url":"img/5.png","topic":"18只小鸡装笼子，每个笼子要装5只小鸡，最后剩下（）只小鸡。","A":"A","AText":"1","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"6","ans":"C","url":"img/6.png","topic":"一个筐最多放4个篮球， 装完15个篮球至少需要（）个筐。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"7","ans":"C","url":"img/7.png","topic":"14根小棒做三角形，最多可以做（）个三角形。","A":"A","AText":"3","B":"B","BText":"5","C":"C","CText":"4","D":"D","DText":"6"},
            {"ID":"8","ans":"B","url":"img/8.png","topic":"8根胡萝卜，1只小兔分3根，最后还剩（）根胡萝卜。","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"9","ans":"B","url":"img/9.png","topic":"15个篮球，每个筐放4个篮球，最后还剩（）个篮球。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"10","ans":"D","url":"img/10.png","topic":"16条鱼，每个鱼缸最多放3条，至少需要（）个鱼缸。","A":"A","AText":"5","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"11","ans":"B","url":"img/11.png","topic":"10根萝卜平均分给4个小兔，最后还剩（）根胡萝卜。","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"12","ans":"C","url":"img/12.png","topic":"每个笼子最多装5只小鸡，18只小鸡全部装完需要（）个笼子。","A":"A","AText":"1","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"13","ans":"A","url":"img/13.png","topic":"一件衣服至少需要四个扣子，那么15个扣子最多可以缝（）件衣服。","A":"A","AText":"3","B":"B","BText":"5","C":"C","CText":"4","D":"D","DText":"2"},
            {"ID":"14","ans":"C","url":"img/14.png","topic":"16条鱼放到5个鱼缸，每个鱼缸最多放（）条鱼。","A":"A","AText":"5","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"15","ans":"D","url":"img/15.png","topic":"10颗白菜，分给3个人，每人最多可得（）颗。","A":"A","AText":"4","B":"B","BText":"2","C":"C","CText":"1","D":"D","DText":"3"},
            {"ID":"16","ans":"A","url":"img/16.png","topic":"3个正方块拼成一个长方体，10个正方块最多可以拼成（）个长方体。 ","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"1"},
            {"ID":"17","ans":"A","url":"img/17.png","topic":"16条鱼，每个鱼缸必须放3条，最后还剩（）条鱼。","A":"A","AText":"1","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"18","ans":"D","url":"img/18.png","topic":"每个小朋友吃2份菜，9份菜最多可以分给（）个小朋友。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"5","D":"D","DText":"4"},
            {"ID":"19","ans":"A","url":"img/19.png","topic":"4个棒子可以拼成一个正方形，14根棒子，最多可以拼成（）个正方形。","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"5"},
            {"ID":"20","ans":"B","url":"img/20.png","topic":"1个人必须分到2个苹果，那么11个苹果最后还剩（）个。","A":"A","AText":"3","B":"B","BText":"1","C":"C","CText":"4","D":"D","DText":"2"},
            {"ID":"21","ans":"D","url":"img/21.png","topic":"每3个正方块可以拼成一个长方体，10个正方块拼完后还剩下（）个。 ","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"1"},
            {"ID":"22","ans":"B","url":"img/22.png","topic":"每个人必须分到3朵花，16朵花最多可以分给（）个人。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"23","ans":"B","url":"img/23.png","topic":"一包最多装6块饼干，那么16块饼干至少可以装（）包。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"1","D":"D","DText":"4"},
            {"ID":"24","ans":"A","url":"img/24.png","topic":"4个棒子可以拼成一个正方形，14根棒子拼完后还剩（）根。","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"1","D":"D","DText":"3"},
            {"ID":"25","ans":"C","url":"img/25.png","topic":"一个人分4块蛋糕，18块蛋糕可以分给（）人。","A":"A","AText":"3","B":"B","BText":"5","C":"C","CText":"4","D":"D","DText":"6"},
            {"ID":"26","ans":"D","url":"img/26.png","topic":"15件衣服平均装到4个箱子里，最后还剩（）件衣服。","A":"A","AText":"4","B":"B","BText":"2","C":"C","CText":"1","D":"D","DText":"3"},
            {"ID":"27","ans":"c","url":"img/27.png","topic":"每人分3杯饮料，7杯饮料能分给（）个人。","A":"A","AText":"1","B":"B","BText":"3","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"28","ans":"C","url":"img/28.png","topic":"一个框最多可以放3个柚子，10个柚子需要放（）个框。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"4","D":"D","DText":"3"},
            {"ID":"29","ans":"A","url":"img/29.png","topic":"12个芒果平均分给5个小朋友，分好后还剩（）个。","A":"A","AText":"2","B":"B","BText":"1","C":"C","CText":"3","D":"D","DText":"7"},
            {"ID":"30","ans":"D","url":"img/30.png","topic":"一人分4栋房子，18栋房子可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"31","ans":"C","url":"img/31.png","topic":"一个人必须分4块蛋糕，18块蛋糕分完后还剩（）块。","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"6"},
            {"ID":"32","ans":"A","url":"img/32.png","topic":"1个人分4个恐龙公仔，11个恐龙公仔可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"33","ans":"C","url":"img/33.png","topic":"1个鱼缸最多可以养4条鱼，9条鱼全部放到鱼缸里，需要（）个鱼缸。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"34","ans":"B","url":"img/34.png","topic":"1个小朋友分2只猫咪，11只猫咪可以分给（）个小朋友。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"35","ans":"A","url":"img/35.png","topic":"一碗装3个饺子，11个饺子装完最后还剩（）个饺子。","A":"A","AText":"2","B":"B","BText":"1","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"36","ans":"D","url":"img/36.png","topic":"一人分2栋蘑菇房，9栋房子可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"37","ans":"B","url":"img/37.png","topic":"一个人吃4笼包子，9笼包子最后还剩下（）笼。","A":"A","AText":"2","B":"B","BText":"1","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"38","ans":"B","url":"img/38.png","topic":"16个哈密瓜，一个人分3个，最多可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"39","ans":"D","url":"img/39.png","topic":"一个人必须分3个香瓜，14个瓜最多可以分给（）个人。","A":"A","AText":"3","B":"B","BText":"5","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"40","ans":"D","url":"img/40.png","topic":"1只猫最多能抓2只老鼠，至少需要（）只猫才能抓完9只老鼠。","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"5"},
            {"ID":"41","ans":"A","url":"img/41.png","topic":"3只蚂蚁住一个洞，10只蚂蚁都住到洞里需要（）个洞。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"42","ans":"B","url":"img/42.png","topic":"17只青蛙玩偶，一个小朋友最多分2只，至少分给（）个小朋友。","A":"A","AText":"6","B":"B","BText":"9","C":"C","CText":"8","D":"D","DText":"7"},
            {"ID":"43","ans":"D","url":"img/43.png","topic":"一个人分5个彩虹抱枕，12个抱枕可以分给（）个人。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"44","ans":"C","url":"img/44.png","topic":"一条鲨鱼最多吃2只章鱼，至少（）条鲨鱼能吃完15只章鱼。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"8","D":"D","DText":"6"},
            {"ID":"45","ans":"B","url":"img/45.png","topic":"11只小恐龙，一人分2个，分完后还剩（）个。","A":"A","AText":"4","B":"B","BText":"1","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"46","ans":"D","url":"img/46.png","topic":"18个皇冠，一个人分4个，分完后还剩（）个。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"47","ans":"C","url":"img/47.png","topic":"7个娃娃，一人分2个，可以分给（）个人","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"48","ans":"A","url":"img/48.png","topic":"10只猪，每个人分4只，分完后还剩（）只。","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"1"},
            {"ID":"49","ans":"A","url":"img/49.png","topic":"8只玉米，一个人分3只，可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"1","D":"D","DText":"3"},
            {"ID":"50","ans":"C","url":"img/50.png","topic":"一个人分3瓶汽水，10瓶汽水可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"8","C":"C","CText":"3","D":"D","DText":"9"},
            {"ID":"51","ans":"D","url":"img/51.png","topic":"9个太阳贴画，一人分2个，可以分给（）个小朋友","A":"A","AText":"5","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"52","ans":"A","url":"img/52.png","topic":"10瓶汽水，一人分3瓶，可以分给（）个人。","A":"A","AText":"3","B":"B","BText":"7","C":"C","CText":"8","D":"D","DText":"4"},
            {"ID":"53","ans":"C","url":"img/53.png","topic":"18杯饮料，每个人分4杯，可以分给（）个人。","A":"A","AText":"18","B":"B","BText":"6","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"54","ans":"B","url":"img/54.png","topic":"5个茶壶，一个人必须分到2个，最多分给（）个人","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"55","ans":"B","url":"img/55.png","topic":"15块蛋糕，一个小朋友分6块，最多分给（）个小朋友","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"56","ans":"A","url":"img/56.png","topic":"9个篮球，一人分2个，可以分给（）人。","A":"A","AText":"4","B":"B","BText":"2","C":"C","CText":"1","D":"D","DText":"3"},
            {"ID":"57","ans":"D","url":"img/57.png","topic":"15根棒子，最多能拼成（）个正方形。","A":"A","AText":"1","B":"B","BText":"2","C":"C","CText":"5","D":"D","DText":"3"},
            {"ID":"58","ans":"B","url":"img/58.png","topic":"17只小猫，一个人分3只，可以分给（）人。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"59","ans":"A","url":"img/59.png","topic":"16只小鸡装笼子，每个笼子最多装3只小鸡，至少需要（）个笼子。","A":"A","AText":"6","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"60","ans":"B","url":"img/60.png","topic":"27个茶壶，一个人必须分到4个，可以分给（）个人。","A":"A","AText":"5","B":"B","BText":"6","C":"C","CText":"7","D":"D","DText":"8"},
            {"ID":"61","ans":"B","url":"img/61.png","topic":"9个饼干，每个人必须分到2块，剩下（）块没分出去。","A":"A","AText":"2","B":"B","BText":"1","C":"C","CText":"7","D":"D","DText":"3"},
            {"ID":"62","ans":"C","url":"img/62.png","topic":"8个桃子，每个小朋友分3个，可以分给（）个小朋友。","A":"A","AText":"1","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"63","ans":"D","url":"img/63.png","topic":"用4个正方块可以拼成1个大的正方体，那么14个正方块最多可以拼成（）个大正方体。","A":"A","AText":"6","B":"B","BText":"4","C":"C","CText":"5","D":"D","DText":"3"},
            {"ID":"64","ans":"C","url":"img/64.png","topic":"10本书，一个人分4本，可以分给（）个人。","A":"A","AText":"1","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"65","ans":"B","url":"img/65.png","topic":"一辆车最多坐3个人，那么10个人至少需要（）辆车。","A":"A","AText":"3","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"7"},
            {"ID":"66","ans":"D","url":"img/66.png","topic":"32条鱼，每个鱼缸最多放6条，至少需要（）个鱼缸。","A":"A","AText":"8","B":"B","BText":"4","C":"C","CText":"10","D":"D","DText":"6"},
            {"ID":"67","ans":"C","url":"img/67.png","topic":"16颗星星贴纸，一人分3个，可以分给（）人。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"5","D":"D","DText":"4"},
            {"ID":"68","ans":"A","url":"img/68.png","topic":"一只小猫分2条鱼，15条鱼可以分给（）只小猫。","A":"A","AText":"7","B":"B","BText":"6","C":"C","CText":"8","D":"D","DText":"2"},
            {"ID":"69","ans":"D","url":"img/69.png","topic":"一包装4块饼干，那么18块饼干可以装（）包。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"1","D":"D","DText":"4"},
            {"ID":"70","ans":"B","url":"img/70.png","topic":"一只小狗必须分2根骨头，9根骨头分好后还剩（）根。","A":"A","AText":"2","B":"B","BText":"1","C":"C","CText":"3","D":"D","DText":"9"},
            {"ID":"71","ans":"B","url":"img/71.png","topic":"一个人分3个剪刀，16个剪刀可以分给（）个人。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"72","ans":"C","url":"img/72.png","topic":"13个篮球，一个人必须分3个，最多可以分给（）人。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"73","ans":"B","url":"img/73.png","topic":"一个人分2根铅笔，11根铅笔可以分给（）人。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"6","D":"D","DText":"8"},
            {"ID":"74","ans":"D","url":"img/74.png","topic":"19根棒子，最多能拼成（）个三角形。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"75","ans":"A","url":"img/75.png","topic":"26个棒子，每个人分6根，可以分给（）人。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"76","ans":"C","url":"img/76.png","topic":"14只青蛙玩偶，一人分6个，可以分给（）人。","A":"A","AText":"4","B":"B","BText":"5","C":"C","CText":"2","D":"D","DText":"6"},
            {"ID":"77","ans":"A","url":"img/77.png","topic":"8笼包子，一个人分3笼，可以分给（）人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"78","ans":"D","url":"img/78.png","topic":"一个盘子放4个粽子，10个粽子放（）个盘子。","A":"A","AText":"3","B":"B","BText":"6","C":"C","CText":"4","D":"D","DText":"2"},
            {"ID":"79","ans":"B","url":"img/79.png","topic":"1个盘子可以放2个柿子，11个柿子要放（）个盘子。","A":"A","AText":"7","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"80","ans":"C","url":"img/80.png","topic":"一人分3头猪，10头猪可以分给（）个人。","A":"A","AText":"2","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"81","ans":"D","url":"img/81.png","topic":"1只猫最多能抓2只老鼠，（）只猫才能抓完11只老鼠。","A":"A","AText":"5","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"82","ans":"C","url":"img/82.png","topic":"10只玉米，一个人分3个，可以分给（）个人。","A":"A","AText":"5","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"6"},
            {"ID":"83","ans":"D","url":"img/83.png","topic":"15块奶酪，一只老鼠偷4块，有（）只老鼠才能偷完奶酪。","A":"A","AText":"1","B":"B","BText":"3","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"84","ans":"C","url":"img/84.png","topic":"一个人分6块蛋糕，21块蛋糕可以分（）人。","A":"A","AText":"6","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"85","ans":"C","url":"img/85.png","topic":"20顶帽子，一人买3顶，可以卖给（）个人。","A":"A","AText":"2","B":"B","BText":"8","C":"C","CText":"6","D":"D","DText":"4"},
            {"ID":"86","ans":"C","url":"img/86.png","topic":"一个小朋友最多种2棵树，（）个小朋友可以种完5棵树。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"3","D":"D","DText":"2"},
            {"ID":"87","ans":"B","url":"img/87.png","topic":"一个大人可以种4棵树，（）个大人可以种完10棵树。","A":"A","AText":"1","B":"B","BText":"3","C":"C","CText":"5","D":"D","DText":"2"},
            {"ID":"88","ans":"D","url":"img/88.png","topic":"10个桃子，每个猴子分3个，可以分给（）个猴子。","A":"A","AText":"1","B":"B","BText":"4","C":"C","CText":"2","D":"D","DText":"3"},
            {"ID":"89","ans":"A","url":"img/89.png","topic":"一个熊猫最多吃2根竹子，（）只熊猫能吃完9根竹子。","A":"A","AText":"5","B":"B","BText":"6","C":"C","CText":"8","D":"D","DText":"7"},
            {"ID":"90","ans":"C","url":"img/90.png","topic":"一人分2个粽子，（）人分完15个粽子。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"6","D":"D","DText":"1"},
            {"ID":"91","ans":"D","url":"img/91.png","topic":"每个人最多买4块手表，（）人可以买完15块手表。","A":"A","AText":"1","B":"B","BText":"8","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"92","ans":"C","url":"img/92.png","topic":"20块手表，一人分9块，最后还剩（）块。","A":"A","AText":"3","B":"B","BText":"9","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"93","ans":"D","url":"img/93.png","topic":"14块饼干，一人至少吃4块，最多分给（）个小朋友。","A":"A","AText":"3","B":"B","BText":"8","C":"C","CText":"2","D":"D","DText":"4"},
            {"ID":"94","ans":"B","url":"img/94.png","topic":"3个棒子可以拼成一个三角形，17根棒子，最多可以拼（）个三角形。","A":"A","AText":"10","B":"B","BText":"5","C":"C","CText":"9","D":"D","DText":"6"},
            {"ID":"95","ans":"B","url":"img/95.png","topic":"10辆玩具汽车，一人分3辆，可以分给（）人。","A":"A","AText":"2","B":"B","BText":"3","C":"C","CText":"4","D":"D","DText":"5"},
            {"ID":"96","ans":"A","url":"img/96.png","topic":"16个椰子，一个人分3个，可以分给（）个人。","A":"A","AText":"5","B":"B","BText":"9","C":"C","CText":"3","D":"D","DText":"1"},
            {"ID":"97","ans":"C","url":"img/97.png","topic":"16顶帽子，一个箱子最多可以装6顶，装完这些帽子至少需要（）个箱子。","A":"A","AText":"2","B":"B","BText":"8","C":"C","CText":"3","D":"D","DText":"4"},
            {"ID":"98","ans":"D","url":"img/98.png","topic":"13个娃娃，一个老师分4个，最后还剩（）个娃娃。","A":"A","AText":"2","B":"B","BText":"4","C":"C","CText":"3","D":"D","DText":"1"},
            {"ID":"99","ans":"B","url":"img/99.png","topic":"一个盘子最多装4块月饼，18块月饼需要用（）个盘子才能装完。","A":"A","AText":"1","B":"B","BText":"5","C":"C","CText":"4","D":"D","DText":"6"},
            {"ID":"100","ans":"D","url":"img/100.png","topic":"4个棒子拼成一个正方形，30根棒子，能拼成（）个正方形。","A":"A","AText":"5","B":"B","BText":"8","C":"C","CText":"9","D":"D","DText":"7"}
        ];
        var data_index=0,data_click=false,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=10,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],commentset=[];
        var feedbackArr=[];
        pushArr(data);
        function topicFun(data_index){
            initFun();
            $("#img").attr("src",data[data_index].url);
            $("#topic").text(data[data_index].topic);
            $("#item2_A").text(data[data_index].AText);
            $("#item2_B").text(data[data_index].BText);
            $("#item2_C").text(data[data_index].CText);
            $("#item2_D").text(data[data_index].DText);
            $("#item2_A").attr("data-data",data[data_index].A);
            $("#item2_B").attr("data-data",data[data_index].B);
            $("#item2_C").attr("data-data",data[data_index].C);
            $("#item2_D").attr("data-data",data[data_index].D);
            inMoveFun();
        }
        function inMoveFun() {
            $("#item2_item_box").addClass("item2_set_move");
            $("#item2_item_box").removeClass("item2_set_out");
            $("#byBox_1").addClass("byBox_move");
            $("#byBox_1").removeClass("byBox_out");
            $("#xrBox_1").addClass("xrBox_move");
            $("#xrBox_1").removeClass("xrBox_out");
            $("#item2_topic_box").addClass("topic_move");
            $("#item2_topic_box").removeClass("topic_out");
        }
        function outMoveFun() {
            $("#item2_item_box").removeClass("item2_set_move");
            $("#item2_item_box").addClass("item2_set_out");
            $("#byBox_1").removeClass("byBox_move");
            $("#byBox_1").addClass("byBox_out");
            $("#xrBox_1").removeClass("xrBox_move");
            $("#xrBox_1").addClass("xrBox_out");
            $("#item2_topic_box").removeClass("topic_move");
            $("#item2_topic_box").addClass("topic_out");
        }
        function initFun() {
            $("#item2_A").text(" ");
            $("#item2_B").text(" ");
            $("#item2_C").text(" ");
            $("#item2_D").text(" ");
            $("#topic").text(" ");
            $("#img").attr("src"," ");
        }
        function feedbackFun(obj,ans,ans1,time) {
            var feedback={
                "url":"",
                "topic":"",
                "time":"",
                "ans":"",
                "ans1":""
            };
            feedback.time=time;
            feedback.url=obj.url;
            feedback.topic=obj.topic;
            feedback.ans=textFun(ans,obj);
            feedback.ans1=textFun(ans1,obj);
            feedbackArr.push(feedback);
        }
        function textFun(ans,obj) {
            if(ans=="A"){
                return obj.AText
            }else if(ans=="B"){
                return obj.BText
            }else if(ans=="C"){
                return obj.CText
            }else if(ans=="D"){
                return obj.DText
            }
        }
        $("#img1").on("click",function () {
            mouldTime=$("#input1[type='checkbox']").is(':checked');
            data_number=data.length;
            data_click=true;
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
                var key=$(this).attr("data-data");
                keyFun(key);
            }
        });
        function keyFun(key) {
            endTime=new Date().getTime();
            time=(endTime-beginTime).toFixed(0);
            // $(".item2_item img").removeClass("revolve");
            var ans=data[data_index].ans;
            var ans1=key;
            stimidset.push(data[data_index].ID);
            type4set.push(type4Num);
            correctanswerset.push(ans);
            buttonset.push(ans1);
            timeset.push(time);
            feedbackFun(data[data_index],ans,ans1,time);
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
            outMoveFun();
            $("#xs3").text(Math.round((correct_number/(data_index+1))*100)+"%");
            nextTopicFun()
        }
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
            commentset.push(((correct_number/stimidset.length)*100).toFixed(2)+"%");
            commentset.push(correct_number);
            commentset.push(correct_number);
            topicResultFun(feedbackArr);
            $("#reward").addClass("hide");
            $("#item2").addClass("hide");
            $("#item3").removeClass("hide");
        }
        function topicResultFun(arr) {
            for (var i = 0; i < arr.length; i++) {
                var topicCon,ansCon,buttonsetCon,timesetCon;
                topicCon='<img src="'+arr[i].url+'" alt=""><div>'+arr[i].topic+'</div>'
                ansCon=arr[i].ans;
                buttonsetCon=arr[i].ans1;
                timesetCon=arr[i].time;
                $("#topic_result").append(
                    '<tr>' +
                    '<td class="tableTd">'+topicCon+'</td>' +
                    '<td class="tableTd">'+ansCon+'</td>' +
                    '<td class="tableTd">'+buttonsetCon+'</td>' +
                    '<td class="tableTd">'+timesetCon+'</td>' +
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