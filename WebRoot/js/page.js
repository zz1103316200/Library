/**
 *
 *  ʹ�÷�����
 *   1. �����JS
 *   2. ��ҳ���Ͻ���һ��DIV��IDһ��ҪΪhhtPage1Div�����磺<div id="hhtPage1Div"></div>
 *   3. �ڴ�DIV�����������JS��䣨һ��Ҫд�������DIV��֮�󣩣�
 *      var hhtPage1 = new HHTPage1(count,currentPage,totalPage);
 *      var URL = "manager/withLoginServlet?func=productList&currentPageStr=";
 *      URL = encodeURI(encodeURI(URL));
 *      var basePath = "<%=basePath%>";
 *      hhtPage1.init();
 *      �����˶����3������Ҫ������ҳ���ϳ�ʼ����һ���session���ȡ������ʱ�����Լ����д���֣�������Ϊ���ܼ�¼������ǰҳ����ҳ��
 *   4. ��������õ�ǰҳÿ����7�������������ã�Ĭ��Ϊ5������
 *      hhtPage1.leave=7;
 *      hhtPage1.indexHeight = "20";   //ҳ�뷽���
 *      hhtPage1.indexWidth = "25";    //ҳ�뷽���
 *      hhtPage1.fontSize = "13";    //�����С
 *      �����Ը�
 *   
**/

var color1 = "#a10000"; //���
var color2 = "#000000"; //��
var color3 = "#aabbcc"; //����

function HHTPage1(countP,currentPageP,totalPageP)
{
  //this.count = countP;
  //this.currentPage = currentPageP;
  //this.totalPage = totalPageP;
  
  this.leave = 5;       //ÿ��������
  this.indexHeight = "20";   //ҳ�뷽���
  this.indexWidth = "25";   //ҳ�뷽���
  this.fontSize = "13";    //�����С
  
  this.init=function(){
    //��ʼ����ҳ��Ҫ������
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
   
   hhtPage1DivStr=hhtPage1DivStr+'��<label style="color:'+color1+';">'+count+'</label>��&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'��<label style="color:'+color1+';">'+currentPage+'/'+totalPage+'</label>ҳ&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+1+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">��ҳ</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+(currentPage-1)+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">��һҳ</a>&nbsp;';
   for(var i=startIndex;i<=endIndex;i++)
   {
    if(i==currentPage)hhtPage1DivStr=hhtPage1DivStr+'<label style="width:'+this.indexWidth+'px;padding:1px 4px 1px 4px; line-height:'+this.indexHeight+'px;color:'+color1+';font-weight:bold;">'+i+'</label>&nbsp;';
    else hhtPage1DivStr=hhtPage1DivStr+'<label style="border:1px solid '+color3+';width:'+this.indexWidth+'px;padding:1px 4px 1px 4px; line-height:'+this.indexHeight+'px;"><a href="'+URL+i+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">'+i+'</a></label>&nbsp;';
   }
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+(currentPage+1)+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">��һҳ</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="'+URL+totalPage+'" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">βҳ</a>&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'��<input id="hhtPage1IndexGoto" maxlength="4" style="border:1 solid '+color3+';height:18px;line-height:14px;width:30px;text-align:center;color:'+color1+';" onkeypress="javascript:key=event.keyCode;if(key>0x39||key<0x30)return false;"/>ҳ&nbsp;';
   hhtPage1DivStr=hhtPage1DivStr+'<a href="javascript:gotoPageIndex();" style="color:'+color2+';text-decoration:none;" onmouseover="a_over(this)" onmouseout="a_out(this)">GO</a>';
   
   document.all.hhtPage1Div.innerHTML = hhtPage1DivStr;
   document.all.hhtPage1IndexGoto.value=currentPage;
  }
}

 
function a_over(obj){obj.style.color=color1;obj.style.textDecoration="underline";}
function a_out(obj){obj.style.color=color2;obj.style.textDecoration="none";}
function gotoPageIndex(){location.href=basePath+URL+document.all.hhtPage1IndexGoto.value;}

