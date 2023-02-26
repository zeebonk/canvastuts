/********* Code Highlighting script **********
* Script written by Tessmore | date 2011-4-7 *
*    Example : www.tessmore.nl/highlight     *
*********************************************/
var keywords = ['if','else','var','for','function','this','false','true','new','null','return','while','do','continue','boolean','break','case','catch','public','static','super','switch','throw','throws','try','typeof','void'];

$(document).ready(function()
{
  $(".code").each(function()
  {
    var temp = $(this).html(), lineNumbers = temp.split("\n").length, lines = "", highlighted = "";
    
    for (i = 0; i < temp.length; i++)
    {
      c1 = temp.charAt(i);  
      c2 = temp.charAt(i+1);
			start = i;
			
			if (c1 == '/') // Multiline comments & regex
			{
			  if (c2 == '*')      
          i = findString(temp, "*/", i+1) + 1;
        else if (c2 == '/')
          i = findString(temp, "\n", i+1);
        else
        {
          i = findString(temp, "/", i+1);
          while (temp.charAt(i++) == "g" || temp.charAt(i) == "m" || temp.charAt(i) == "i");
        }
         			  
			  highlighted += "<span class='comment'>" + temp.substring(start, i+1) + "</span>";
			}
			else if (c1 == "\"" || c1 == "'") // Quotes
			{
    	  i = findString(temp, c1, i+1);
				highlighted += "<span class='quote'>" + temp.substring(start, i+1) + "</span>";
			}
			else if (c1 == "&" && c2 == "l" && temp.charAt(i+2) == 't') // Html
			{
    	  i = findString(temp, "&gt;", i+4) + 3;

  			highlighted += "<span class='html'>" + temp.substring(start, i+1) + "</span>";
			}
			else
			{
				findKeyword = false;
				
				if (isWhiteSpace(temp.charAt(i - 1)) || i == 0)
					for (j = 0; j < keywords.length; j++)
						if (isWhiteSpace(temp.charAt(i + keywords[j].length)))
							if (i == temp.indexOf(keywords[j], i))
							{
								findKeyword = true;
								highlighted += "<span>"+ keywords[j] +"</span>";
								i += keywords[j].length - 1;
								break;
							}
          
        if (!findKeyword)
          highlighted += c1;
			}
		}

    for (i = 1; i < lineNumbers; i++)
      lines += i + "<br>";

    // Adds linenumbers & highlighted code back to the DOM
    $(this).html("<div>"+ lines +"</div><pre>"+ highlighted +"</pre>");
  });
});

function findString(haystack, needle, index)
{
	return (i = haystack.indexOf(needle, index)) > 0 ? i : haystack.length;
}

function isWhiteSpace(c)
{
	return (c == "\t" || c == "\n" || c == " " || c == "\r" || c == "(" || c == ")" || c == "{" || c == "}" || c == ";");
}
