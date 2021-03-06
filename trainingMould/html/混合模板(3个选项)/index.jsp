<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="com.lattice.entity.*" %>
<%@ page language="java" import="com.lattice.dao.*,java.util.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>混合模板(3个选项)</title>
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
            <!--<img src="yun.png" alt="">-->
            <div style="position: relative;top: 20%;">
                <span id="name"><%=realname %></span><span id="respectfully"></span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span><%=ots.get(0).getInstruction() %></span>
            </div>


        </div>

        <div class="item1_img item1_imgBox2">
            <img id="img1" src="taiyang.png" alt="">
        </div>
    </div>
    <div id="item2" class="item hide item2">
        <div class="item item2_box">
            <div class="item2_topic">
                <div id="topic" class="item2_ti">
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
            {"ID":"1","ans":"B","TU":"54+52-16=?","TAU":"true","A":"A","ATU":"81","ATAU":"true","B":"B","BTU":"90","BTAU":"true","C":"C","CTU":"80","CTAU":"true","D":"D","DTU":"100","DTAU":"true","ABCDTAU":"true"},
            {"ID":"2","ans":"B","TU":"35+42-23=?","TAU":"true","A":"A","ATU":"52","ATAU":"true","B":"B","BTU":"54","BTAU":"true","C":"C","CTU":"53","CTAU":"true","D":"D","DTU":"64","DTAU":"true","ABCDTAU":"true"},
            {"ID":"3","ans":"C","TU":"16-10+25=?","TAU":"true","A":"A","ATU":"30","ATAU":"true","B":"B","BTU":"39","BTAU":"true","C":"C","CTU":"31","CTAU":"true","D":"D","DTU":"img/T12-1.jpg","DTAU":"false","ABCDTAU":"true"},
            {"ID":"4","ans":"D","TU":"30-15+20=?","TAU":"true","A":"A","ATU":"30","ATAU":"true","B":"B","BTU":"img/T12-1.jpg","BTAU":"false","C":"C","CTU":"45","CTAU":"true","D":"D","DTU":"35","DTAU":"true","ABCDTAU":"true"},
            {"ID":"5","ans":"A","TU":"50+70-30=?","TAU":"true","A":"A","ATU":"90","ATAU":"true","B":"B","BTU":"80","BTAU":"true","C":"C","CTU":"81","CTAU":"true","D":"D","DTU":"100","DTAU":"true","ABCDTAU":"true"},
            {"ID":"6","ans":"B","TU":"60+22-32=?","TAU":"true","A":"A","ATU":"51","ATAU":"true","B":"B","BTU":"50","BTAU":"true","C":"C","CTU":"img/T12-1.jpg","CTAU":"false","D":"D","DTU":"60","DTAU":"true","ABCDTAU":"true"},
            {"ID":"7","ans":"C","TU":"522+156-312=?","TAU":"true","A":"A","ATU":"img/T12-1.jpg","ATAU":"false","B":"B","BTU":"356","BTAU":"true","C":"C","CTU":"366","CTAU":"true","D":"D","DTU":"360","DTAU":"true","ABCDTAU":"true"},
            {"ID":"8","ans":"A","TU":"878-666+266=?","TAU":"true","A":"A","ATU":"478","ATAU":"true","B":"B","BTU":"468","BTAU":"true","C":"C","CTU":"480","CTAU":"true","D":"D","DTU":"469","DTAU":"true","ABCDTAU":"true"},
            {"ID":"9","ans":"D","TU":"789+101-310=?","TAU":"true","A":"A","ATU":"380","ATAU":"true","B":"B","BTU":"368","BTAU":"true","C":"C","CTU":"370","CTAU":"true","D":"D","DTU":"378","DTAU":"true","ABCDTAU":"true"},
            {"ID":"10","ans":"C","TU":"304-104+232=?","TAU":"true","A":"A","ATU":"430","ATAU":"true","B":"B","BTU":"422","BTAU":"true","C":"C","CTU":"432","CTAU":"true","D":"D","DTU":"420","DTAU":"true","ABCDTAU":"true"},
            {"ID":"12","ans":"D","TU":"img/T12-0.jpg","TAU":"false","A":"A","ATU":"img/T12-1.jpg","ATAU":"false","B":"B","BTU":"img/T12-2.jpg","BTAU":"false","C":"C","CTU":"img/T12-3.jpg","CTAU":"false","D":"D","DTU":"img/T12-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"13","ans":"B","TU":"img/T13-0.jpg","TAU":"false","A":"A","ATU":"img/T13-1.jpg","ATAU":"false","B":"B","BTU":"img/T13-2.jpg","BTAU":"false","C":"C","CTU":"img/T13-3.jpg","CTAU":"false","D":"D","DTU":"img/T13-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"14","ans":"A","TU":"img/T14-0.jpg","TAU":"false","A":"A","ATU":"img/T14-1.jpg","ATAU":"false","B":"B","BTU":"img/T14-2.jpg","BTAU":"false","C":"C","CTU":"img/T14-3.jpg","CTAU":"false","D":"D","DTU":"img/T14-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"15","ans":"A","TU":"img/T15-0.jpg","TAU":"false","A":"A","ATU":"img/T15-1.jpg","ATAU":"false","B":"B","BTU":"img/T15-2.jpg","BTAU":"false","C":"C","CTU":"img/T15-3.jpg","CTAU":"false","D":"D","DTU":"img/T15-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"16","ans":"D","TU":"img/T16-0.jpg","TAU":"false","A":"A","ATU":"img/T16-1.jpg","ATAU":"false","B":"B","BTU":"img/T16-2.jpg","BTAU":"false","C":"C","CTU":"img/T16-3.jpg","CTAU":"false","D":"D","DTU":"img/T16-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"17","ans":"C","TU":"img/T17-0.jpg","TAU":"false","A":"A","ATU":"img/T17-1.jpg","ATAU":"false","B":"B","BTU":"img/T17-2.jpg","BTAU":"false","C":"C","CTU":"img/T17-3.jpg","CTAU":"false","D":"D","DTU":"img/T17-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"18","ans":"B","TU":"img/T18-0.jpg","TAU":"false","A":"A","ATU":"img/T18-1.jpg","ATAU":"false","B":"B","BTU":"img/T18-2.jpg","BTAU":"false","C":"C","CTU":"img/T18-3.jpg","CTAU":"false","D":"D","DTU":"img/T18-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"19","ans":"D","TU":"img/T19-0.jpg","TAU":"false","A":"A","ATU":"img/T19-1.jpg","ATAU":"false","B":"B","BTU":"img/T19-2.jpg","BTAU":"false","C":"C","CTU":"img/T19-3.jpg","CTAU":"false","D":"D","DTU":"img/T19-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"20","ans":"A","TU":"img/T20-0.jpg","TAU":"false","A":"A","ATU":"img/T20-1.jpg","ATAU":"false","B":"B","BTU":"img/T20-2.jpg","BTAU":"false","C":"C","CTU":"img/T20-3.jpg","CTAU":"false","D":"D","DTU":"img/T20-4.jpg","DTAU":"false","ABCDTAU":"false"},
            {"ID":"21","ans":"A","TU":"img/T21-0.jpg","TAU":"false","A":"A","ATU":"img/T21-1.jpg","ATAU":"false","B":"B","BTU":"img/T21-2.jpg","BTAU":"false","C":"C","CTU":"img/T21-3.jpg","CTAU":"false","D":"D","DTU":"img/T21-4.jpg","DTAU":"false","ABCDTAU":"false"}
        ];
        var data_index=0,data_click=false,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=10,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],topicArr=[],commentset=[],ansText=[],buttonsetText=[];
        var ansTAUArr=[],xtauArr=[],tauArr=[];
        pushArr(data);
        function topicFun(data_index){
            /*border-radius:100%;background:#ff6700;*/
            $("#item2_A").text(" ");
            $("#item2_B").text(" ");
            $("#item2_C").text(" ");
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

            if(data[data_index].TAU=="true"){
                console.log(data[data_index].TAU);
                $("#topic").append(
                    '<div>'+data[data_index].TU+'</div>'
                )
            }else {
                $("#topic").append(
                    '<img src="'+data[data_index].TU+'" alt="">'
                )
            }

        }
        function textFun(ans, ans1) {
            if(ans == "Q"){
                ansText.push(data[data_index].QTU);
                ansTAUArr.push(data[data_index].QTAU);
            }else if(ans=="P"){
                ansText.push(data[data_index].PTU);
                ansTAUArr.push(data[data_index].PTAU);
            }else if(ans=="A"){
                ansText.push(data[data_index].ATU);
                ansTAUArr.push(data[data_index].ATAU);
            }else if(ans=="B"){
                ansText.push(data[data_index].BTU);
                ansTAUArr.push(data[data_index].BTAU);
            }else if(ans=="C"){
                ansText.push(data[data_index].CTU);
                ansTAUArr.push(data[data_index].CTAU);
            }else if(ans=="D"){
                ansText.push(data[data_index].DTU);
                ansTAUArr.push(data[data_index].DTAU);
            }else if(ans=="E"){
                ansText.push(data[data_index].ETU);
                ansTAUArr.push(data[data_index].ETAU);
            }else if(ans=="F"){
                ansText.push(data[data_index].FTU);
                ansTAUArr.push(data[data_index].FTAU);
            }
            if(ans1 == "Q"){
                buttonsetText.push(data[data_index].QTU);
                xtauArr.push(data[data_index].QTAU);
            }else if(ans1=="P"){
                buttonsetText.push(data[data_index].PTU);
                xtauArr.push(data[data_index].PTAU);
            }else if(ans1=="A"){
                buttonsetText.push(data[data_index].ATU);
                xtauArr.push(data[data_index].ATAU);
            }else if(ans1=="B"){
                buttonsetText.push(data[data_index].BTU);
                xtauArr.push(data[data_index].BTAU);
            }else if(ans1=="C"){
                buttonsetText.push(data[data_index].CTU);
                xtauArr.push(data[data_index].CTAU);
            }else if(ans1=="D"){
                buttonsetText.push(data[data_index].DTU);
                xtauArr.push(data[data_index].DTAU);
            }else if(ans1=="E"){
                buttonsetText.push(data[data_index].ETU);
                xtauArr.push(data[data_index].ETAU);
            }else if(ans1=="F"){
                buttonsetText.push(data[data_index].FTU);
                xtauArr.push(data[data_index].FTAU);
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
            console.log(ans1+","+ans);
            stimidset.push(data[data_index].ID);
            type4set.push(type4Num);
            topicArr.push(data[data_index].TU);
            tauArr.push(data[data_index].TAU);
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
            topicResultFun(stimidset);
            $("#reward").addClass("hide");
            $("#item2").addClass("hide");
            $("#item3").removeClass("hide");
        }
        function topicResultFun(arr) {
            for (var i = 0; i < arr.length; i++) {
                var topicCon,ansCon,buttonsetCon;
                if(tauArr[i] == "true"){
                    topicCon=topicArr[i]
                }else {
                    topicCon='<img src="'+topicArr[i]+'" alt="">'
                }
                if(ansTAUArr[i] == "true"){
                    ansCon=ansText[i]
                }else {
                    ansCon='<img src="'+ansText[i]+'" alt="">'
                }
                if(xtauArr[i] == "true"){
                    buttonsetCon=buttonsetText[i]
                }else {
                    buttonsetCon='<img src="'+buttonsetText[i]+'" alt="">'
                }
                $("#topic_result").append(
                    '<tr>' +
                    '<td class="tableTd">'+topicCon+'</td>' +
                    '<td class="tableTd">'+ansCon+'</td>' +
                    '<td class="tableTd">'+buttonsetCon+'</td>' +
                    '<td class="tableTd">'+timeset[i]+'</td>' +
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