package myfrontend

class Lang {

    Integer langId;
    String shortLocale;
    String fullLocale;

    static constraints = {
        langId nullable: false
        shortLocale nullable: false
        fullLocale nullable: false, unique: true
    }

    static mapping = {
        version false
    }

    @Override
    boolean equals(Object obj) {
        if (obj != null && obj instanceof Lang) {
            return fullLocale.equals(((Lang) obj).fullLocale)
        } else {
            return false
        }
    }
}
