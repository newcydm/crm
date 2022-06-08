<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/echars/echarts.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript">
        $(function () {
            var charts=echarts.init(document.getElementById("main"));
            $.ajax({
                url:"activityData",
                success:function (result) {
                    var names=result.data.map(s=>s.name);
                    var option= {
                        title: {
                            text: '市场活动统计图'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c}%'
                        },
                        toolbox: {
                            feature: {
                                dataView: { readOnly: false },
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        legend: {
                            data: names
                        },
                        series: [
                            {
                                name: 'Funnel',
                                type: 'funnel',
                                left: '10%',
                                top: 60,
                                bottom: 60,
                                width: '80%',
                                min: 0,
                                max: 100,
                                minSize: '0%',
                                maxSize: '100%',
                                sort: 'descending',
                                gap: 2,
                                label: {
                                    show: true,
                                    position: 'inside'
                                },
                                labelLine: {
                                    length: 10,
                                    lineStyle: {
                                        width: 1,
                                        type: 'solid'
                                    }
                                },
                                itemStyle: {
                                    borderColor: '#fff',
                                    borderWidth: 1
                                },
                                emphasis: {
                                    label: {
                                        fontSize: 20
                                    }
                                },
                                data: result.data
                            }
                        ]
                    };
                    charts.setOption(option);
                }
            });



        });
    </script>
</head>
<body>
<div id="main" style="width: 80%;height: 600px">

</div>
</body>
</html>