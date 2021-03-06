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
                <div id="item2_topic_box" class="item2_topic_box topic_move div_flex">
                    <div class="div_flex imgBox">
                        <img id="url1" src="" alt="">
                    </div>
                    <div class="div_flex imgBox">
                        <img id="add" src="" alt="" style="max-width: 50%;max-height: 50%;">
                    </div>
                    <div class="div_flex imgBox">
                        <img id="url2" src="" alt="">
                    </div>
                    <div class="div_flex imgBox">
                        <img src="dengyu.png" alt="" style="max-width: 50%;max-height: 50%;">
                    </div>
                </div>
            </div>
            <div id="item2_ans_box" class="item2_ans_box">
                <div id="item2_item_box" class="item2_item_box item2_set_move">
                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="A" class="item2_set" id="item2_A" style="margin-top: -16px;">
                                <img src="img/1.1.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="B" class="item2_set" id="item2_B">
                                <img src="img/1.1.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="C" class="item2_set" id="item2_C" style="margin-top: -12px;">
                                <img src="img/1.1.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="D" class="item2_set" id="item2_D">
                                <img src="img/1.1.png" alt="">
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
            {"ID":"1","url1":"img/1.2.png","add":"jia.png","url2":"img/1.3.png","ans":"A","A":"img/5.6.png","B":"img/2.5.png","C":"img/1.5.png","D":"img/3.7.png"},
            {"ID":"2","url1":"img/1.2.png","add":"jia.png","url2":"img/1.8.png","ans":"A","A":"img/5.8.png","B":"img/8.5.png","C":"img/5.6.png","D":"img/3.4.png"}
        ];
        var data_index=0,data_click=false,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=10,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],commentset=[];
        var feedbackArr=[];

        function topicFun(data_index){
            initFun();
            $("#url1").attr("src",data[data_index].url1);
            $("#url2").attr("src",data[data_index].url2);
            $("#add").attr("src",data[data_index].add);
            $("#item2_A img").attr("src",data[data_index].A);
            $("#item2_B img").attr("src",data[data_index].B);
            $("#item2_C img").attr("src",data[data_index].C);
            $("#item2_D img").attr("src",data[data_index].D);
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
            $("#url1").attr("src"," ");
            $("#url2").attr("src"," ");
            $("#add").attr("src"," ");
            $("#item2_A img").attr("src"," ");
            $("#item2_B img").attr("src"," ");
            $("#item2_C img").attr("src"," ");
            $("#item2_D img").attr("src"," ");
        }
        function feedbackFun(obj,ans,ans1,time) {
            var feedback={
                "url1":"",
                "add":"",
                "url2":"",
                "time":"",
                "ans":"",
                "ans1":""
            };
            feedback.time=time;
            feedback.url1=obj.url1;
            feedback.add=obj.add;
            feedback.url2=obj.url2;
            feedback.ans=obj[ans];
            feedback.ans1=obj[ans1];
            feedbackArr.push(feedback);
        }
        $("#img1").on("click",function () {
            pushArr(data);
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
                topicCon='<img src="'+arr[i].url1+'" alt=""><img src="'+arr[i].add+'" alt="" style="max-height: 30px;max-width: 30px;"><img src="'+arr[i].url2+'" alt=""><img src="dengyu.png" alt="" style="max-height: 30px;max-width: 30px;">'
                ansCon='<img src="'+arr[i].ans+'" alt="">';
                buttonsetCon='<img src="'+arr[i].ans1+'" alt="">';
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