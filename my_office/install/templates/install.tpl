<?php include 'header.tpl'?>
        <script type="text/javascript">
        $(function(){
            $('#post_form').attr('target', 'post_target');
            $('#post_form').submit();
        });
        function show_process(html){
            $('#detail').html($('#detail').html() + html);
            var _t = $('#detail').get(0);
            _t.scrollTop = _t.scrollHeight;
        }
        function install_successed(){

            show_message('<?php echo $lang[install_successed]?>');
            $('#go_myoffice').show();
            $('#go_admin').show();
        }
        function goon_install(action, seccode)
        {
            $('#__seccode__').val(seccode);
            $('#gooninstall').attr('action', action);
            setTimeout(function(){
               $('#gooninstall').submit();
            }, 1000);
        }
        function show_message(text){
            $('#message').html('<div class="message">' + text + '</div>').show();
        }
        function show_warning(text){
            $('#message').html('<div class="warning">' + text + '</div>').show();
            $('#go_back').show();
        }
        </script>
        <style type="text/css">
        #detail { border-bottom:none; padding:0px 10px; }
        #detail p { margin:3px; }
        #detail p span { float:right; font-style:italic; }
        #detail p span.successed { color:green; }
        #detail p span.failed { font-weight:bold; color:red; }
        #message { display:none; border-top:1px solid #B0D3EE; }
        .message {  }
        .warning { font-weight:bold; color:red; }
        </style>
        <div class="agreement2">
            <div class="text2" id="detail">
            </div>
            <div class="accede2" id="message"></div>
        </div>
        <div class="btn">
            <input type="button" class="button" value="<?php echo $lang[prev]?>" onclick="window.history.go(-1);" id="go_back" style="display:none;" />
            <input type="button" class="button mr10" value="<?php echo $lang[go_myoffice]?>" onclick="window.location.href='<?php echo $_POST[site_url] ?>/index.php';" id="go_myoffice" style="display:none;" />
            <!--<input type="button" class="button" value="<?php echo $lang[go_admin]?>" onclick="window.location.href='<?php echo $_POST[site_url] ?>/admin/index.php';" id="go_admin" style="display:none;" />-->
        </div>
        <iframe src="about:blank" style="width:500px; height:300px;display:none;" name="post_target"></iframe>
<?php include 'footer.tpl'?>