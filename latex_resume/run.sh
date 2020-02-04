xelatex jl-2016-11-06-zq精简.tex
open jl-2016-11-06-zq精简.pdf
mv jl-2016-11-06-zq精简.pdf android-程思敏.pdf
exit

for file in *
do
    if test -f $file
    then
        echo $file 是文件
        left=${file%.*} 
		right=${file##*.} 
		echo $left $right
		if [[ $right = tex ]]; then
			xelatex $file
			open $left.pdf
			exit
		fi
    else
        echo $file 是目录
    fi
done

#xelatex 