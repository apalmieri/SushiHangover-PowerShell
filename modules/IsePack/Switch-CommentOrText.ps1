function Switch-CommentOrText {
    <#
    .Synopsis
        Switches between commented and uncommented text
    .Description
        Takes a block of text.  Uncomments lines that are commented out and 
        comments lines that are not already commented out.
    .Example 
        Switch-CommentOrText $psise.CurrentFile.SelectedText
    #>
    param(
    # The text in which to toggle comments.
    [Parameter(Mandatory=$true,
        ValueFromPipeline=$true)]
    [String]$text
    )
    
    process {
        $returnedText = ""
        foreach ( $line in $text -split `
                      [System.Environment]::NewLine ) {
            if ( $line.length -gt 0) {
                if ( $line -match "^#" ) {
                    $line = $line -replace "^#", ""
                } else {
                    $line = $line -replace "^", "#"
                }
                $returnedText += "{0}{1}" -f $line, `
                    [System.Environment]::NewLine
            }
        }
        $returnedText
    }
}


