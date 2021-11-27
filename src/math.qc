float(float n1,float n2) math_min =
{
    return n1 < n2 ? n1 : n2;
}

float(float n1,float n2) math_max =
{
    return n1 > n2 ? n1 : n2;
}

float(float nValue,float nMin,float nMax) math_clamp =
{
    return math_max(math_min(nValue,nMax),nMin);
}