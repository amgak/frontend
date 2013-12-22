package myfrontend

class AuthService {

    def serviceMethod() {

    }

    def checkLogin(String login, String password){
        return (login.equals('wasia') && password.equals("qwerty"))
    }
}
