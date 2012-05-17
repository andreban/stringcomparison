{
This unit contains the TStringComparator class, which is used to compare two String and gives a grade
between 0 and 1 for the equity
 @author(André Cipriani Bandarra (andre@bandarra.org))
}
unit StringComparator;

interface
uses SysUtils;
{Maximum Length of the Strings to be compared}
const MAX_STRLEN = 60;
{Similarities list}
const listaSimilaridades: array [1..39] of array [1..2] of char =
(
  ('A','E'),('A','I'),('A','O'),('A','U'),('B','V'),('E','I'),('E','O'),
  ('E','U'),('I','O'),('I','U'),('O','U'),('I','Y'),('E','Y'),('C','G'),
  ('E','F'),('W','U'),('W','V'),('X','K'),('S','Z'),('X','S'),('Q','C'),
  ('U','V'),('M','N'),('L','I'),('Q','O'),('P','R'),('I','J'),('2','Z'),
  ('5','S'),('8','B'),('1','I'),('1','L'),('0','O'),('0','Q'),('C','K'),
  ('G','J'),('E',' '),('Y',' '),('S',' ')            
);
{
 @html(<p>)The purpose of this class is to implement the string comparison Algorithms
 described on the paper "Advanced Methods for Record Linkage", by William E. Winkler, 
 Bureau of the Census, Washington DC 20233-9100. The document can be accessed at http://www.census.gov/srd/www/abstract/rr94-5.html@html(</p>)
 
 @html(<p>)It was used the code on http://www.census.gov/geo/msb/stand/strcmp.c
  as a base for this program@html(</p>)
  
 @html(<p>)The Lynch algorithm is the most advanced one and should be preferred @html(</p>)
 @author(André Cipriani Bandarra (andre@bandarra.org))
 @abstract(class containing the string comparison algorithms)
}
type TStringComparator = class(TObject)
	private
		string1: String;
		string2: String;
		str1Len: integer;
		str2Len: integer;
		countCommons1: integer;
		countCommons2: integer;
		countSimilarities1: integer;
		countSimilarities2: integer;
		countTranspositions: integer;
		matchStr1: String;
		matchStr2: String;
		wasfound1: array[1..MAX_STRLEN] of boolean;
		wasfound2: array[1..MAX_STRLEN] of boolean;
		similarArray: array[1..MAX_STRLEN] of boolean;
		firstEquals: integer;
		function Max(i,j: integer): integer;
		function Min(i,j: integer): integer;
		function isSimilar(c1,c2: char): boolean;
		function calculateWinkler(d: double): double;
		function calculateLynch(d: double): double;

		
	protected
	public
		{
		@html(<p>)Sets the strings and calculates values that are uses by the other methods@html(<p>)
		@html(<p>)@html(<em><b>)Common@html(</b></em>) characters are the characters that are on the other string at half length -1 of the shorter string.
		The common characters are recorded on others strings that are used to calculate the traspositions.@html(</p>)
		@html(<p>)@html(<em><b>)Transpositions@html(</b></em>) are characters that out of order with the correspondent one on the other string@html(</p>)
		@html(<p>)@html(<em><b>)Similarities@html(</b></em>) are errors that occur due to wrong typing or mispelling. Similarities are calculated like 
		common characters@html(</p>)
		
		@param (s1 the 1st string to be compared)
		@param (s2 the 2nd string to be compared)
		}
		procedure setNomes(s1,s2: String);
    
		{@html(<p>)Calculates equivalence between the strings using the Jaro algorithm.@html(</p>)
		
		
		Uses the following formula: @html(<br>)
		where: @html(<br>)
		@html(<b>)c1@html(</b>) = common characters on the 1st string @html(<br>)
		@html(<b>)c2@html(</b>) = common characters on the 2nd string @html(<br>)
		@html(<b>)s1@html(</b>) = size of the 1st string @html(<br>)
		@html(<b>)s2@html(</b>) = size of the 2nd string @html(<br>)
		@html(<b>)t@html(</b>) = transpositions @html(<br>)
		@html(<b>)w1@html(</b>) = c1/s1 @html(<br>)
		@html(<b>)w2@html(</b>) = c2/s2 @html(<br>)
		@html(<b>)w3@html(</b>) = (c1-t/2)/c1 @html(<br>)
		@html(<b>)Jaro@html(</b>) = (w1+w2+w3)/3 @html(<br>)
     
		@return (the result of the Jaro calculation)
		}
		function calculateJaro(): double;
		{
		@html(<p>)Calculates equivalence between the strings using the Winkler algorithm.
		This algorithm counts how many characters are shared up to the 4th char and
		boosts the result.@html(</p>)
		@return (the result of the Winkler calculation)
		}
		function calculateWinkler(): double;
		{
		@html(<p>)Calculates equivalence between the strings using the McLaughlin algorithm.
		This algorithm uses the similar characters to boost the result. It calls the 
		Winkler method after the calculation@html(</p>)
		
		Uses the following formula:@html(<br>)
		having:@html(<br>)
		@html(<b>)c1@html(</b>) = common characters on the 1st string @html(<br>)
		@html(<b>)c2@html(</b>) = common characters on the 2nd string @html(<br>)
		@html(<b>)s1@html(</b>) = size of the 1st string @html(<br>)
		@html(<b>)s2@html(</b>) = size of the 2nd string @html(<br>)
		@html(<b>)sm1@html(</b>) = similarities on the 1st string @html(<br>)
		@html(<b>)sm2@html(</b>) = similarities on the 2nd string @html(<br>)
		@html(<b>)t@html(</b>) = transpositions @html(<br>)
		@html(<b>)w1@html(</b>) = (c1+sm1*0.3)/s1 @html(<br>)
		@html(<b>)w2@html(</b>) = (c2+sm2*0.3)/s2 @html(<br>)
		@html(<b>)w3@html(</b>) = (c1-t/2)/c1 @html(<br>)
		@html(<b>)Jaro@html(</b>) = (w1+w2+w3)/3 @html(<br>)

		@return (the result of the McLaughlin calculation)}
		function calculateMcLaughlin(): double;
		{Calculates equivalence between the strings using the Lynch algorithm. 
		Uses the McLaughlin algorithm as the base value
 
		 Boosts the comparator value if more than half of the characters beyond the first
		 four are equal.

 		@return (the result of the Lynch calculation)}		
		function calculateLynch(): double;
