function initPasteDragImg(Editor){
    var doc = document.getElementById(Editor.id)
    doc.addEventListener('paste', function (event) {
        var items = (event.clipboardData || window.clipboardData).items;
        var file = null;
        //console.log(items);
        if (items && items.length) {
            // 搜索剪切板items
            for (var i = 0; i < items.length; i++) {
                if (items[i].type.indexOf('image') !== -1) {
                    file = items[i].getAsFile();
                    break;
                }
            }
        } else {
            console.log("当前浏览器不支持");
            return;
        }
        if (!file) {
            console.log("粘贴内容非图片");
            return ;
        }
        uploadImg(file,Editor);
    });

    var dashboard = document.getElementById(Editor.id)
    dashboard.addEventListener("dragover", function (e) {
        e.preventDefault()
        e.stopPropagation()
    })
    dashboard.addEventListener("dragenter", function (e) {
        e.preventDefault()
        e.stopPropagation()
    })
    dashboard.addEventListener("drop", function (e) {
        e.preventDefault()
        e.stopPropagation()
        var files = this.files || e.dataTransfer.files;
        uploadImg(files[0],Editor);
    })
}
function uploadImg(file,Editor){
    var formData = new FormData();
    var fileName=new Date().getTime()+"."+file.name.split(".").pop();
    formData.append('editormd-image-file', file, fileName);

    $.ajax({
        url: Editor.settings.imageUploadURL,
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
       success: function (msg) {
            var success=msg['success'];
            if(success==1){
                var url=msg["url"];
                if(/\.(png|jpg|jpeg|gif|bmp|ico)$/.test(url)){
                    //上传图片处理
                    Editor.insertValue("![图片alt]("+msg["url"]+" ''图片title'')");
                }
                else if(/\.(mp4|wmv|avi)$/.test(url)){
                    //上传视频处理
                    var videoHtml ='<sub>\r\n   <video width="350px"  controls > \r\    <source src="' + url + '"> \r\n     </video>\r\n    </sub>';
                    Editor.insertValue(videoHtml);
                }
                else
                {
                    //其他附件以附件方式显示
                    Editor.insertValue("[下载附件]("+msg["url"]+")");
                }
            }else{
                console.log(msg);
                alert(msg['message']);
            }
        }
        , xhr: function () { //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { //检查upload属性是否存在
                //绑定progress事件的回调函数
                myXhr.upload.addEventListener('progress', function(e){
                    if (e.lengthComputable) {
                        $('progress').attr({value: e.loaded, max: e.total}); //更新数据到进度条
                        var percent = e.loaded / e.total * 100;
                        //$('#progress').html(e.loaded + "/" + e.total + " bytes. " + percent.toFixed(2) + "%");
                        console.log(percent);
                        $(".layui-progress-bar").css("width",percent+'%')
                        console.log($(".layui-progress-bar"));
                        if(percent==100){
                            $(".layui-progress-bar").css("width",'0'+'%')
                        }
                    }
                }, false);
            }
            return myXhr; //xhr对象返回给jQuery使用
        },
    });


}