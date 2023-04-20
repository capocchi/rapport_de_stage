# export of drawio files to pdf

$DIR_DRAWIO = "./figures/drawio"

$DrawIoFiles = Get-ChildItem $DIR_DRAWIO *.drawio -File

foreach ($file in $DrawIoFiles) {
    & "C:/Program Files/draw.io/draw.io.exe" --crop -x -f pdf $file.FullName -o .. -v
}

