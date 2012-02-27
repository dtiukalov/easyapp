function DrawImageW(nw, nh ,iwidth,iheight)
{	
	if(!iwidth)iwidth=90;
	if(!iheight)iheight=90;
	
	if(nw>0&&nh>0)
	{
		var flag=true;
		if(nw/nh>=iwidth/iheight)
		{
			if(nw>iwidth)
			{
				return iwidth;
			}
			else
			{
				return nw;

			}
		}
		else
		{
			if(nh>iheight){
				return (nw*iheight)/nh;
			}
			else
			{
				return nw;
			}
		}
	}
}
function DrawImageH(nw, nh ,iwidth,iheight)
{	
	if(!iwidth)iwidth=90;
	if(!iheight)iheight=90;
	
	if(nw>0&&nh>0)
	{
		var flag=true;
		if(nw/nh>=iwidth/iheight)
		{
			if(nw>iwidth)
			{
				return (nh*iwidth)/nw;
			}
			else
			{
				return nh;
			}
		}
		else
		{
			if(nh>iheight)
			{
				return iheight;
				
			}
			else
			{
				return nh;
			}
		}
	}
}

function DrawImage2(ImgD,iwidth,iheight)
{	
	if(!iwidth)iwidth=90;
	if(!iheight)iheight=90;
	
	var nw = ImgD.width;
	var nh = ImgD.height;
	
	if(nw>0&&nh>0)
	{
		var flag=true;
		if(nw/nh>=iwidth/iheight)
		{
			if(nw>iwidth)
			{
				ImgD.width=iwidth;
				ImgD.height=(nh*iwidth)/nw;
			}
			else
			{
				ImgD.width=nw;
				ImgD.height=nh;
			}
		}
		else
		{
			if(nh>iheight)
			{
				ImgD.height=iheight;
				ImgD.width=(nw*iheight)/nh;
			}
			else
			{
				ImgD.width=nw;
				ImgD.height=nh;
			}
		}
	}
}

function DrawImage(ImgD,iwidth,iheight)
{	
	var image=new Image();
	if(!iwidth)iwidth=90;
	if(!iheight)iheight=90;
	image.src=ImgD.src;
	if(image.width>0&&image.height>0)
	{
		var flag=true;
		if(image.width/image.height>=iwidth/iheight)
		{
			if(image.width>iwidth)
			{
				ImgD.width=iwidth;
				ImgD.height=(image.height*iwidth)/image.width;
			}
			else
			{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		}
		else
		{
			if(image.height>iheight)
			{
				ImgD.height=iheight;
				ImgD.width=(image.width*iheight)/image.height;
			}
			else
			{
				ImgD.width=image.width;
				ImgD.height=image.height;
			}
		}
	}
}