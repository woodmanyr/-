function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function checkIsChinese(str)
{
    //如果值为空，通过校验
    if (str == "")
        return 2;

    var pattern = /^([\u4E00-\u9FA5]|[\uFE30-\uFFA0])*$/gi;
    if (pattern.test(str))
        return 2;
    else
        return 1;
}

function cutstr(str,l)
{
//l为长度，按半角算，就是一个汉字长度为2 需要function：checkIsChinese()
	var ls="";
	var lens=0;
    var c="";

  	for (var i = 0; i < (str.length); i++) 
	{
		c = str.substring(i, 1+i);
        lens = lens + checkIsChinese(c);
        ls=ls+c;

		if (lens==l-1)
		{
			ls =ls+ "...";
			return ls;
		}
		else if(lens == l - 2)
		{
			ls =ls+ "..";
			return ls;
		}
		else if(lens == l - 1)
		{
			ls =ls+ ".";
			return ls;
		}
		else if(lens == l)
		{
			return ls;
		}
  	
	}
	return ls;
}

function chgbgcolor(c,w)
{

	if (w=='on')
	{
		c.style.cssText="background-color:#FFB997";
	}
	if (w=='out')
	{
		c.style.cssText="background-color:#FFFFFF";
	}
}
