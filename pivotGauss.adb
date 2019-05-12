with P_Esiut; use P_Esiut;
with P_Str; use P_Str;

procedure PivotGauss is
   N, P : Positive;
begin
   Dimension(N, P);
   A_La_Ligne;
   declare
      M : TV_Str(1..N, 1..P);
      O : TV_Ord(1..P-1);
   begin
      Lire(M);
      Lire(O);
      Calcul(M, O);
   end;
end;
