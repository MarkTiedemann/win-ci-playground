$env:Path -split ";" | % { dir $_\*.exe | % { $_.fullname } } | sort
