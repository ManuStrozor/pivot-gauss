package body P_Pivot is
   
   procedure Calcul(Mat : out TV_Str; Ord : out TV_Ord) is
      I : Integer := 1;
   begin
      while I <= Mat'Length(2)-1 and then not (Trisup(Mat) and Diago(Mat)) loop
	 if Floaty(Mat(I, I)) = 0.0 then
	    GetCand(Mat, I, Ord);
	    DoPivot(Mat, I);
	 else
	    DoPivot(Mat, I);
	 end if;
	 I := I + 1;
      end loop;
   end;
   
   procedure Dimension(N, P : out Positive) is
   begin
      loop
	 Ecrire("Nombre de lignes : "); Lire(N);
	 exit when N > 0;
      end loop;
      loop
	 Ecrire("Nombre de colonnes : "); Lire(P);
	 exit when P > 0;
      end loop;
   end;
   
   procedure Lire(Mat : out TV_Str) is
   begin
      for I in Mat'Range(1) loop
	 for J in Mat'Range(2) loop
	    Ecrire("Coef" & Image(I) & Image(J) & " : "); Lire(Mat(I, J));
	 end loop;
      end loop;
   end;
   
   procedure Lire(Ord : out TV_Ord) is
   begin
      for I in Ord'Range loop
	 Ecrire("Var" & Image(I) & " : "); Lire(Ord(I));
      end loop;
   end;
   
end;
