dir "C:\Program Files (x86)\Microsoft Visual Studio\"
dir "C:\Program Files (x86)\MSBuild"
dir "C:\Program Files (x86)\Windows Kits"

$env:Path -split ";" | % { dir $_\*.exe | % { $_.fullname } } | sort
