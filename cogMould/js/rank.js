$(function () {
    var taskid;
    taskid=getUrlParam("taskid");
    $("#rank").remove();
    $("body").append(
        '<div class="pm" id="rank" style="position: fixed;top: 250px;right: 10px;width: 128px;padding: 8px;">\n' +
        '        <div >\n' +
        '            <div style="height: 42px;line-height: 42px;background: #2e6da4;color: #fff;text-align: center;font-size: 14px;font-weight: 900;">平均分排名</div>\n' +
        '            <div style="height: 32px;line-height: 32px;background: #fff;color: #000;font-size: 14px;text-align: center;font-weight: 900;" id="average_rank"></div>\n' +
        '        </div>\n' +
        '        <div >\n' +
        '            <div style="height: 42px;line-height: 42px;background: #2e6da4;color: #fff;text-align: center;font-size: 14px;font-weight: 900;">总分排名</div>\n' +
        '            <div style="height: 32px;line-height: 32px;background: #fff;color: #000;font-size: 14px;text-align: center;font-weight: 900;" id="total_score_rank"></div>\n' +
        '        </div>\n' +
        '    </div>'
    );


    $("#average_rank").text("1");
    $("#total_score_rank").text("2");
    // testonly_toget_rank(taskid);
    function testonly_toget_rank(taskid)
    {
        var argsdata={taskid:taskid};
        var	data={clazz:'com.lattice.action.proxy.common.NormRecordRankProxy',service:'getNormRecordRankForOneTask',args:JSON.stringify(argsdata)};
        var success=function(data){
            $("#average_rank").text(data.averageNormRecordRank);
            $("#total_score_rank").text(data.sumNormRecordRank);
        };
        invoke_proxy(data,success);

    }
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
});