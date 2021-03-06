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
    <div id="item2" class="item hide" style="background: #afdcff;">
        <div class="item" style="background-image: url('timg.gif');background-size: 100% 100%;">
            <div style="display: flex;align-items:center;justify-content:center;height: 50%;">
                <div id="topic" class="item2_ti">
                    <img id="img2" src="" alt="">
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
            {"ID":"1","ans":"Q","url":"img/0100.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"2","ans":"P","url":"img/0200.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"3","ans":"Q","url":"img/0300.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"4","ans":"Q","url":"img/0400.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"5","ans":"P","url":"img/0500.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"6","ans":"Q","url":"img/0600.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"7","ans":"P","url":"img/0700.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"8","ans":"Q","url":"img/0800.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"9","ans":"P","url":"img/0900.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"10","ans":"P","url":"img/1000.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"11","ans":"Q","url":"img/1100.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"12","ans":"P","url":"img/1200.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"13","ans":"Q","url":"img/1300.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"14","ans":"Q","url":"img/1400.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"15","ans":"P","url":"img/1500.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"16","ans":"P","url":"img/1600.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"17","ans":"P","url":"img/1700.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"18","ans":"P","url":"img/1800.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"19","ans":"Q","url":"img/1900.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"20","ans":"Q","url":"img/2000.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"21","ans":"P","url":"img/2100.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"22","ans":"Q","url":"img/2200.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"23","ans":"Q","url":"img/2300.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"24","ans":"P","url":"img/2400.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"25","ans":"Q","url":"img/2500.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"26","ans":"P","url":"img/2600.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"27","ans":"P","url":"img/2700.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"28","ans":"Q","url":"img/2800.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"29","ans":"Q","url":"img/2900.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"30","ans":"P","url":"img/3000.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"31","ans":"Q","url":"img/3100.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"32","ans":"P","url":"img/3200.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"33","ans":"P","url":"img/3300.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"34","ans":"P","url":"img/3400.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"35","ans":"Q","url":"img/3500.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"36","ans":"Q","url":"img/3600.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"37","ans":"P","url":"img/3700.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"38","ans":"P","url":"img/3800.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"39","ans":"Q","url":"img/3900.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"40","ans":"Q","url":"img/4000.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"41","ans":"P","url":"img/4100.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"42","ans":"Q","url":"img/4200.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"43","ans":"P","url":"img/4300.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"44","ans":"Q","url":"img/4400.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"45","ans":"Q","url":"img/4500.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"46","ans":"P","url":"img/4600.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"47","ans":"Q","url":"img/4700.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"48","ans":"Q","url":"img/4800.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"49","ans":"P","url":"img/4900.png","P":"P","PText":"否","Q":"Q","QText":"是"},
            {"ID":"50","ans":"Q","url":"img/5000.png","P":"P","PText":"否","Q":"Q","QText":"是"}
        ];
        var data_index=0,data_click=false,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=30,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],topicArr=[],commentset=[],ansText=[],buttonsetText=[];
        pushArr(data);
        topicFun(data_index);
        function topicFun(data_index){
            $("#item2_A").text(data[data_index].AText);
            $("#item2_A").attr("data-data",data[data_index].A);
            $("#item2_B").text(data[data_index].BText);
            $("#item2_B").attr("data-data",data[data_index].B);
            $("#item2_C").text(data[data_index].CText);
            $("#item2_C").attr("data-data",data[data_index].C);
            // $(".item2_item img").addClass("revolve");
            $("#img2").attr("src",data[data_index].url);
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
            topicArr.push(data[data_index].url);
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
                    '<td style="height: 120px;"><img style="height: 100%;width: auto;" src="'+topicArr[i]+'" alt=""></td>' +
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
        $(document).keydown(function (event) {
            var e = event || window.event;
            var k = e.keyCode || e.which;
            if(k==81){
                if(data_click){
                    data_click=false;
                    keyFun("Q")

                }
            }
            if(k==80){
                if(data_click){
                    data_click=false;
                    keyFun("P")

                }
            }

        });
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