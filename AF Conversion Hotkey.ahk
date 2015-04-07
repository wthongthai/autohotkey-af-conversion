; Test QID is 1210765 (please don't save over it!)
; This is for SerCP9 AF


^2::
clipboard :=

Send ^c

; (1) Change the title section of the AF
; (1.1) Prep to split AF into parts
clipboard := RegExReplace(clipboard, "<span class='text'>" , "~", Count, 1)
clipboard := RegExReplace(clipboard, "</span>" , "~", Count, 1)

; (1.2) Split AF into parts
StringSplit, NewArray, clipboard, ~

; (1.3) Change the part containing the title to new style
NewArray2 := RegExReplace(NewArray2, "<b>" , "&" , Count, 2)
NewArray2 := RegExReplace(NewArray2, "</b>" , "&" , Count, 2)

NewArray2 := RegExReplace(NewArray2, ":" , "" , Count, 1)
NewArray2 := RegExReplace(NewArray2, "-" , "&" , Count, 1)

StringSplit, OutputArray, NewArray2, &

; (1.4) Put the AF back to one piece
clipboard := NewArray1 "<div class='header_container'>" OutputArray1 "<span class='header_number'>" OutputArray2 "</span><span class='header_name'>"  OutputArray3 "</span>" OutputArray4 "</div><div class='subheadercontainer'><span class='subheadertitle'>" OutputArray5 "</span>" OutPutArray6 "</div>" NewArray3


; (2) Change the general look of the rest of the AF 
clipboard := RegExReplace(clipboard, "www.webassign.net/sercp8/sercp8af.css", "www.webassign.net/sercp9/sercp9af.css")
clipboard := RegExReplace(clipboard, "<div class='pse7'>", "<div class='pse9'>")
clipboard := RegExReplace(clipboard, "<p class='question'>", "<div class='question'>")
clipboard := RegExReplace(clipboard, "</p>", "</div>")
clipboard := RegExReplace(clipboard, "<b>Explore</b>", "<span class='subsectiontitle'>Explore</span>")
clipboard := RegExReplace(clipboard, "<b>Conceptualize</b>", "<span class='subsectiontitle'>Conceptualize</span>")
clipboard := RegExReplace(clipboard, "<b>Categorize</b>", "<span class='subsectiontitle'>Categorize</span>")
clipboard := RegExReplace(clipboard, "<b>Analyze</b>", "<span class='subsectiontitle'>Analyze</span>")
clipboard := RegExReplace(clipboard, "<b>Finalize</b>", "<span class='subsectiontitle'>Finalize</span>")

clipboard := RegExReplace(clipboard, "<hr>", "")

clipboard := RegExReplace(clipboard, "<b>", "")
clipboard := RegExReplace(clipboard, "</b>", "")

return
