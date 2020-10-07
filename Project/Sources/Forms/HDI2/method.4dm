C_LONGINT:C283($page)
C_BOOLEAN:C305($result)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		
		OBJECT SET VISIBLE:C603(*; "btnTrace"; False:C215)
		OBJECT SET VISIBLE:C603(*; "btnHtml"; False:C215)
		OBJECT SET VISIBLE:C603(*; "WParea@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "rb@"; False:C215)
		
		
		Form:C1466.rb1:=True:C214
		Form:C1466.rb2:=False:C215
		Form:C1466.rb3:=False:C215
		Form:C1466.rb4:=False:C215
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		
		If ($page=1)
			OBJECT SET VISIBLE:C603(*; "btnTrace"; False:C215)
			OBJECT SET VISIBLE:C603(*; "btnHtml"; False:C215)
			OBJECT SET VISIBLE:C603(*; "WParea@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "rb@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "btnTrace"; True:C214)
			OBJECT SET VISIBLE:C603(*; "btnHtml"; True:C214)
			OBJECT SET VISIBLE:C603(*; "WParea@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "rb@"; True:C214)
		End if 
		
		If ($page>1)
			
			Form:C1466.rb1:=False:C215
			Form:C1466.rb2:=False:C215
			Form:C1466.rb3:=False:C215
			Form:C1466.rb4:=False:C215
			
			QUERY:C277([SAMPLES:3]; [SAMPLES:3]Page:4=$page)
			
			WParea:=WP New:C1317([SAMPLES:3]wpSample:2)
			WPcomments:=WP New:C1317([SAMPLES:3]wpComments:3)
			WP SET ATTRIBUTES:C1342(WPcomments; wk background color:K81:20; wk transparent:K81:134)
			
			Case of 
				: ($page=2)  // case 1
					Form:C1466.rb2:=True:C214
					WP SET ATTRIBUTES:C1342(WParea; wk tab decimal separator:K81:323; wk point:K81:325)
					
				: ($page=3) | ($page=4) | ($page=6)  // case 2
					Form:C1466.rb1:=True:C214
					WP SET ATTRIBUTES:C1342(WParea; wk tab decimal separator:K81:323; wk point or comma:K81:324)
					
				: ($page=5)  // case 4
					Form:C1466.rb4:=True:C214
					WP SET ATTRIBUTES:C1342(WParea; wk tab decimal separator:K81:323; wk system:K81:327)
					
			End case 
			
		End if 
		
End case 

