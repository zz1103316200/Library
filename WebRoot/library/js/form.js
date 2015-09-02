//ÉÏÒÆ
¡¡	function moveUp(obj)
¡¡¡¡{¡¡
¡¡¡¡¡¡¡¡¡¡¡¡for(var i=1; i < obj.length; i++)
¡¡¡¡¡¡¡¡¡¡¡¡{//×îÉÏÃæµÄÒ»¸ö²»ÐèÒªÒÆ¶¯£¬ËùÒÔÖ±½Ó´Ói=1¿ªÊ¼
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡if(obj.options[i].selected)
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡{
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡if(!obj.options.item(i-1).selected)
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡{
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡var selText = obj.options[i].text;
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡var selValue = obj.options[i].value;
						obj.options[i].text = obj.options[i-1].text;
						obj.options[i].value = obj.options[i-1].value;
						obj.options[i].selected = false;
						obj.options[i-1].text = selText;
						obj.options[i-1].value = selValue;
						obj.options[i-1].selected=true;
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡}
		//ÏÂÒÆ
		function moveDown(obj)
¡¡¡¡¡¡¡¡{
¡¡¡¡¡¡¡¡¡¡¡¡for(var i = obj.length -2 ; i >= 0; i--)
¡¡¡¡¡¡¡¡¡¡¡¡{//ÏòÏÂÒÆ¶¯£¬×îºóÒ»¸ö²»ÐèÒª´¦Àí£¬ËùÒÔÖ±½Ó´Óµ¹ÊýµÚ¶þ¸ö¿ªÊ¼
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡if(obj.options[i].selected)
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡{
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡if(!obj.options[i+1].selected)
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡{
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡var selText = obj.options[i].text;
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡var selValue = obj.options[i].value;
		    obj.options[i].text = obj.options[i+1].text;
		    obj.options[i].value = obj.options[i+1].value;
		   obj.options[i].selected = false;
		  obj.options[i+1].text = selText;
		  obj.options[i+1].value = selValue;
		 obj.options[i+1].selected=true;
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡¡¡¡¡}
¡¡¡¡¡¡¡¡}
		//ÒÆ¶¯
		function moveOption(obj1, obj2)
		{
			 for(var i = obj1.options.length - 1 ; i >= 0 ; i--)
			 {
				 if(obj1.options[i].selected)
				 {
					var opt = new Option(obj1.options[i].text,obj1.options[i].value);
					opt.selected = true;
					obj2.options.add(opt);
					obj1.remove(i);
				}
			 }
		}
		//ÖÃ¶¥
	  function  moveTop(obj) 
	  { 
			var  opts = []; 
			for(var i =obj.options.length -1 ; i >= 0; i--)
			{
				if(obj.options[i].selected)
				{
					opts.push(obj.options[i]);
					obj.remove(i);
				}
			}
			var index = 0 ;
			for(var t = opts.length-1 ; t>=0 ; t--)
			{
				var opt = new Option(opts[t].text,opts[t].value);
				opt.selected = true;
				obj.options.add(opt, index++);
			}
		} 
	  //ÖÃµ×
	  function  moveBottom(obj) 
	  { 
			var  opts = []; 
			for(var i =obj.options.length -1 ; i >= 0; i--)
			{
				if(obj.options[i].selected)
				{
					opts.push(obj.options[i]);
					obj.remove(i);
				}
			}
			 for(var t = opts.length-1 ; t>=0 ; t--)
			{
				var opt = new Option(opts[t].text,opts[t].value);
				opt.selected = true;
				obj.options.add(opt);
			}
		} 
	//-->