program TestyNapisów; 
var s1,s2,s3:string;

begin 
writeln('Podaj trzy ³añcuchy tekstowe (pierwszy conajmniej 10 znaków)');
write('s1:'); readln(s1);
write('s2:'); readln(s2);
write('s3:'); readln(s3);

writeln('Length(s1)=',Length(s1));
writeln('Pos(s3,s1)=',Pos(s3,s1));

writeln('Concat(s1,s2,s3): ', Concat(s1,s2,s3)     );
writeln('Copy(s1,4,3): ',Copy(s1,4,3)     );

write('Delete(s1,4,3): '); Delete(s1,4,3); writeln(s1);
write('Insert(s2,s1,4): '); Insert(s2,s1,4);writeln(s1);

writeln('UpperCase(s1): ',UpperCase(s1) );
writeln('LowerCase(s1): ',LowerCase(s1) );
end.
