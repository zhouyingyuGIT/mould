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
    <div id="item1" class="item" style="background: #524db9;">
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

        <div class="item1_img item1_imgBox2" style="position: relative;">
            <div id="img1" class="beginText" style="left:0px">开始</div>
            <img src="begin.jpg" alt="" style="">
        </div>
    </div>
    <div id="item2" class="item hide" style="background: #afdcff;">
        <div class="item" style="background-image: url('timg.gif');background-size: 100% 100%;">
            <div class="item2_ans_box" style="">
                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="Q" class="item2_set" id="item2_A">
                            <img src="xx.jpg" alt="">
                        </div>
                    </div>
                </div>

                <div class="item2_fiex" style="">
                    <div class="item2_item">
                        <div data-data="P" class="item2_set" id="item2_B">
                            <img src="xx.jpg" alt="">
                        </div>
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
            {"id":"1","ans":"P","P":"img/001.png","Q":"img/121.png"},
            {"id":"2","ans":"P","P":"img/002.png","Q":"img/122.png"},
            {"id":"3","ans":"P","P":"img/003.png","Q":"img/123.png"},
            {"id":"4","ans":"P","P":"img/004.png","Q":"img/124.png"},
            {"id":"5","ans":"P","P":"img/005.png","Q":"img/125.png"},
            {"id":"6","ans":"P","P":"img/006.png","Q":"img/126.png"},
            {"id":"7","ans":"P","P":"img/007.png","Q":"img/127.png"},
            {"id":"8","ans":"P","P":"img/008.png","Q":"img/128.png"},
            {"id":"9","ans":"P","P":"img/009.png","Q":"img/129.png"},
            {"id":"10","ans":"P","P":"img/010.png","Q":"img/130.png"},
            {"id":"11","ans":"P","P":"img/011.png","Q":"img/131.png"},
            {"id":"12","ans":"P","P":"img/012.png","Q":"img/132.png"},
            {"id":"13","ans":"P","P":"img/013.png","Q":"img/133.png"},
            {"id":"14","ans":"P","P":"img/014.png","Q":"img/134.png"},
            {"id":"15","ans":"P","P":"img/015.png","Q":"img/135.png"},
            {"id":"16","ans":"P","P":"img/016.png","Q":"img/136.png"},
            {"id":"17","ans":"P","P":"img/017.png","Q":"img/137.png"},
            {"id":"18","ans":"P","P":"img/018.png","Q":"img/138.png"},
            {"id":"19","ans":"P","P":"img/019.png","Q":"img/139.png"},
            {"id":"20","ans":"P","P":"img/020.png","Q":"img/140.png"},
            {"id":"21","ans":"P","P":"img/021.png","Q":"img/141.png"},
            {"id":"22","ans":"P","P":"img/022.png","Q":"img/142.png"},
            {"id":"23","ans":"P","P":"img/023.png","Q":"img/143.png"},
            {"id":"24","ans":"P","P":"img/024.png","Q":"img/144.png"},
            {"id":"25","ans":"P","P":"img/025.png","Q":"img/145.png"},
            {"id":"26","ans":"P","P":"img/026.png","Q":"img/146.png"},
            {"id":"27","ans":"P","P":"img/027.png","Q":"img/147.png"},
            {"id":"28","ans":"P","P":"img/028.png","Q":"img/148.png"},
            {"id":"29","ans":"P","P":"img/029.png","Q":"img/149.png"},
            {"id":"30","ans":"P","P":"img/030.png","Q":"img/150.png"},
            {"id":"31","ans":"P","P":"img/031.png","Q":"img/151.png"},
            {"id":"32","ans":"P","P":"img/032.png","Q":"img/152.png"},
            {"id":"33","ans":"P","P":"img/033.png","Q":"img/153.png"},
            {"id":"34","ans":"P","P":"img/034.png","Q":"img/154.png"},
            {"id":"35","ans":"P","P":"img/035.png","Q":"img/155.png"},
            {"id":"36","ans":"P","P":"img/036.png","Q":"img/156.png"},
            {"id":"37","ans":"P","P":"img/037.png","Q":"img/157.png"},
            {"id":"38","ans":"P","P":"img/038.png","Q":"img/158.png"},
            {"id":"39","ans":"P","P":"img/039.png","Q":"img/159.png"},
            {"id":"40","ans":"P","P":"img/040.png","Q":"img/160.png"},
            {"id":"41","ans":"P","P":"img/041.png","Q":"img/161.png"},
            {"id":"42","ans":"P","P":"img/042.png","Q":"img/162.png"},
            {"id":"43","ans":"P","P":"img/043.png","Q":"img/163.png"},
            {"id":"44","ans":"P","P":"img/044.png","Q":"img/164.png"},
            {"id":"45","ans":"P","P":"img/045.png","Q":"img/165.png"},
            {"id":"46","ans":"P","P":"img/046.png","Q":"img/166.png"},
            {"id":"47","ans":"P","P":"img/047.png","Q":"img/167.png"},
            {"id":"48","ans":"P","P":"img/048.png","Q":"img/168.png"},
            {"id":"49","ans":"P","P":"img/049.png","Q":"img/169.png"},
            {"id":"50","ans":"P","P":"img/050.png","Q":"img/170.png"},
            {"id":"51","ans":"P","P":"img/051.png","Q":"img/171.png"},
            {"id":"52","ans":"P","P":"img/052.png","Q":"img/172.png"},
            {"id":"53","ans":"P","P":"img/053.png","Q":"img/173.png"},
            {"id":"54","ans":"P","P":"img/054.png","Q":"img/174.png"},
            {"id":"55","ans":"P","P":"img/055.png","Q":"img/175.png"},
            {"id":"56","ans":"P","P":"img/056.png","Q":"img/176.png"},
            {"id":"57","ans":"P","P":"img/057.png","Q":"img/177.png"},
            {"id":"58","ans":"P","P":"img/058.png","Q":"img/178.png"},
            {"id":"59","ans":"P","P":"img/059.png","Q":"img/179.png"},
            {"id":"60","ans":"P","P":"img/060.png","Q":"img/180.png"},
            {"id":"61","ans":"Q","P":"img/061.png","Q":"img/181.png"},
            {"id":"62","ans":"Q","P":"img/062.png","Q":"img/182.png"},
            {"id":"63","ans":"Q","P":"img/063.png","Q":"img/183.png"},
            {"id":"64","ans":"Q","P":"img/064.png","Q":"img/184.png"},
            {"id":"65","ans":"Q","P":"img/065.png","Q":"img/185.png"},
            {"id":"66","ans":"Q","P":"img/066.png","Q":"img/186.png"},
            {"id":"67","ans":"Q","P":"img/067.png","Q":"img/187.png"},
            {"id":"68","ans":"Q","P":"img/068.png","Q":"img/188.png"},
            {"id":"69","ans":"Q","P":"img/069.png","Q":"img/189.png"},
            {"id":"70","ans":"Q","P":"img/070.png","Q":"img/190.png"},
            {"id":"71","ans":"Q","P":"img/071.png","Q":"img/191.png"},
            {"id":"72","ans":"Q","P":"img/072.png","Q":"img/192.png"},
            {"id":"73","ans":"Q","P":"img/073.png","Q":"img/193.png"},
            {"id":"74","ans":"Q","P":"img/074.png","Q":"img/194.png"},
            {"id":"75","ans":"Q","P":"img/075.png","Q":"img/195.png"},
            {"id":"76","ans":"Q","P":"img/076.png","Q":"img/196.png"},
            {"id":"77","ans":"Q","P":"img/077.png","Q":"img/197.png"},
            {"id":"78","ans":"Q","P":"img/078.png","Q":"img/198.png"},
            {"id":"79","ans":"Q","P":"img/079.png","Q":"img/199.png"},
            {"id":"80","ans":"Q","P":"img/080.png","Q":"img/200.png"},
            {"id":"81","ans":"Q","P":"img/081.png","Q":"img/201.png"},
            {"id":"82","ans":"Q","P":"img/082.png","Q":"img/202.png"},
            {"id":"83","ans":"Q","P":"img/083.png","Q":"img/203.png"},
            {"id":"84","ans":"Q","P":"img/084.png","Q":"img/204.png"},
            {"id":"85","ans":"Q","P":"img/085.png","Q":"img/205.png"},
            {"id":"86","ans":"Q","P":"img/086.png","Q":"img/206.png"},
            {"id":"87","ans":"Q","P":"img/087.png","Q":"img/207.png"},
            {"id":"88","ans":"Q","P":"img/088.png","Q":"img/208.png"},
            {"id":"89","ans":"Q","P":"img/089.png","Q":"img/209.png"},
            {"id":"90","ans":"Q","P":"img/090.png","Q":"img/210.png"},
            {"id":"91","ans":"Q","P":"img/091.png","Q":"img/211.png"},
            {"id":"92","ans":"Q","P":"img/092.png","Q":"img/212.png"},
            {"id":"93","ans":"Q","P":"img/093.png","Q":"img/213.png"},
            {"id":"94","ans":"Q","P":"img/094.png","Q":"img/214.png"},
            {"id":"95","ans":"Q","P":"img/095.png","Q":"img/215.png"},
            {"id":"96","ans":"Q","P":"img/096.png","Q":"img/216.png"},
            {"id":"97","ans":"Q","P":"img/097.png","Q":"img/217.png"},
            {"id":"98","ans":"Q","P":"img/098.png","Q":"img/218.png"},
            {"id":"99","ans":"Q","P":"img/099.png","Q":"img/219.png"},
            {"id":"100","ans":"Q","P":"img/100.png","Q":"img/220.png"},
            {"id":"101","ans":"Q","P":"img/101.png","Q":"img/221.png"},
            {"id":"102","ans":"Q","P":"img/102.png","Q":"img/222.png"},
            {"id":"103","ans":"Q","P":"img/103.png","Q":"img/223.png"},
            {"id":"104","ans":"Q","P":"img/104.png","Q":"img/224.png"},
            {"id":"105","ans":"Q","P":"img/105.png","Q":"img/225.png"},
            {"id":"106","ans":"Q","P":"img/106.png","Q":"img/226.png"},
            {"id":"107","ans":"Q","P":"img/107.png","Q":"img/227.png"},
            {"id":"108","ans":"Q","P":"img/108.png","Q":"img/228.png"},
            {"id":"109","ans":"Q","P":"img/109.png","Q":"img/229.png"},
            {"id":"110","ans":"Q","P":"img/110.png","Q":"img/230.png"},
            {"id":"111","ans":"Q","P":"img/111.png","Q":"img/231.png"},
            {"id":"112","ans":"Q","P":"img/112.png","Q":"img/232.png"},
            {"id":"113","ans":"Q","P":"img/113.png","Q":"img/233.png"},
            {"id":"114","ans":"Q","P":"img/114.png","Q":"img/234.png"},
            {"id":"115","ans":"Q","P":"img/115.png","Q":"img/235.png"},
            {"id":"116","ans":"Q","P":"img/116.png","Q":"img/236.png"},
            {"id":"117","ans":"Q","P":"img/117.png","Q":"img/237.png"},
            {"id":"118","ans":"Q","P":"img/118.png","Q":"img/238.png"},
            {"id":"119","ans":"Q","P":"img/119.png","Q":"img/239.png"},
            {"id":"120","ans":"Q","P":"img/120.png","Q":"img/240.png"}
        ];
        var data_index=0,QPkey=false,correct_number=0,great=0,data_number=0;
        var time,beginTime,endTime;
        var maxtime=10,timer=null,mouldTime;
        var time1=1500,timer1=null,type4Num="0";
        var type4set=[],stimidset=[],correctanswerset=[],buttonset=[],timeset=[],topicArr=[],commentset=[],ansText=[],buttonsetText=[];

        pushArr(data);
        function topicFun(data_index){
            init();
            $("#item2_A img").attr("src",data[data_index].Q);
            $("#item2_B img").attr("src",data[data_index].P);
        }
        function init(){
            $("#item2_A img").attr("src"," ");
            $("#item2_B img").attr("src"," ");
        }
        $("#img1").on("click",function () {
            mouldTime=$("#input1[type='checkbox']").is(':checked');
            data_number=data.length;
            topicFun(data_index);
            QPkey=true;
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

        function feedbackFun(obj,ans,ans1,time) {
            var feedback={
                "url1":"",
                "url2":"",
                "time":"",
                "ans":"",
                "ans1":""
            };
            feedback.time=time;
            feedback.url1=obj.Q;
            feedback.url2=obj.P;
            feedback.ans=obj[ans];
            feedback.ans1=obj[ans1];
            feedbackArr.push(feedback);
        }

        $(".item2_set").on("click",function () {
            var key=$(this).attr("data-data");
            if(QPkey){
                QPkey=false;
                keyFun(key)
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
                QPkey=true;
                beginTime=new Date().getTime();
                topicFun(data_index);

                clearInterval(timer1);
                timer1=null;
            }, time1);

        }

        function endFun() {
            QPkey=false;
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
                topicCon='<img src="'+arr[i].url1+'" alt=""><img src="'+arr[i].url2+'" alt="">';
                ansCon='<img src="'+arr[i].ans+'" alt="">';
                buttonsetCon='<img src="'+arr[i].ans1+'" alt="">';
                timesetCon=arr[i].time;
                $("#topic_result").append(
                    '<tr>' +
                    '<td>'+topicCon+'</td>' +
                    '<td>'+ansCon+'</td>' +
                    '<td>'+buttonsetCon+'</td>' +
                    '<td>'+timesetCon+'</td>' +
                    '</tr>'
                )
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
            $("#xs3").text(Math.round((correct_number/(data_index+1))*100)+"%");
            nextTopicFun()
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
        $(document).keydown(function (event) {
            var e = event || window.event;
            var k = e.keyCode || e.which;

            if(k==81){
                if(QPkey){
                    QPkey=false;
                    keyFun("Q")
                }
            }
            if(k == 80){
                if(QPkey){
                    QPkey=false;
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