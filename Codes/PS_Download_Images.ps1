$WebsiteUrl = Read-Host "Website URL"

$WebResponse= Invoke-WebRequest $WebsiteUrl
ForEach ($Image in $WebResponse.Images)
{
    $FileName = Split-Path $Image.src -Leaf
    Invoke-WebRequest $Image.src -OutFile $FileName
}