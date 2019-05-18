with P_Esiut; use P_Esiut;
with P_String; use P_String;
with P_Math; use P_Math;

package P_Matrix is
   
   type TV_Str is array(Integer range <>, Integer range <>) of T_Str;
   type TV_Ord is array(Integer range <>) of Character;
   
   -- Infos --
   function Trisup(Mat : in TV_Str) return Boolean;
   function Diago(Mat : in TV_Str) return Boolean;
   function LVide(Mat : in TV_Str; L : in positive) return Boolean;
   function Max(Mat : in TV_Str) return Integer;
   
   -- Traitement lignes/colonnes --
   procedure Switch_L(Mat : out TV_Str; L1, L2 : in Positive);
   procedure Switch_C(Mat : out TV_Str; C1, C2 : in Positive; Ord : out TV_Ord);
   
   -- Calcul / Opérations --
   procedure CalcStr(Cible : out T_Str; Pivot, Coef : in String);
   procedure GetCand(Mat : out TV_Str; Piv : in Positive; Ord : out TV_Ord);
   procedure DoPivot(Mat : out TV_Str; Piv : in positive);
   procedure Calcul(Mat : out TV_Str; Ord : out TV_Ord);
   
   -- Affichages --
   procedure Dimension(N, P : out Positive);
   procedure Lire(Mat : out TV_Str);   
   procedure Lire(Ord : out TV_Ord);
   procedure AfficheEtapes(Coef : in String; I, Piv : in positive);
   procedure AfficheTout(Mat : in TV_Str; Ord : in TV_Ord);
   procedure Affiche(Mat : in TV_Str);
   procedure Affiche(Ord : in TV_Ord);
   
end;
