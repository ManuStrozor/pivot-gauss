with P_Esiut; use P_Esiut;

package P_Str is
   
   subtype T_Str is String(1..20);
   
   type TV_Ord is array(Integer range <>) of Character;
   type TV_Str is array(Integer range <>, Integer range <>) of T_Str;
   
   function Oppose(S : in String) return String;
   function Trim(S : in String) return String;
   function Isint(Exp : in Float) return Boolean;
   function Pgcd(A,B : Integer) return Integer;
   function Simp(I1, I2 : in Integer) return String;
   function GetCoef(N, D : in String) return T_Str;
   function Slash(Str : in String) return Integer;
   function Num(Str : in String) return Integer;
   function Denum(Str : in String) return Integer;
   function Floaty(Str : in String) return Float;
   function Sum(Mat : in TV_Str; L : in positive) return Float;
   function Diago(Mat : in TV_Str) return Boolean;
   function Homo(Mat : in TV_Str) return Boolean;
   function Trisup(Mat : in TV_Str) return boolean;
   function Nbc(Mat : in TV_Str) return Positive;
   function Nbl(Mat : in TV_Str) return Positive;
   function Strlen(Str : in String) return Integer;
   function Max(Mat : in TV_Str) return Integer;
   procedure Switch_L(Mat : out TV_Str; L1, L2 : in Positive);
   procedure Switch_C(Mat : out TV_Str; C1, C2 : in Positive; Ord : out TV_Ord);
   procedure GetCand(Mat : out TV_Str; Piv : in Positive; Ord : out TV_Ord);
   procedure CalcStr(Cible : out T_Str; Pivot, Coef : in String);
   procedure DoPivot(Mat : out TV_Str; Piv : in positive);
   procedure Calcul(Mat : out TV_Str; Ord : out TV_Ord);
   procedure Lire(Mat : out TV_Str);
   procedure Lire(Ord : out TV_Ord);
   procedure Dimension(N, P : out Positive);
   procedure AfficheEtapes(Coef : in String; I, Piv : in positive);
   procedure AfficheTout(Mat : in TV_Str; Ord : in TV_Ord);
   procedure Affiche(Ord : in TV_Ord);
   procedure Affiche(Mat : in TV_Str);
   
end;
