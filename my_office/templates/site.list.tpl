<?php include('header.tpl')?>
<?php include('welcome.wap.head.tpl')?>
<div class="division">
<a href="?go=site&do=browse" class="sysiconBtn list">网址列表</a>&nbsp;
<a href="?go=site&do=append" class="sysiconBtn addorder addproduct">添加网址</a><br>

<form>
<input type="hidden" name="go" value="site">
<input type="hidden" name="do" value="browse">
关键词：<input type="text" name="keyword" value="<?php echo $get['keyword']?>">&nbsp;
分类：<select name="typeid" id="typeid">
            <option value="0">-----顶级分类-----</option>
            <?php
            	channel::get_channel_select(0,0,$post['typeid']);
			?>
          </select>
排序：<select name="order">
	<option value=""></option>
	<option value="site_id" <?php if($get['order'] === 'site_id') echo 'selected'; ?>>ID↑</option>
	<option value="site_id2" <?php if($get['order'] === 'site_id2') echo 'selected'; ?>>ID↓</option>
</select>
<input id="BtnOK" class="sysiconBtnNoIcon" type="submit" value="查 询" name="BtnOK" />
</form>
<?php $ids = 'site_id[]';?>
<script language="javascript">
var ids = '<?=$ids?>';
</script>
<?php include('page.tpl')?>
<form method="post" action="?go=site&do=group_remove&query=<?php echo urlencode($query) ?>">
<table border="0" cellpadding="5" class="gridlist">
<thead>
	<tr><th>&nbsp;</th><th>ID</th>
	  <th>网站名</th>
	  <th>分类</th>
	  <th>URL</th><th>&nbsp;</th><th>操作</th></tr>
</thead>
<tbody>
<?php if($sites):?>
<?php foreach($sites as $site): ?>
	<tr>
	<td><?php if($site->site_id<0): ?>&nbsp;<? else: ?><input type="checkbox" name="<?=$ids?>" value="<?php echo $site->site_id; ?>"><?php endif; ?></td>
	<td>&nbsp;<?php echo $site->site_id; ?></td>
	<td>&nbsp;<?php echo $site->title; ?></td>
	<td>&nbsp;<?php echo $site->get_typeid(); ?></td>
	<td>&nbsp;<a href="<?=$site->url?>" target="_blank"><?php echo $site->url; ?></a></td>
	<td>&nbsp;</td>
	<td>&nbsp;<a href="?go=site&do=detail&site_id=<?php echo $site->site_id; ?>&query=<?php echo urlencode($query) ?>">详细</a> | 
	&nbsp;<?php if($site->site_id<0): ?>修改<? else: ?><a href="?go=site&do=modify&site_id=<?php echo $site->site_id; ?>&query=<?php echo urlencode($query) ?>">修改</a><?php endif; ?> | 
	<!--&nbsp;<?php if($site->site_id<0): ?>删除<? else: ?><a href="javascript:if(confirm('您确定要删除该网址吗？'))location='?go=site&do=remove&site_id=<?php echo $site->site_id; ?>&query=<?php echo urlencode($query) ?>';void(0);">删除</a><?php endif; ?>-->
    &nbsp;<?php if($site->site_id<0): ?>删除<? else: ?><a href="?go=site&do=remove&site_id=<?php echo $site->site_id; ?>&query=<?php echo urlencode($query) ?>" onclick="return  confirm('您确定要删除该日志吗？')">删除</a><?php endif; ?></td>
	</tr>

<?php endforeach ?>
<?php else: ?> 
	<tr>
	<td colspan="7">无</td>
	</tr><?php endif ?> 
</tbody>
<tfoot>
	<tr><td colspan="7"><b class="submitBtn">
	  <button onclick="select_all(this)" type="button"><span class="iconbutton">全选</span></button>
	</b> <b class="submitBtn">
	<button onclick="reverse_all(this);" type="button"><span class="iconbutton">反选</span></button>
	</b> <b class="submitBtn">
	<button onclick="return remove_selected(this);" type="button"><span class="iconbutton deletebutton">删除</span></button>
	</b></td></tr>
</tfoot>
</table>
</form>
<?php include('page.tpl')?>
</div>
</body>
</html>