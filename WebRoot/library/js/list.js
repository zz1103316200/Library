function confirm(){
			$.messager.confirm('My Title', 'ȷ��Ҫɾ����?', function(r){
				if (r){
					alert('��ɾ��');
					
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