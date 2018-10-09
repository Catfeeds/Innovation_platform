layui.use(['form','upload'],function() {
    var form = layui.form,
        upload = layui.upload,
        $ = layui.jquery;

    upload.render({
        elem: '#attachment'
        ,url: '${cpath}/manage/fileUpload.do?dir=file'
        ,accept: 'file'
        ,done: function(res){
            if(res.error === 0){
                $('#attachmentVal').val(res.url);
                uploadTip('文件已上传');
                layer.msg('上传成功');
            }else{
                uploadTip('传失败(请打包成压缩文件上传!)');
                layer.msg('上传失败(请打包成压缩文件上传!)');
            }
        },error:function () {
            layer.msg('上传文件接口错误');
        }
    });

    function uploadTip(msg) {
        $('#upload-msg').html('');
        $('#upload-msg').append(msg);
    }

    form.on("submit(add)", function (data) {
        $.ajax({
            type: 'post',
            url: '${cpath}/stu/enroll.do',
            data: $('#form_enroll').serialize(),
            success: function (data) {
                layer.msg(data.msg);
            },
            error: function () {
                layer.msg('接口错误');
            }
        });

        setTimeout(function () {
            layer.closeAll("iframe");
            parent.location.reload();
        }, 1000);
        return false;
    })
});

function getInfo(obj) {
    if(obj.val() === ''){
        obj.parents("tr").find("td:eq(1)").find("input").val("");
        obj.parents("tr").find("td:eq(2)").find("input").val("");
    }else{
        $.ajax({
            url:'${cpath}/stu/get_info2.do',
            type:'post',
            dataType:'json',
            data:{
                sno:obj.val(),
                cId:$("#cId").val()
            },
            success : function(res) {
                if(res.status === 0){
                    obj.parents("tr").find("td:eq(1)").find("input").val(res.data.nameStudent);
                    obj.parents("tr").find("td:eq(2)").find("input").val(res.data.classno);
                }
                else{
                    layer.msg(res.msg);
                    obj.parents("tr").find("td:eq(1)").find("input").val("");
                    obj.parents("tr").find("td:eq(2)").find("input").val("");
                }
            }
        });
    }
}