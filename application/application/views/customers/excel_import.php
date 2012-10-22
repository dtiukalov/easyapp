<?php
echo form_open_multipart('customers/do_excel_import/',array('id'=>'item_form'));
?>
<div id="required_fields_message">从Excel工作表导入客户</div>
<ul id="error_message_box"></ul>
<b><a href="<?php echo site_url('customers/excel'); ?>">下载导入Excel模板(CSV)</a></b>
<fieldset id="item_basic_info">
<legend>导入</legend>

<div class="field_row clearfix">	
<?php echo form_label('文件:', 'name',array('class'=>'wide')); ?>
	<div class='form_field'>
	<?php echo form_upload(array(
		'name'=>'file_path',
		'id'=>'file_path',
		'value'=>'')
	);?>
	</div>
</div>

<?php
echo form_submit(array(
	'name'=>'submitf',
	'id'=>'submitf',
	'value'=>$this->lang->line('common_submit'),
	'class'=>'submit_button float_right')
);
?>
</fieldset>
<?php 
echo form_close();
?>
<script type='text/javascript'>

//validation and submit handling
$(document).ready(function()
{	
	$('#item_form').validate({
		submitHandler:function(form)
		{
			$(form).ajaxSubmit({
			success:function(response)
			{
				tb_remove();
				post_person_form_submit(response);
			},
			dataType:'json'
		});

		},
		errorLabelContainer: "#error_message_box",
 		wrapper: "li",
		rules: 
		{
			file_path:"required"
   		},
		messages: 
		{
   			file_path:"Full path to excel file required"
		}
	});
});
</script>