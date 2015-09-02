function confirm(){
			$.messager.confirm('My Title', '确定要删除吗?', function(r){
				if (r){
					alert('已删除');
					
				}
			});
		}
function init(){
        close1();
		close2();
		close3();
}
function open1(){
			$('#w1').window('open');
		}
		function close1(){
			$('#w1').window('close');
		}
		function open2(){
			$('#w2').window('open');
		}
		function close2(){
			$('#w2').window('close');
		}
		function open3(){
			$('#w3').window('open');
		}
		function close3(){
			$('#w3').window('close');
		}