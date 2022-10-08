//util class to map numbers to words
class NumbersToWords {
    public static String oneDigit(int n) {
        switch (n) {
            case 0: return "zero";
            case 1: return "one";
            case 2: return "two";
            case 3: return "three";
            case 4: return "four";
            case 5: return "five";
            case 6: return "six";
            case 7: return "seven";
            case 8: return "eight";
            case 9: return "nine";
        }
        return "";
    }

    public static String literals(int n) {
        switch (n) {
            case 10: return "ten";
            case 11: return "eleven";
            case 12: return "twelve";
            case 13: return "thirteen";
            case 14: return "fourteen";
            case 15: return "fifteen";
            case 16: return "sixteen";
            case 17: return "seventeen";
            case 18: return "eighteen";
            case 19: return "nineteen";
        }
        return "";
    }

    public static String multiplesOfTen(int n) {
        switch (n) {
            case 10: return "ten";
            case 20: return "twenty";
            case 30: return "thirty";
            case 40: return "forty";
            case 50: return "fifty";
            case 60: return "sixty";
            case 70: return "seventy";
            case 80: return "eighty";
            case 90: return "ninety";
        }
        return "";
    }

    public static String shortScale(int n) {
        switch(n) {
            case 0: return "";
            case 1: return "thousand";
            case 2: return "million";
            case 3: return "billion";
            case 4: return "trillion";
            case 5: return "quadrillion";
            case 6: return "quintillion";
            case 7: return "sextillion";
            case 8: return "septillion";
            case 9: return "octillion";
        }
        return "";
    }
}

//tamaras abstraktion
class Paket {
    private int a;
    private int b;
    private int c;

    public Paket(int a, int b, int c){
        this.a = a;
        this.b = b;
        this.c = c;
    }

    public int getValue() {
        return a*100 + b*10 + c;
    }

    public String getBandCString(){
        if(c == 0 && b == 0) return "";
        if(c == 0) return NumbersToWords.multiplesOfTen(b*10);
        if(b == 0) return NumbersToWords.oneDigit(c);
        if(b * 10 + c < 20) return NumbersToWords.literals(b*10 + c);
        return NumbersToWords.multiplesOfTen(b*10) + "-" + NumbersToWords.oneDigit(c);
    }

    public String toString() {
        String result;

        if(a == 0) {
            return getBandCString();
        }
        if( a != 0 && b == 0 && c == 0) {
            return NumbersToWords.oneDigit(a) + " hundred";
        }
        return NumbersToWords.oneDigit(a) + " hundred " + getBandCString();
    }
}

class Nummer {
    private Paket[] packete;

    public Nummer(Paket[] packete){
        this.packete = packete;
    }

    @Override
    public String toString(){
        String result = "";

        for (int i = packete.length - 1; i >= 0; i--) {

            int shortScaleIndex = packete.length - (i + 1);

            if(shortScaleIndex == 0){
                if(packete.length > 1){
                    result = " and ";
                }

                result += packete[i].toString();
            }

            if(shortScaleIndex > 0 && i > 0){
                // not first, or last
                result = " and " + packete[i].toString() + NumbersToWords.shortScale(shortScaleIndex) + result;
            }

            if(i == 0){
                // last
                result = packete[i].toString() + " " + NumbersToWords.shortScale(shortScaleIndex) + result;
            }
        
        }
        return result;
    }
}

//test
class Tamara {
    public static void main(String[] args) {
        //test Nummer
        Paket[] packete = new Paket[3];
        packete[0] = new Paket(1, 2, 3);
        packete[1] = new Paket(4, 5, 6);
        packete[2] = new Paket(7, 8, 9);

        Nummer nummer = new Nummer(packete);

        System.out.println(nummer.toString());

    }
}