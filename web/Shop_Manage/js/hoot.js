<!-- 导出到Excel代码
function AutomateExcel(hootid) 
{ 
// Start Excel and get Application object. 
var oXL = new ActiveXObject("Excel.Application"); 
// Get a new workbook. 
var oWB = oXL.Workbooks.Add(); 
var oSheet = oWB.ActiveSheet; 
var table = document.getElementById(hootid); 
var hang = table.rows.length; 

var lie = table.rows(0).cells.length; 

// Add table headers going cell by cell. 
for (i=0;i<hang;i++) 
{ 
for (j=0;j<lie;j++) 
{ 
oSheet.Cells(i+1,j+1).value = table.rows(i).cells(j).innerText; 
} 

} 
oXL.Visible = true; 
oXL.UserControl = true; 
} 
//--> 

<!-- 导出到Excel代码
//function AutomateExcel2() 
//{ 
//// Start Excel and get Application object. 
//var oXL = new ActiveXObject("Excel.Application"); 
//// Get a new workbook. 
//var oWB = oXL.Workbooks.Add(); 
//var oSheet = oWB.ActiveSheet; 
//var table = document.getElementById('GridView2'); 
//var hang = table.rows.length; 

//var lie = table.rows(0).cells.length; 

//// Add table headers going cell by cell. 
//for (i=0;i<hang;i++) 
//{ 
//for (j=0;j<lie;j++) 
//{ 
//oSheet.Cells(i+1,j+1).value = table.rows(i).cells(j).innerText; 
//} 

//} 
//oXL.Visible = true; 
//oXL.UserControl = true; 
//} 
//--> 