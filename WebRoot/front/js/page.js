/**
 *
 *  使用方法：
 *   1. 引入此JS
 *   2. 在页面上建立一个DIV，ID一定要为hhtPage1Div，例如：<div id="hhtPage1Div"></div>
 *   3. 在此DIV后面加入下列JS语句（一定要写在上面的DIV块之后）：
 *      var hhtPage1 = new HHTPage1(count,currentPage,totalPage);
 *      var URL = "manager/withLoginServlet?func=productList&currentPageStr=";
 *      URL = encodeURI(encodeURI(URL));
 *      var basePath = "<%=basePath%>";
 *      hhtPage1.init();
 *      创建此对象的3个参数要事先在页面上初始化，一般从session里获取（测试时可以自己随便写数字）。依次为：总记录数、当前页、总页数
 *   4. 如果想设置当前页每边留7个可以如下设置（默认为5个）：
 *      hhtPage1.leave=7;
 *      hhtPage1.indexHeight = "20";   //页码方框高
 *      hhtPage1.indexWidth = "25";    //页码方框宽
 *      hhtPage1.fontSize = "13";    //字体大小
 *      都可以改
 *   
**/

var color1 = "#a10000"; //深红
var color2 = "#000000"; //黑
var color3 = "#aabbcc"; //青蓝

function HHTPage1(countP,currentPageP,totalPageP)
{
  //this.count = countP;
  //this.currentPage = currentPageP;
  //this.totalPage = totalPageP;
  
  this.leave = 5;       //每边留几个
  this.indexHeight = "20";   //页码方框高
  this.indexWidth = "25";   //页码方框宽
  this.fontSize = "13";    //字体大小
  
  this.init=function(){
    //初始化分页需要的数据
   var count = countP;
   var currentPage = currentPageP;
   var totalPage = totalPageP;
   var leave = this.leave;   
   
   
   
   var hhtPage1DivStr = "";
  
   document.all.hhtPage1Div.style.height="40px";
   document.all.hhtPage1Div.style.textAlign="center";
   document.all.hhtPage1Div.style.lineHeight="40px";
   document.all.hhtPage1Div.style.fontSize=this.fontSize+'px';
   document.all.hhtPage1Div.style.borderTop="1px solid "+color3;
   document.all.hhtPage1Div.style.paddingTop="10px";
   
   var startIndex = 1;
   if(currentPage>(leave-(-1)))startIndex=currentPage-leave;
   var endIndex=startIndex-(-2*leave);
   if(endIndex>totalPage)endIndex=totalPage;
   if(endIndex-startIndex<2*leave)startIndex=endIndex-2*leave;
   if(startIndex<1)startIndex=1;
   
   hhtPage1DivStr=hhtPage1DivStr+'共<label style="color:'+color1+';">'+count+'</label>条&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'第<label style="color:'+color1+';">'+currentPage+'/'+totalPage+'</label>页&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+1+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">首页</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+(currentPage-1)+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">上一页</a>&nbsp;';
   for(var i=startIndex;i<=endIndex;i++)
   {
    if(i==currentPage)hhtPage1DivStr=hhtPage1DivStr+'<label style="width:'+this.indexWidth+'px;padding:1px 4px 1px 4px; line-height:'+this.indexHeight+'px;color:'+color1+';font-weight:bold;">'+i+'</label>&nbsp;';
    else hhtPage1DivStr=hhtPage1DivStr+'<label style="border:1px solid '+color3+';width:'+this.indexWidth+'px;padding:1px 4px 1px 4px; line-height:'+this.indexHeight+'px;"><a href="'+URL+i+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">'+i+'</a></label>&nbsp;';
   }
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+(currentPage+1)+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">下一页</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+totalPage+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">尾页</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'第<input id="hhtPage1IndexGoto" maxlength="4" style="border:1 solid '+color3+';height:18px;line-height:14px;width:30px;text-align:center;color:'+color1+';" onkeypress="javascript:key=event.keyCode;if(key>0x39||key<0x30)return false;"/>页&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="javascript:gotoPageIndex();" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">GO</a>';
   
   document.all.hhtPage1Div.innerHTML = hhtPage1DivStr;
   document.all.hhtPage1IndexGoto.value=currentPage;
  }
}

 
function a_over(obj){obj.style.color=color1;obj.style.textDecoration="underline";}
function a_out(obj){obj.style.color=color2;obj.style.textDecoration="none";}
function gotoPageIndex(){location.href=basePath+URL+document.all.hhtPage1IndexGoto.value;}

