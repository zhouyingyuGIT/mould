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
<div id="xs1"></div>
<div id="box" style="background: #000;color: #fff">
    <div id="item1" class="item">
        <div style="height: 20%"></div>
        <div class="item1_imgBox1" style="">
            <%=ots.get(0).getInstruction() %>
        </div>
    </div>
    <div id="item2" class="item hide">
        <div class="item">
            <div class="item2_ti" style="">
                <img id="topic" src="" alt="" style="max-height: 100%;max-width: 100%;">
            </div>
            <div class="item2_ans_box" style="">
                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_A">
                            <img src="" alt="" style="max-height: 100%;max-width: 100%;">
                        </div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_B">
                            <img src="" alt="" style="max-height: 100%;max-width: 100%;">
                        </div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_C">
                            <img src="" alt="" style="max-height: 100%;max-width: 100%;">
                        </div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="" class="item2_set" id="item2_D">
                            <img src="" alt="" style="max-height: 100%;max-width: 100%;">
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
        var data=[
            {"id":"1","topic":"2+2","A":"5","AText":"6","B":"3","BText":"4","C":"4","CText":"5","D":"7","DText":"8","ans":"3","ansText":"4"},
            {"id":"2","topic":"2+3","A":"6","AText":"7","B":"3","BText":"4","C":"4","CText":"5","D":"7","DText":"8","ans":"4","ansText":"5"},
            {"id":"3","topic":"2+4","A":"6","AText":"7","B":"3","BText":"4","C":"4","CText":"5","D":"5","DText":"6","ans":"5","ansText":"6"},
            {"id":"4","topic":"2+5","A":"6","AText":"7","B":"3","BText":"4","C":"4","CText":"5","D":"5","DText":"6","ans":"6","ansText":"7"},
            {"id":"5","topic":"2+6","A":"2","AText":"3","B":"7","BText":"8","C":"4","CText":"5","D":"5","DText":"6","ans":"7","ansText":"8"},
            {"id":"6","topic":"2+7","A":"8","AText":"9","B":"7","BText":"8","C":"4","CText":"5","D":"5","DText":"6","ans":"8","ansText":"9"},
            {"id":"7","topic":"2+8","A":"4","AText":"5","B":"7","BText":"8","C":"3","CText":"4","D":"9","DText":"10","ans":"9","ansText":"10"},
            {"id":"8","topic":"2+9","A":"4","AText":"5","B":"10","BText":"11","C":"6","CText":"7","D":"9","DText":"10","ans":"10","ansText":"11"},
            {"id":"9","topic":"3+2","A":"4","AText":"5","B":"2","BText":"3","C":"7","CText":"8","D":"9","DText":"10","ans":"4","ansText":"5"},
            {"id":"10","topic":"3+3","A":"4","AText":"5","B":"5","BText":"6","C":"7","CText":"8","D":"9","DText":"10","ans":"5","ansText":"6"},
            {"id":"11","topic":"3+4","A":"4","AText":"5","B":"5","BText":"6","C":"7","CText":"8","D":"6","DText":"7","ans":"6","ansText":"7"},
            {"id":"12","topic":"3+5","A":"4","AText":"5","B":"5","BText":"6","C":"7","CText":"8","D":"6","DText":"7","ans":"7","ansText":"8"},
            {"id":"13","topic":"3+6","A":"4","AText":"5","B":"5","BText":"6","C":"8","CText":"9","D":"6","DText":"7","ans":"8","ansText":"9"},
            {"id":"14","topic":"3+7","A":"9","AText":"10","B":"5","BText":"6","C":"8","CText":"9","D":"6","DText":"7","ans":"9","ansText":"10"},
            {"id":"15","topic":"3+8","A":"9","AText":"10","B":"5","BText":"6","C":"8","CText":"9","D":"10","DText":"11","ans":"10","ansText":"11"},
            {"id":"16","topic":"3+9","A":"9","AText":"10","B":"11","BText":"12","C":"8","CText":"9","D":"10","DText":"11","ans":"11","ansText":"12"},
            {"id":"17","topic":"4+2","A":"6","AText":"7","B":"4","BText":"5","C":"5","CText":"6","D":"7","DText":"8","ans":"5","ansText":"6"},
            {"id":"18","topic":"4+3","A":"6","AText":"7","B":"4","BText":"5","C":"5","CText":"6","D":"7","DText":"8","ans":"6","ansText":"7"},
            {"id":"19","topic":"4+4","A":"6","AText":"7","B":"4","BText":"5","C":"5","CText":"6","D":"7","DText":"8","ans":"7","ansText":"8"},
            {"id":"20","topic":"4+5","A":"6","AText":"7","B":"8","BText":"9","C":"5","CText":"6","D":"7","DText":"8","ans":"8","ansText":"9"},
            {"id":"21","topic":"4+6","A":"9","AText":"10","B":"8","BText":"9","C":"10","CText":"11","D":"7","DText":"8","ans":"9","ansText":"10"},
            {"id":"22","topic":"4+7","A":"9","AText":"10","B":"8","BText":"9","C":"10","CText":"11","D":"7","DText":"8","ans":"10","ansText":"11"},
            {"id":"23","topic":"4+8","A":"9","AText":"10","B":"8","BText":"9","C":"10","CText":"11","D":"11","DText":"12","ans":"11","ansText":"12"},
            {"id":"24","topic":"4+9","A":"9","AText":"10","B":"12","BText":"13","C":"10","CText":"11","D":"11","DText":"12","ans":"12","ansText":"13"},
            {"id":"25","topic":"5+2","A":"9","AText":"10","B":"7","BText":"8","C":"10","CText":"11","D":"6","DText":"7","ans":"6","ansText":"7"},
            {"id":"26","topic":"5+3","A":"9","AText":"10","B":"7","BText":"8","C":"10","CText":"11","D":"6","DText":"7","ans":"7","ansText":"8"},
            {"id":"27","topic":"5+4","A":"8","AText":"9","B":"7","BText":"8","C":"10","CText":"11","D":"6","DText":"7","ans":"8","ansText":"9"},
            {"id":"28","topic":"5+5","A":"8","AText":"9","B":"9","BText":"10","C":"10","CText":"11","D":"6","DText":"7","ans":"9","ansText":"10"},
            {"id":"29","topic":"5+6","A":"8","AText":"9","B":"9","BText":"10","C":"10","CText":"11","D":"6","DText":"7","ans":"10","ansText":"11"},
            {"id":"30","topic":"5+7","A":"11","AText":"12","B":"9","BText":"10","C":"10","CText":"11","D":"6","DText":"7","ans":"11","ansText":"12"},
            {"id":"31","topic":"5+8","A":"11","AText":"12","B":"9","BText":"10","C":"12","CText":"13","D":"13","DText":"14","ans":"12","ansText":"13"},
            {"id":"32","topic":"5+9","A":"11","AText":"12","B":"9","BText":"10","C":"12","CText":"13","D":"13","DText":"14","ans":"13","ansText":"14"},
            {"id":"33","topic":"6+2","A":"7","AText":"8","B":"9","BText":"10","C":"12","CText":"13","D":"8","DText":"9","ans":"7","ansText":"8"},
            {"id":"34","topic":"6+3","A":"7","AText":"8","B":"9","BText":"10","C":"12","CText":"13","D":"8","DText":"9","ans":"8","ansText":"9"},
            {"id":"35","topic":"6+4","A":"7","AText":"8","B":"9","BText":"10","C":"12","CText":"13","D":"8","DText":"9","ans":"9","ansText":"10"},
            {"id":"36","topic":"6+5","A":"14","AText":"15","B":"9","BText":"10","C":"12","CText":"13","D":"10","DText":"11","ans":"10","ansText":"11"},
            {"id":"37","topic":"6+6","A":"14","AText":"15","B":"11","BText":"12","C":"12","CText":"13","D":"10","DText":"11","ans":"11","ansText":"12"},
            {"id":"38","topic":"6+7","A":"14","AText":"15","B":"11","BText":"12","C":"12","CText":"13","D":"10","DText":"11","ans":"12","ansText":"13"},
            {"id":"39","topic":"6+8","A":"14","AText":"15","B":"11","BText":"12","C":"12","CText":"13","D":"13","DText":"14","ans":"13","ansText":"14"},
            {"id":"40","topic":"6+9","A":"14","AText":"15","B":"11","BText":"12","C":"12","CText":"13","D":"13","DText":"14","ans":"14","ansText":"15"},
            {"id":"41","topic":"7+2","A":"14","AText":"15","B":"8","BText":"9","C":"12","CText":"13","D":"13","DText":"14","ans":"8","ansText":"9"},
            {"id":"42","topic":"7+3","A":"9","AText":"10","B":"8","BText":"9","C":"12","CText":"13","D":"7","DText":"8","ans":"9","ansText":"10"},
            {"id":"43","topic":"7+4","A":"5","AText":"6","B":"8","BText":"9","C":"11","CText":"12","D":"10","DText":"11","ans":"10","ansText":"11"},
            {"id":"44","topic":"7+5","A":"11","AText":"12","B":"8","BText":"9","C":"12","CText":"13","D":"7","DText":"8","ans":"11","ansText":"12"},
            {"id":"45","topic":"7+6","A":"11","AText":"12","B":"9","BText":"10","C":"13","CText":"14","D":"12","DText":"13","ans":"12","ansText":"13"},
            {"id":"46","topic":"7+7","A":"9","AText":"10","B":"11","BText":"12","C":"12","CText":"13","D":"13","DText":"14","ans":"13","ansText":"14"},
            {"id":"47","topic":"7+8","A":"14","AText":"15","B":"11","BText":"12","C":"12","CText":"13","D":"13","DText":"14","ans":"14","ansText":"15"},
            {"id":"48","topic":"7+9","A":"14","AText":"15","B":"15","BText":"16","C":"12","CText":"13","D":"13","DText":"14","ans":"15","ansText":"16"},
            {"id":"49","topic":"8+2","A":"14","AText":"15","B":"15","BText":"16","C":"12","CText":"13","D":"9","DText":"10","ans":"9","ansText":"10"},
            {"id":"50","topic":"8+3","A":"14","AText":"15","B":"10","BText":"11","C":"12","CText":"13","D":"9","DText":"10","ans":"10","ansText":"11"},
            {"id":"51","topic":"8+4","A":"14","AText":"15","B":"10","BText":"11","C":"12","CText":"13","D":"11","DText":"12","ans":"11","ansText":"12"},
            {"id":"52","topic":"8+5","A":"14","AText":"15","B":"10","BText":"11","C":"12","CText":"13","D":"11","DText":"12","ans":"12","ansText":"13"},
            {"id":"53","topic":"8+6","A":"14","AText":"15","B":"13","BText":"14","C":"12","CText":"13","D":"11","DText":"12","ans":"13","ansText":"14"},
            {"id":"54","topic":"8+7","A":"14","AText":"15","B":"13","BText":"14","C":"12","CText":"13","D":"11","DText":"12","ans":"14","ansText":"15"},
            {"id":"55","topic":"8+8","A":"14","AText":"15","B":"13","BText":"14","C":"11","CText":"12","D":"15","DText":"16","ans":"15","ansText":"16"},
            {"id":"56","topic":"8+9","A":"15","AText":"16","B":"13","BText":"14","C":"14","CText":"15","D":"16","DText":"17","ans":"16","ansText":"17"},
            {"id":"57","topic":"9+2","A":"12","AText":"13","B":"11","BText":"12","C":"10","CText":"11","D":"17","DText":"18","ans":"10","ansText":"11"},
            {"id":"58","topic":"9+3","A":"11","AText":"12","B":"15","BText":"16","C":"10","CText":"11","D":"12","DText":"13","ans":"11","ansText":"12"},
            {"id":"59","topic":"9+4","A":"15","AText":"16","B":"11","BText":"12","C":"12","CText":"13","D":"10","DText":"11","ans":"12","ansText":"13"},
            {"id":"60","topic":"9+5","A":"14","AText":"15","B":"10","BText":"11","C":"13","CText":"14","D":"17","DText":"18","ans":"13","ansText":"14"},
            {"id":"61","topic":"9+6","A":"15","AText":"16","B":"14","BText":"15","C":"12","CText":"13","D":"13","DText":"14","ans":"14","ansText":"15"},
            {"id":"62","topic":"9+7","A":"15","AText":"16","B":"14","BText":"15","C":"13","CText":"14","D":"12","DText":"13","ans":"15","ansText":"16"},
            {"id":"63","topic":"9+8","A":"14","AText":"15","B":"15","BText":"16","C":"13","CText":"14","D":"16","DText":"17","ans":"16","ansText":"17"},
            {"id":"64","topic":"9+9","A":"17","AText":"18","B":"13","BText":"14","C":"14","CText":"15","D":"16","DText":"17","ans":"17","ansText":"18"}
        ];
        var spkey=true;
        var data_index=0,data_click=true,data_number=0;
        var time,beginTime,endTime;
        var maxtime=30,timer=null;
        var time1=500,timer1=null;
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],topicArr=[],commentset=[],ansText=[],buttonsetText=[];

        pushArr(data);
        function topicFun(data_index){
            $("#item2_A img").attr("src",data[data_index].Aurl);
            $("#item2_A").attr("data-data",data[data_index].A);
            $("#item2_B img").attr("src",data[data_index].Burl);
            $("#item2_B").attr("data-data",data[data_index].B);
            $("#item2_C img").attr("src",data[data_index].Curl);
            $("#item2_C").attr("data-data",data[data_index].C);
            $("#item2_D img").attr("src",data[data_index].Durl);
            $("#item2_D").attr("data-data",data[data_index].D);
            // $(".item2_item img").addClass("revolve");
            $("#topic").attr("src",data[data_index].url);
        }
        $("#img1").on("click",function () {
            data_number=data.length;
            topicFun(data_index);
            $("#item1").addClass("hide");
            $("#item2").removeClass("hide");
            $("#xs1").text(maxtime+"秒");
            timer = setInterval(function () {
                CountDown();
            }, 1000);
            beginTime=new Date().getTime();
        });
        $(".item2_set").on("click",function () {
            if(data_click){
                console.log($(this).attr("data-data"));
                endTime=new Date().getTime();
                time=(endTime-beginTime).toFixed(0);
                var ans=data[data_index].ans;
                var ans1=$(this).attr("data-data");
                stimidset.push(data[data_index].ID);
                type4set.push("0");
                topicArr.push(data[data_index].topic);
                correctanswerset.push(ans);
                buttonset.push(ans1);
                timeset.push(time);
                $("#item2").addClass("op");

                nextTopicFun()
            }

        });


        function nextTopicFun() {
            data_index++;
            if(data_number<=data_index){
                post_result();
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

        function CountDown() {
            if (maxtime > 0) {
                --maxtime;
                $("#xs1").text(maxtime+"秒")

            } else{
                post_result();
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

        $(document).keydown(function (event) {
            var e = event || window.event;
            var k = e.keyCode || e.which;

            if(k==32){
                if(spkey){
                    spkey=false;
                    data_number=data.length;
                    topicFun(data_index);
                    $("#item1").addClass("hide");
                    $("#item2").removeClass("hide");
                    timer = setInterval(function () {
                        CountDown();
                    }, 1000);
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
            opes_result_data.commentset = commentset.join(";");
            opes_result_data.numset = "";
            opes_post_result_util_js_opes_post_result(opes_result_data);
            return;
        }
    })
</script>
</html>