end;

implementation

function TStringComparator.isSimilar(c1,c2: char): boolean;
var
  i: integer;
Begin
  result := false;
  for i:= 1 to 39 do
  Begin
    if ((listaSimilaridades[i][1] = c1) and (listaSimilaridades[i][2] = c2))
       or ((listaSimilaridades[i][1] = c2) and (listaSimilaridades[i][2] = c1)) then
    Begin
      Result := true;
      break;
    End;          
  End;
End;


function TStringComparator.Max(i,j: integer): integer;
Begin
  if i > j then
    Result := i
  else
    Result := j;
End;


function TStringComparator.Min(i,j: integer): integer;
Begin
  if i < j then
    Result := i
  else
    Result := j;
End;

function TStringComparator.calculateLynch(): double;
Begin
  Result := calculateLynch(calculateMcLaughlin);
End;

function TStringComparator.calculateLynch(d: double): double;
var
  minLen: integer;
  tmp: double;
Begin
  tmp := d;
  minLen := Min(length(string1), length(string2));
  if (minLen > 4) and (countCommons1 > firstEquals+1) and (2*countCommons1 >= minLen+1) then
  Begin
    tmp := tmp + (1.0 - d) * ((countCommons1 - firstEquals - 1) /
           ((integer(length(string1))+integer(length(string2))-firstEquals*2+2)));
  End;
  Result := tmp;
End;


//ble
function TStringComparator.calculateMcLaughlin(): double;
var
  w1,w2,w3: double;
  halfTransp, maxCommons: integer;
Begin  
  w1 := (countCommons1 + countSimilarities1 * 0.3)/length(string1);
  w2 := (countCommons2 + countSimilarities2 * 0.3)/length(string2);
  maxCommons := max(countCommons1, countCommons2);
  halfTransp := countTranspositions div 2 + countTranspositions mod 2;
  w3 := (maxCommons - halfTransp)/maxCommons;
  Result := calculateWinkler((w1+w2+w3)/3);
