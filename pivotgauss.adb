with P_Esiut; use P_Esiut;
with P_Pivot; use P_Pivot;
with P_Matrice; use P_Matrice;

procedure Pivotgauss is
   N, P : Positive;
begin
   Dimension(N, P);
   A_La_Ligne;
   declare
      M : TV_Str(1..N, 1..P);
      O : TV_Ord(1..P-1);
   begin
      Lire(M);
      A_La_Ligne;
      Lire(O);
      AfficheTout(M, O);
      Calcul(M, O);
      AfficheTout(M, O);
   end;
end;