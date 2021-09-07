<div class="translate-style">
繁/简：<a id="translateLink" href="javascript:translatePage();">繁体
</a>
</div>
<script type="text/javascript" src="/js/tw_cn.js"></script>
<script type="text/javascript">
var defaultEncoding = 2; //网站编写字体是否繁体，1-繁体，2-简体
var translateDelay = 1; //延迟时间,若不在前, 要设定延迟翻译时间, 如100表示100ms,默认为0
var cookieDomain = "https://runlin.tech/"; //Cookie地址, 一定要设定, 通常为你的网址
var msgToTraditionalChinese = "繁体"; //此处可以更改为你想要显示的文字
var msgToSimplifiedChinese = "简体"; //同上，但两处均不建议更改
var translateButtonId = "translateLink"; //默认互换id
translateInitilization();
</script>

{# 搞怪网页标题 #}
{% if theme.title_trick.enable %}
  <script>
    var OriginTitle = document.title;
    var titleTime;
    document.addEventListener('visibilitychange', function() {
      if (document.hidden) {
        document.title = '{{ theme.title_trick.leave }}' + OriginTitle;
        clearTimeout(titleTime);
      } else {
        document.title = '{{ theme.title_trick.enter }}' + OriginTitle;
        titleTime = setTimeout(function() {
          document.title = OriginTitle;
        }, 2000);
      }
    });
  </script>
{% endif %}
