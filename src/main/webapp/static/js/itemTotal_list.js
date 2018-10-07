
layui.use(['table','laydate','upload'], function(){
    var table = layui.table,
        upload = layui.upload,
        laydate = layui.laydate;

    laydate.render({
        elem: '#chooseTime'
        ,range: '~'
    });

    table.render({
        id:'search_tb',
        elem: '#List',
        url: '${cpath}/manage/excellent_list.do',
        method: 'post',
        limit: 10,
        toolbar:true,
        defaultToolbar: ['filter', 'print','exports'],
        cols: [[
            { title: '序号',align:'center',width:100,type:'numbers'},
            {field:'enrollId', title: 'EnrollID',align:'center',hide:'true'},
            {field:'year', title: '年月',align:'center',sort:true,width:100},
            {field:'competeName', title: '赛事名称',align:'center',sort:true},
            {field:'title', title: '参赛题目',align:'center'},
            {field:'members', title: '团队成员',align:'center'},
            {field:'instructor', title: '指导老师',align:'center',sort:true},
            {field:'professionName', title: '专业',align:'center',sort:true},
            {field:'prizeName', title: '获奖情况',align:'center',sort:true},
//                {title: '操作',width:100,align:'center',toolbar: '#bar',fixed:'right'},
        ]],
        page: true,
        done: function (res, curr, count) {

        }
    });

    upload.render({
        elem: '#data-import'
        , accept: 'file'
        ,url: '${cpath}/manage/data_import.do'
        ,done: function(res){
            layer.msg(res.msg, {
                time: 20000, //20s后自动关闭
                btn: [ '知道了']
            });
        }
    });

    $(".search_btn").click(function() {
        table.reload('search_tb', {
            url: '${cpath}/manage/excellent_search.do'
            , where: {key: $(".search_input").val()}
        });
    });

    // table.on('tool(ListID)', function(obj){
    //     var data = obj.data;
    //     if(obj.event === 'detail'){
    //         $(window).one("resize",function(){
    //             var index = layui.layer.open({
    //                 title : "详情",
    //                 type : 2,
    //                 content : "${cpath}/manage/to_enroll_detail2/"+data.enrollId+".do",
    //                 success : function(layero, index){
    //                     setTimeout(function(){
    //                         layui.layer.tips('点击此处返回', '.layui-layer-setwin .layui-layer-close', {
    //                             tips: 3
    //                         });
    //                     },300)
    //                 }
    //             });
    //             layui.layer.full(index);
    //         }).resize();
    //     }
    // });

    // 基于准备好的dom，初始化echarts实例
    var barPc = echarts.init(document.getElementById('chartPCountBar'));
    var barIc = echarts.init(document.getElementById('chartICountBar'));

    var piePc = echarts.init(document.getElementById('chartPCountPie'));
    var pieIc = echarts.init(document.getElementById('chartICountPie'));

    $(".show-chart").click(function () {
        pieIc.clear();
        piePc.clear();
        barPc.off('click');
        barIc.off('click');

        table.reload('search_tb', {
            url: '${cpath}/manage/excellent_selective.do'
            , where: {
                chooseTime:$('#chooseTime').val(),
                profession:$('#pId').val()
            }
        });

        $.ajax({
            type:'post',
            url:'${cpath}/manage/get_pc_by_level.do',
            data:{
                chooseTime:$('#chooseTime').val(),
                profession:$('#pId').val()
            },
            dataType: "json",
            success:function (res) {
                var optionBar = {
                    color: ['#3398DB'],
                    title: {
                        text: '统计获奖人数'
                    },
                    tooltip: {},
                    legend: {
                        data:['人数']
                    },
                    xAxis: {
                        data: res.categories
                    },
                    yAxis: {},
                    series: [{
                        name: '人数',
                        type: 'bar',
                        data: res.data
                    }]
                };
                barPc.setOption(optionBar);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });

        barPc.on('click', function (params) {
            $.ajax({
                type:'post',
                url:'${cpath}/manage/get_pc_by_level2.do',
                data:{
                    levelId:params.data.id,
                    chooseTime:$('#chooseTime').val(),
                    profession:$('#pId').val()
                },
                dataType: "json",
                data:{
                    levelId:params.data.id,
                    chooseTime:$('#chooseTime').val(),
                    profession:$('#pId').val()
                },
                success:function (res) {
                    var optionPie = {
                        title : {
                            text: params.data.name+'获奖人数',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: res.categories
                        },
                        series : [
                            {
                                name: '人数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:res.data,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    piePc.setOption(optionPie);
                }
            });
        });

        $.ajax({
            type:'post',
            url:'${cpath}/manage/get_ic_by_level.do',
            data:{
                chooseTime:$('#chooseTime').val(),
                profession:$('#pId').val()
            },
            dataType: "json",
            success:function (res) {
                var optionBar = {
                    color: ['#3398DB'],
                    title: {
                        text: '统计获奖项目数'
                    },
                    tooltip: {},
                    legend: {
                        data:['项目数']
                    },
                    xAxis: {
                        data: res.categories
                    },
                    yAxis: {},
                    series: [{
                        name: '项目数',
                        type: 'bar',
                        data: res.data
                    }]
                };
                barIc.setOption(optionBar);
            },
            error:function () {
                layer.msg('接口错误');
            }
        });

        barIc.on('click', function (params) {
            $.ajax({
                type:'post',
                url:'${cpath}/manage/get_ic_by_level2.do',
                data:{
                    levelId:params.data.id,
                    chooseTime:$('#chooseTime').val(),
                    profession:$('#pId').val()
                },
                dataType: "json",
                success:function (res) {
                    var optionPie = {
                        title : {
                            text: params.data.name+'获奖项目数',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: res.categories
                        },
                        series : [
                            {
                                name: '项目数',
                                type: 'pie',
                                radius : '55%',
                                center: ['50%', '60%'],
                                data:res.data,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    pieIc.setOption(optionPie);
                }
            });
        });
    });
});