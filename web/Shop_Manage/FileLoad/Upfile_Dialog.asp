<!--#include file="../upfile_class.asp"-->
<!--#include file="../upfile_config.asp"-->
<%
const upload_type=0   '上传方法：0=无惧无组件上传类，1=FSO上传 2=lyfupload，3=aspupload，4=chinaaspupload
'const SaveUpFilesPath="SaveUpFilesPath"
const UpFileType_pic="xls|xlsx"
const UpFileType_flash="swf"
const UpFileType_media="wmv|asf|avi"
const UpFileType_rm="ram|rm|ra"
'const MaxFileSize=102400

dim upload,oFile,formName,SavePath,filename,fileExt,oFileSize
dim EnableUpload
dim UpFileType,arrUpFileType
dim ranNum
dim msg,FoundErr
dim DialogType
msg=""
FoundErr=false
EnableUpload=false
SavePath = "../FileLoad"   '存放上传文件的目录
if right(SavePath,1)<>"/" then SavePath=SavePath&"/" '在目录后加(/)
%>
<html>
<head>
<title>上传文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="../editor_dialog.css">
</head>
<body bgColor="#ffffff" leftmargin="2" topmargin="5" marginwidth="0" marginheight="0">
<%
		select case upload_type
			case 0
				call upload_0()  
			case else
		end select
%>
</body>
</html>
<%
sub upload_0()    
	set upload=new upfile_class 
	upload.GetData(104857600)   
	if upload.err > 0 then  
		select case upload.err
			case 1
				response.write "请先选择你要上传的文件！"
			case 2
				response.write "你上传的文件总大小超出了最大限制（100M）"
		end select
		response.end
	end if
	DialogType=trim(upload.form("DialogType"))
	select case DialogType
	case "pic"
		UpFileType=UpFileType_pic
	case "flash"
		UpFileType=UpFileType_flash
	case "media"
		UpFileType=UpFileType_media
	case "rm"
		UpFileType=UpFileType_rm
	case else
		UpFileType=""
	end select
	for each formName in upload.file 
		set ofile=upload.file(formName)  
		oFileSize=ofile.filesize
		if oFileSize<100 then
			msg="请先选择你要上传的文件！"
			FoundErr=True
		elseif ofilesize>(MaxFileSize*1024) then
 			msg="文件大小超过了限制，最大只能上传" & CStr(MaxFileSize) & "K的文件！"
			FoundErr=true
		end if

		fileExt=lcase(ofile.FileExt)
		arrUpFileType=split(UpFileType,"|")
		for i=0 to ubound(arrUpFileType)
			if fileEXT=trim(arrUpFileType(i)) then
				EnableUpload=true
				exit for
			end if
		next
		if fileEXT="asp" or fileEXT="asa" or fileEXT="aspx" then
			EnableUpload=false
		end if
		if EnableUpload=false then
			msg="这种文件类型不允许上传！\n\n只允许上传这几种文件类型：" & UpFileType
			FoundErr=true
		end if
		
		
		strJS="<SCRIPT language=javascript>" & vbcrlf
		if FoundErr<>true then
			randomize
			ranNum=int(900*rnd)+100
			filename=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
            truename = filename
			filename=SavePath&filename
			ofile.SaveToFile Server.mappath(FileName)   
'将文件上传到服务器后，判断用户文件中的危险操作字符:
FilePathc = server.mappath(""&SavePath&truename&"")
set MyFile = server.CreateObject("Scripting.FileSystemObject")
set MyText = MyFile.OpenTextFile(FilePathc,1) '读取文本文件
sTextAll = lcase(MyText.ReadAll)
MyText.close
set MyFile = nothing
sStr=".getfolder|.createfolder|.deletefolder|.createdirectory|.deletedirectory|.saveas|wscript.shell|script.encode|server.|.createobject|execute|activexobject|language=|VBScript|Error|Server|response.|UserPass|javascript|Function|Request.|<?php"
sNoString = split(sStr,"|")
for i=0 to ubound(sNoString)
   if instr(sTextAll,sNoString(i)) then
     set filedel = server.CreateObject("Scripting.FileSystemObject")
     filedel.deletefile FilePathc
     set filedel = nothing
	 
     Response.Write("您上传的文件有问题，上传失败")
     Response.End()
   end if
next
			response.write "文件上传成功！"
			
            PUrl=Left(Request.ServerVariables("URL"),InStrRev(Request.ServerVariables("Url"),"/"))
            PageUrl="http://"& Request.ServerVariables("SERVER_NAME") & PUrl
            filename=PageUrl&filename
            
			strJS=strJS & "parent.document.myform.url.value='" & fileName & "';" & vbcrlf
			strJS=strJS & "parent.document.myform.TrueName.value='" & truename & "';" & vbcrlf
		else
			strJS=strJS & "alert('" & msg & "');" & vbcrlf
			strJS=strJS & "window.location='Upload_Dialog.asp?DialogType=" & DialogType & "';" & vbcrlf
		end if
		strJS=strJS & "</script>" & vbcrlf
		response.write strJS
		
		set file=nothing
	next
	set upload=nothing
end sub
%> 
