with P_Esiut; use P_Esiut;
with P_Matrice; use P_Matrice;

procedure PivotGauss is
   N, P : Positive;
begin
   --Dimension(N, P);
   --A_La_Ligne;
   declare
      --M : TV_Str(1..N, 1..P);
      --O : TV_Ord(1..P-1);
      M : TV_Str(1..3, 1..4) := ((" 3                  ", " 5                  ", " 2                  ", " 3                  "),
				 (" 6                  ", " 10                 ", " 6                  ", " 2                  "),
				 ("-1                  ", "-5/3                ", " 10/3               ", " 1                  "));
      O : TV_Ord(1..3) := ('x', 'y', 'z');
   begin
      --Lire(M);
      --A_La_Ligne;
      --Lire(O);
      Calcul(M, O);
   end;
end;
