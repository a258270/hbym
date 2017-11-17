var loader;
$(function () {
    var sters = $(".ster");
    sters.each(function () {
        $(this).click(function () {
            var strHref = $(this).attr("data-href");
            $("#information").attr("src", strHref);
            loader = layer.load(0);
            $(".ster").removeClass("kd-lhtai");
            $(this).addClass("kd-lhtai");
        });
    });
});

function iFrameHeight() {
    var ifm= document.getElementById("information");
    var subWeb = document.frames ? document.frames["information"].document :
        ifm.contentDocument;
    if(ifm != null && subWeb != null) {
        ifm.height = subWeb.body.scrollHeight;
    }
}