//貧卞
　	function moveUp(obj)
　　{　
　　　　　　for(var i=1; i < obj.length; i++)
　　　　　　{//恷貧中議匯倖音俶勣卞強��侭參岷俊貫i=1蝕兵
　　　　　　　　if(obj.options[i].selected)
　　　　　　　　{
　　　　　　　　　　if(!obj.options.item(i-1).selected)
　　　　　　　　　　{
　　　　　　　　　　　　var selText = obj.options[i].text;
　　　　　　　　　　　　var selValue = obj.options[i].value;
						obj.options[i].text = obj.options[i-1].text;
						obj.options[i].value = obj.options[i-1].value;
						obj.options[i].selected = false;
						obj.options[i-1].text = selText;
						obj.options[i-1].value = selValue;
						obj.options[i-1].selected=true;
　　　　　　　　　　}
　　　　　　　　}
　　　　　　}
　　　　}
		//和卞
		function moveDown(obj)
　　　　{
　　　　　　for(var i = obj.length -2 ; i >= 0; i--)
　　　　　　{//�鯱岱洞���恷朔匯倖音俶勣侃尖��侭參岷俊貫宜方及屈倖蝕兵
　　　　　　　　if(obj.options[i].selected)
　　　　　　　　{
　　　　　　　　　　if(!obj.options[i+1].selected)
　　　　　　　　　　{
　　　　　　　　　　　　var selText = obj.options[i].text;
　　　　　　　　　　　　var selValue = obj.options[i].value;
		    obj.options[i].text = obj.options[i+1].text;
		    obj.options[i].value = obj.options[i+1].value;
		   obj.options[i].selected = false;
		  obj.options[i+1].text = selText;
		  obj.options[i+1].value = selValue;
		 obj.options[i+1].selected=true;
　　　　　　　　　　}
　　　　　　　　}
　　　　　　}
　　　　}
		//卞強
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
		//崔競
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
	  //崔久
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