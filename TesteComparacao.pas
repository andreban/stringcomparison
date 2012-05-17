program TesteComparacao;

uses StringComparator, SysUtils;

var
  ble: TStringComparator;
Begin
  ble := TStringComparator.Create;
  ble.setNomes('SHACKLEFORD','SHACKELFORD');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin));    
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));      
  WriteLn();
  
  ble.setNomes('DUNNINGHAM','CUNNIGHAM');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('NICHLESON','NICHULSON');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('JONES','JOHNSON');
  Write(FormatFloat('0.000',ble.calculateJaro));    
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin));      
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));        
  WriteLn();  
  
  ble.setNomes('MASSEY','MASSIE');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  

  ble.setNomes('ABROMS','ABRAMS');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('HARDIN','MARTINEZ');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));           
  WriteLn();  
  
  ble.setNomes('ITMAN','SMITH');
  Write(FormatFloat('0.000',ble.calculateJaro));
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin));      
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));        
  WriteLn();  
  
  WriteLn();
  
  ble.setNomes('JERALDINE','GERALDINE');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('MARHTA','MARTHA');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('MICHELLE','MICHAEL');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');  
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('JULIES','JULIUS');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('TANYA','TONYA');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('DWAYNE','DUANE');
  Write(FormatFloat('0.000',ble.calculateJaro));                      
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('SEAN','SUSAN');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('JON','JOHN');
  Write(FormatFloat('0.000',ble.calculateJaro));            
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('JON','JAN');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  WriteLn();              
  
  ble.setNomes('BROOKHAVEN','BRROKHAVEN');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('BROOK HALLOW','BROOK HLLW');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin));      
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));        
  WriteLn();  
  
  ble.setNomes('DECATUR','DECATIR');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('FITZRUREITER','FITZENREITER');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('HIGBEE','HIGHEE');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('HIGBEE','HIGVEE');
  Write(FormatFloat('0.000',ble.calculateJaro));  
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('LACURA','LOCURA');
  Write(FormatFloat('0.000',ble.calculateJaro));                
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('IOWA','IONA');
  Write(FormatFloat('0.000',ble.calculateJaro));                
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  ble.setNomes('1ST','IST');
  Write(FormatFloat('0.000',ble.calculateJaro));                    
  Write(' ');    
  Write(FormatFloat('0.000',ble.calculateWinkler));  
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateMcLaughlin)); 
  Write(' ');
  Write(FormatFloat('0.000',ble.calculateLynch));             
  WriteLn();  
  
  
  

End.