End;

function TStringComparator.calculateWinkler():double;
Begin
  result := calculateWinkler(calculateJaro);
End;


function TStringComparator.calculateWinkler(d: double): double;
var
  weightlen: integer;
  i: integer;
Begin
  weightLen := Min(4,Min(length(string1),length(string2)));
  i := 1;
  while (i <= weightLen) and (string1[i] = string2[i]) do
  Begin
    inc(i);
  End;
  firstEquals := i-1;
  
  result := d + ((i-1) * 0.1 * (1.0-d));
End;


procedure TStringComparator.setNomes(s1,s2: String);
var
  i,j: integer;
  maxTam: integer;
Begin
  string1 := UpperCase(s1);
  string2 := UpperCase(s2);
  str1Len := length(s1);
  str2Len := length(s2);
  maxTam  := Max(str1Len, str2Len);  
  matchStr1 := '';
  matchStr2 := '';
  countCommons1 := 0;
  countCommons2 := 0;
  countSimilarities1 := 0;
  countSimilarities2 := 0;
  countTranspositions := 0;
  for i := 1 to MAX_STRLEN do
  Begin
    wasfound1[i] := false;
    wasfound2[i] := false;
  End;
  
  
  for i := 1 to str1Len do
  Begin
    for j := Max(1,i-(maxTam div 2-1)) to Min(str2Len,i+(maxTam div 2-1)) do
    Begin    
      if ((not wasfound1[j]) and (string1[i] = string2[j])) then
      Begin
        inc(countCommons1);
	matchStr1 := matchStr1 + string1[i];
	wasfound1[j] := true;
	break;
      End;
    End;   
  End;
  
  for i:=1 to str2Len do
  Begin
    for j := Max(1,i-(maxTam div 2-1)) to Min(str1Len,i+(maxTam div 2-1)) do
    Begin
      if ((not wasfound2[j]) and (string2[i] = string1[j])) then
      Begin
        inc(countCommons2);
	matchStr2 := matchStr2 + string2[i];
	wasfound2[j] := true;
	break;
      End;
    End;
  End;
  
  for i:= 1 to MAX_STRLEN do
    similarArray[i] := false;
    
  for i := 1 to length(string1) do
  Begin
    if (not wasfound2[i]) then
    Begin
      for j := Max(1,i-(maxTam div 2-1)) to Min(length(string2), i+(maxTam div 2 -1)) do
      Begin
        if (not wasfound1[j]) and (not similarArray[j]) and (isSimilar(string1[i],string2[j])) then
	Begin
	  inc(countSimilarities1);
	  similarArray[j] := true;
	  break;
	End;
      End;
    End;
  End;
  
  for i := 1 to MAX_STRLEN do
    similarArray[i] := false;
    
  for i := 1 to length(string2) do
  Begin
    if (not wasfound1[i]) then
    Begin
      for j := Max(1,i-(maxTam div 2 - 1)) to Min(length(string1), i+(maxTam div 2 - 1)) do
      Begin
        if (not wasfound2[j]) and (not similarArray[j]) and (isSimilar(string2[i],string1[j])) then
	Begin
	  inc(countSimilarities2);
	  similarArray[j] := true;
	  break;
	End;
      End;
    End;
  End;
   
  for i := 1 to Min(length(matchStr1),length(matchStr2)) do
  Begin
    if matchStr1[i] <> matchStr2[i] then
      inc(countTranspositions);
  End;

End;

function TStringComparator.calculateJaro():double;
var
  w1, w2, w3: double;
  maxCommons, halfTransp: integer;
Begin
  w1 := countCommons1/length(string1);
  w2 := countCommons2/length(string2);
  maxCommons := Max(countCommons1, countCommons2);
  halfTransp := countTranspositions div 2 + countTranspositions mod 2;
  w3 := (maxCommons - halfTransp)/maxCommons;
  result := (w1+w2+w3)/3;           
End;

End.
