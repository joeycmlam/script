#/bin/ksh


a=$1

b=$2

n=$3

m=$4

total=0

calcF() 
{
	x=$1
	echo "x = $x"
	rtnValue=0
	for ((j=0; j <= $x; j++))
	do
		rtnValue=`expr "$rtnValue + $j" | bc`
	done

	echo "value $rtnValue"
	return $rtnValue
}

calcFRec()
{
    s=$1
    x=$2
    f1=$3

    echo "calcRec $s $x"
    f1=`expr "$f1 + $s" | bc`

    if [ $s -ge $x ]
    then
	   return $f1
    else
 	   s1=`expr "$s + 1" | bc`
	   calcFRec $s1 $x $f1
	   f1=$?
	   return $f1
    fi

}


calcFib()
{
  f0=$1
  f1=$2
  fn=$3
  total=$4

  echo "f: $f0 $f1 $fn $total"

  total=`expr "$total + $f0 + $f1" |bc `

  if [ $f0 -gt $fn ]
  then
      return $total
  else 
      f0=`expr "$f1" | bc`
      f1=`expr "$f1 + 1" | bc`
      calcFib $f0 $f1 $fn $total
      total=$?
      return $total
  fi
}



echo $a $b $n $m

calcFib $a $b $n 0
total=$?
echo "total $total"

result=`expr "$total % $m" | bc`

echo "result $result"

echo "done!"


