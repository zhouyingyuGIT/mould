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
        <div id="item2" class="item item2 hide">
            <div class="item item2_box">
                <div class="item2_topic">
                    <div id="topic" class="item2_ti font_size">
                        <div style="width: 30%">
                            <img id="topic_img1" src="img/11.png" alt="">
                        </div>
                        <div style="width: 70%">
                            <img id="topic_img2" src="img/1.png" alt="">
                        </div>
                    </div>
                </div>
                <div class="item2_ans_box" style="">
                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="A" class="item2_set" id="item2_A">
                                <img id="imgA" src="img/111.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="B" class="item2_set" id="item2_B">
                                <img id="imgB" src="img/111.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="C" class="item2_set" id="item2_C">
                                <img id="imgC" src="img/111.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="D" class="item2_set" id="item2_D">
                                <img id="imgD" src="img/111.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="E" class="item2_set" id="item2_E">
                                <img id="imgE" src="img/111.png" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="item2_fiex" style="">
                        <div class="item2_item">
                            <div data-data="F" class="item2_set" id="item2_F">
                                <img id="imgF" src="img/111.png" alt="">
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
            {"ID":"1","ans":"A","url1":"img/1.png","url2":"img/11.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/111.png"},
            {"ID":"2","ans":"B","url1":"img/1.png","url2":"img/12.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/122.png"},
            {"ID":"3","ans":"C","url1":"img/1.png","url2":"img/13.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/133.png"},
            {"ID":"4","ans":"D","url1":"img/1.png","url2":"img/14.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/144.png"},
            {"ID":"5","ans":"B","url1":"img/1.png","url2":"img/15.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/122.png"},
            {"ID":"6","ans":"E","url1":"img/1.png","url2":"img/16.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/166.png"},
            {"ID":"7","ans":"F","url1":"img/1.png","url2":"img/17.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/177.png"},
            {"ID":"8","ans":"A","url1":"img/2.png","url2":"img/21.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/211.png"},
            {"ID":"9","ans":"B","url1":"img/2.png","url2":"img/22.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/222.png"},
            {"ID":"10","ans":"C","url1":"img/2.png","url2":"img/23.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/233.png"},
            {"ID":"11","ans":"D","url1":"img/2.png","url2":"img/24.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/244.png"},
            {"ID":"12","ans":"E","url1":"img/2.png","url2":"img/25.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/255.png"},
            {"ID":"13","ans":"F","url1":"img/2.png","url2":"img/26.png","A":"img/211.png","B":"img/222.png","C":"img/233.png","D":"img/244.png","E":"img/255.png","F":"img/266.png","ansurl":"img/266.png"},
            {"ID":"14","ans":"A","url1":"img/3.png","url2":"img/31.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/311.png"},
            {"ID":"15","ans":"B","url1":"img/3.png","url2":"img/32.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/322.png"},
            {"ID":"16","ans":"C","url1":"img/3.png","url2":"img/33.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/333.png"},
            {"ID":"17","ans":"D","url1":"img/3.png","url2":"img/34.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/344.png"},
            {"ID":"18","ans":"D","url1":"img/3.png","url2":"img/35.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/344.png"},
            {"ID":"19","ans":"E","url1":"img/3.png","url2":"img/36.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/355.png"},
            {"ID":"20","ans":"E","url1":"img/3.png","url2":"img/37.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/355.png"},
            {"ID":"21","ans":"A","url1":"img/3.png","url2":"img/38.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/311.png"},
            {"ID":"22","ans":"F","url1":"img/3.png","url2":"img/39.png","A":"img/311.png","B":"img/322.png","C":"img/333.png","D":"img/344.png","E":"img/355.png","F":"img/366.png","ansurl":"img/366.png"},
            {"ID":"23","ans":"A","url1":"img/4.png","url2":"img/41.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/166.png"},
            {"ID":"24","ans":"B","url1":"img/4.png","url2":"img/42.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/111.png"},
            {"ID":"25","ans":"C","url1":"img/4.png","url2":"img/43.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/144.png"},
            {"ID":"26","ans":"D","url1":"img/4.png","url2":"img/44.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/177.png"},
            {"ID":"27","ans":"E","url1":"img/4.png","url2":"img/45.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/122.png"},
            {"ID":"28","ans":"C","url1":"img/4.png","url2":"img/46.png","A":"img/166.png","B":"img/111.png","C":"img/144.png","D":"img/177.png","E":"img/122.png","F":"","ansurl":"img/144.png"},
            {"ID":"29","ans":"A","url1":"img/5.png","url2":"img/51.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/511.png"},
            {"ID":"30","ans":"B","url1":"img/5.png","url2":"img/52.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/522.png"},
            {"ID":"31","ans":"C","url1":"img/5.png","url2":"img/53.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/533.png"},
            {"ID":"32","ans":"D","url1":"img/5.png","url2":"img/54.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/544.png"},
            {"ID":"33","ans":"E","url1":"img/5.png","url2":"img/55.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/555.png"},
            {"ID":"34","ans":"F","url1":"img/5.png","url2":"img/56.png","A":"img/511.png","B":"img/522.png","C":"img/533.png","D":"img/544.png","E":"img/555.png","F":"img/566.png","ansurl":"img/566.png"},
            {"ID":"35","ans":"A","url1":"img/6.png","url2":"img/61.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/533.png"},
            {"ID":"36","ans":"B","url1":"img/6.png","url2":"img/62.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/511.png"},
            {"ID":"37","ans":"C","url1":"img/6.png","url2":"img/63.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/633.png"},
            {"ID":"38","ans":"D","url1":"img/6.png","url2":"img/64.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/522.png"},
            {"ID":"39","ans":"E","url1":"img/6.png","url2":"img/65.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/655.png"},
            {"ID":"40","ans":"F","url1":"img/6.png","url2":"img/66.png","A":"img/533.png","B":"img/511.png","C":"img/633.png","D":"img/522.png","E":"img/655.png","F":"img/555.png","ansurl":"img/555.png"}
        ];
        var data2=[
            {"ID":"1","ans":"A","url1":"img/1.png","url2":"img/11.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/111.png"},
            {"ID":"2","ans":"B","url1":"img/1.png","url2":"img/12.png","A":"img/111.png","B":"img/122.png","C":"img/133.png","D":"img/144.png","E":"img/166.png","F":"img/177.png","ansurl":"img/122.png"}
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
            init();
            $("#item2_A img").attr("src",data[data_index].A);
            $("#item2_B img").attr("src",data[data_index].B);
            $("#item2_C img").attr("src",data[data_index].C);
            $("#item2_D img").attr("src",data[data_index].D);
            $("#item2_E img").attr("src",data[data_index].E);
            $("#item2_F img").attr("src",data[data_index].F);
            $("#topic_img1").attr("src",data[data_index].url2);
            $("#topic_img2").attr("src",data[data_index].url1);

        }
        function init() {
            $("#item2_A img").attr("src"," ");
            $("#item2_B img").attr("src"," ");
            $("#item2_C img").attr("src"," ");
            $("#item2_D img").attr("src"," ");
            $("#item2_E img").attr("src"," ");
            $("#item2_F img").attr("src"," ");
            $("#topic_img1").attr("src"," ");
            $("#topic_img2").attr("src"," ");
        }
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