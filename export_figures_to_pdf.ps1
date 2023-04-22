# export of drawio files to pdf

$DIR_DRAWIO = "./figures/drawio"

$DrawIoFiles = Get-ChildItem $DIR_DRAWIO *.drawio -File

foreach ($file in $DrawIoFiles) {
    & "C:/Program Files/draw.io/draw.io.exe" --crop -x -f pdf $file.FullName -o ./figures -v
}

$DIR_EPS = "./figures/eps"

$EpsFiles = Get-ChildItem $DIR_EPS *.eps -File

foreach ($file in $EpsFiles) {
    epstopdf $file.FullName
    Copy-Item "./figures/eps/$($file.BaseName).pdf"  -Destination ./figures -Force
    Remove-Item "./figures/eps/$($file.BaseName).pdf" -Force 
}

$DIR_SVG = "./figures/svg"

$SvgFiles = Get-ChildItem $DIR_SVG *.svg -File

foreach ($file in $SvgFiles) {
    inkscape $file.FullName --export-type=pdf --export-filename="./figures/$($file.BaseName).pdf"
}

