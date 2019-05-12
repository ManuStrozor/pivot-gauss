package body P_Str is
   
   function Oppose(S : in String) return String is
   begin
      if S(S'First) = ' ' then
	 return '-' & S(S'First+1..S'Last);
      else
	 return ' ' & S(S'First+1..S'Last);
      end if;
   end;
   
   function Trim(S : in String) return String is
      I : Integer := S'First;
      Cnt : Integer := 0;
   begin
      while S(I) = ' ' loop
	 Cnt := Cnt + 1;
	 I := I + 1;
      end loop;
      return S(S'First+Cnt..Strlen(S));
   end;
   
   function Isint(Exp : in Float) return Boolean is
   begin
      return Exp = Float(Integer(Exp));
   end;
   
   function Pgcd(A,B : Integer) return Integer is
      C : Integer;
   begin
      C := A mod B;
      if C = 0 then
	 return B;
      else
	 return Pgcd(B,C);
      end if;
   end;
   
   function Simp(I1, I2 : in Integer) return String is
      N, D : Integer;
      P : Integer := Pgcd(I1, I2);
   begin
      N := Integer(Float(I1) / Float(P));
      D := Integer(Float(I2) / Float(P));
      declare
	 ImageD : String := Integer'Image(D);
      begin
	 if D /= 1 then
	    return Integer'Image(N) & '/' & ImageD(ImageD'First+1..ImageD'Last);
	 else
	    return Integer'Image(N);
	 end if;
      end;
   end;
   
   function GetCoef(N, D : in String) return T_Str is
      Res : Float := Floaty(N) / Floaty(D);
      S1 : String := Integer'Image(Num(N) * Denum(D));
      S2 : String := Integer'Image(Denum(N) * Num(D));
      Coef1 : String := Integer'Image(Integer(Res));
      Coef2 : String := Simp(Integer'Value(S1), Integer'Value(S2));
   begin
      declare
	 Tmp1 : String(1..T_Str'Length-Coef1'length) := (others => ' ');
	 Tmp2 : String(1..T_Str'Length-Coef2'length) := (others => ' ');
      begin
	 if Isint(Res) then
	    return Coef1 & Tmp1;
	 else
	    return Coef2 & Tmp2;
	 end if;
      end;
   end;
   
   function Slash(Str : in String) return Integer is
      I : Integer := Str'first;
   begin
      while I <= Str'last and then Str(I) /= '/' loop
	 I := I + 1;
      end loop;
      return I;
   end;
   
   function Num(Str : in String) return Integer is
   begin
      if Slash(Str) /= Str'Last+1 then
	 return Integer'Value(Str(Str'First..Slash(Str)-1));
      else
	 return Integer'Value(Str);
      end if;
   end;
      
   function Denum(Str : in String) return Integer is
   begin
      if Slash(Str) /= Str'Last+1 then
	 return Integer'Value(Str(Slash(Str)+1..Str'Last));
      else
	 return 1;
      end if;
   end;   
      
   function Floaty(Str : in String) return Float is
   begin
      return Float(Num(Str)) / Float(Denum(Str));
   end;
   
   function Sum(Mat : in TV_Str; L : in positive) return Float is
      Sum : Float := 0.0;
   begin
      for I in 1..Mat'last(2)-1 loop
	 Sum := Sum + Floaty(Mat(L, I));
      end loop;
      return Sum;
   end;
   
   function Diago(Mat : in TV_Str) return Boolean is
      Q : Positive;
   begin
      if Nbl(Mat) >= Nbc(Mat) then
	 Q := Nbc(Mat)-1;
      else
	 Q := Nbl(Mat);
      end if;
      for I in 1..Q loop
	 if Floaty(Mat(I, I)) = 0.0 and Sum(Mat, I) /= 0.0 then
	    return False;
	 end if;	    
      end loop;
      return True;
   end;
   
   function Homo(Mat : in TV_Str) return Boolean is
   begin
      for I in Mat'Range(1) loop
	 if Floaty(Mat(I, Nbc(Mat))) /= 0.0 then return False; end if;
      end loop;
      return True;
   end;
   
   function Trisup(Mat : in TV_Str) return Boolean is
      J, Q : Positive;
   begin
      if Nbl(Mat) > Nbc(Mat) then
	 Q := Nbc(Mat);
      else
	 Q := Nbl(Mat);
      end if;
      for I in Mat'Range(1) loop
	 J := 1;
	 while J < I and J < Q loop
	    if Floaty(Mat(I, J)) /= 0.0 then
	       return False;
	    end if;
	    J := J + 1;
	 end loop;
      end loop;
      return True;
   end;
   
   function Nbc(Mat : in TV_Str) return Positive is
   begin
      return Mat'Length(2);
   end;
   
   function Nbl(Mat : in TV_Str) return Positive is
   begin
      return Mat'Length(1);
   end;
   
   function Strlen(Str : in String) return Integer is
      I : Integer := str'First+1;
      Len : Integer := 0;
   begin
      while I <= str'Last and then str(I) /= ' ' loop
	 Len := Len + 1;
	 I := I + 1;
      end loop;
      return Len+1;
   end;
   
   function Max(Mat : in TV_Str) return Integer is
      Max, N : Integer;
   begin
      Max := Strlen(Trim(Mat(1, 1)));
      for I in Mat'Range(1) loop
	 for J in Mat'Range(2) loop
	    N := Strlen(Trim(Mat(I, J)));
	    if N > Max then Max := N; end if;
	 end loop;
      end loop;
      return Max;
   end;
   
   procedure Switch_L(Mat : out TV_Str; L1, L2 : in Positive) is
      Tmp : T_Str;
   begin
      for I in Mat'Range(2) loop
	 Tmp := Mat(L1, I);
	 Mat(L1, I) := Mat(L2, I);
	 Mat(L2, I) := Tmp;
      end loop;
   end;
   
   procedure Switch_C(Mat : out TV_Str; C1, C2 : in Positive; Ord : out TV_Ord) is
      Tmp_I : T_Str;
      Tmp_C : Character;
   begin
      for I in Mat'Range(1) loop
	 Tmp_I := Mat(I, C1);
	 Mat(I, C1) := Mat(I, C2);
	 Mat(I, C2) := Tmp_I;
      end loop;
      Tmp_C := Ord(C1);
      Ord(C1) := Ord(C2);
      Ord(C2) := Tmp_C;
   end;
   
   procedure GetCand(Mat : out TV_Str; Piv : in Positive; Ord : out TV_Ord) is
      Switched : Boolean := False;
      I : Integer := Piv;
   begin
      while I <= Mat'Last(1) and not switched loop
	 if I /= Piv and Floaty(Mat(I, piv)) /= 0.0 then
	    Switch_L(Mat, Piv, I);
	    Switched := True;
	 end if;
	 I := I + 1;
      end loop;
      I := Piv;
      while I <= Mat'Last(2) and not switched loop
	 if I /= Piv and Floaty(Mat(piv, I)) /= 0.0 then
	    Switch_C(Mat, Piv, I, Ord);
	    Switched := True;
	    A_La_Ligne;
	    Affiche(Ord);
	 end if;
	 I := I + 1;
      end loop;
      A_La_Ligne;
      Affiche(Mat);
   end;
   
   procedure CalcStr(Cible : out T_Str; Pivot, Coef : in String) is
      M : String := Simp(Num(Coef) * Num(Pivot), Denum(Coef) * Denum(Pivot));
      C : String := Simp((Num(Cible) * Denum(M)) - (Num(M) * Denum(Cible)), Denum(Cible) * Denum(M));
   begin
      declare
	 Tmp : String(1..T_Str'Length-C'Length) := (others => ' ');
      begin
	 Cible := C & Tmp;
      end;
   end;
   
   procedure DoPivot(Mat : out TV_Str; Piv : in positive) is
      Coef : T_Str;
   begin
      A_La_Ligne;
      for I in Piv..Mat'last(1) loop
	 if I /= Piv and Floaty(Mat(I, piv)) /= 0.0 then
	    Coef := GetCoef(Mat(I, Piv), Mat(Piv, Piv));
	    for J in Piv..Mat'Last(2) loop
	       CalcStr(Mat(I, J), Mat(Piv, J), Coef);
	    end loop;
	    AfficheEtapes(Coef, I, Piv);
	 end if;
      end loop;
      if not Trisup(Mat) then
	 A_La_Ligne;
	 Affiche(Mat);
      end if;
   end;
   
   procedure Calcul(Mat : out TV_Str; Ord : out TV_Ord) is
   begin
      AfficheTout(Mat, Ord);
      for I in 1..Nbc(Mat)-1 loop
	 if Floaty(Mat(I, I)) = 0.0 then
	    GetCand(Mat, I, Ord);
	    DoPivot(Mat, I);
	 else
	    DoPivot(Mat, I);
	 end if;
	 if Trisup(Mat) and Diago(Mat) then exit; end if;
      end loop;
      AfficheTout(Mat, Ord);
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
   
   procedure AfficheEtapes(Coef : in String; I, Piv : in positive) is
      Coeff : String := Oppose(Coef);
   begin
      if Floaty(Coef) > 0.0 then
	 if Floaty(Coef) = 1.0 then
	    Ecrire_Ligne("L" & Trim(Image(I)) & " <- L" & Trim(Image(I)) & " - L" & Trim(Image(Piv)));
	 else
	    Ecrire_Ligne("L" & Trim(Image(I)) & " <- L" & Trim(Image(I)) & " - " & Trim(Coef) & " L" & Trim(Image(Piv)));
	 end if;
      else
	 if Floaty(Coeff) = 1.0 then
	    Ecrire_Ligne("L" & Trim(Image(I)) & " <- L" & Trim(Image(I)) & " + L" & Trim(Image(Piv)));
	 else
	    Ecrire_Ligne("L" & Trim(Image(I)) & " <- L" & Trim(Image(I)) & " + " & Trim(Coeff) & " L" & Trim(Image(Piv)));
	 end if;
      end if;
   end;
   
   procedure AfficheTout(Mat : in TV_Str; Ord : in TV_Ord) is
   begin
      A_La_Ligne;
      Affiche(Ord);
      Affiche(Mat);
      --Ecrire_Ligne("Triang Sup : " & Boolean'Image(Trisup(Mat)));
      --Ecrire_Ligne("Diagonale  : " & Boolean'Image(Diago(Mat)));
      --Ecrire_Ligne("Homogène   : " & Boolean'Image(Homo(Mat)));
   end;
   
   procedure Affiche(Ord : in TV_Ord) is
   begin
      Ecrire("Ordre : ");
      for I in Ord'Range loop
	 Ecrire(Ord(I));
	 if I /= Ord'Last then Ecrire(' '); end if;
      end loop;
      A_La_Ligne;
   end;
   
   procedure Affiche(Mat : in TV_Str) is
      MaxS, Diff : Integer;
   begin
      MaxS := Max(Mat);
      for I in Mat'Range(1) loop
	 for J in Mat'Range(2) loop
	    Diff := MaxS - Strlen(Trim(Mat(I, J)));
	    for S in 1..Diff loop
	       Ecrire(' ');
	    end loop;
	    Ecrire(Trim(Mat(I, J)));
	    if J /= Mat'Last(2) then
	       if J = Mat'Last(2)-1 then
		  Ecrire(" |");
	       else
		  Ecrire(' ');
	       end if;
	    end if;
	 end loop;
	 if I /= Mat'Last(1) then A_La_Ligne; end if;
      end loop;
      A_La_Ligne;
   end;
   
end;
