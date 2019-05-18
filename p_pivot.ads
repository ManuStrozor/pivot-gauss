with P_Esiut; use P_Esiut;
with P_String; use P_String;
with P_Matrice; use P_Matrice;

package P_Pivot is
   
   procedure Calcul(Mat : out TV_Str; Ord : out TV_Ord);
   
   procedure Dimension(N, P : out Positive);
   
   procedure Lire(Mat : out TV_Str);
   
   procedure Lire(Ord : out TV_Ord);
   
end;
