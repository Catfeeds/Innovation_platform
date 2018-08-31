var editor;
KindEditor.ready(function(K) {
    editor = K.create('#mytextarea', {
        resizeType : 2,
        uploadJson : '/manage/fileUpload.do',
        allowFileManager : true,
        afterBlur:function(){this.sync();}
    });
});