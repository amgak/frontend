package myfrontend

import grails.converters.JSON

class AuthController {
    def authService

    def index() {

    }

    def registration() {

    }

    def login(){
    }

    def dologin(LoginCommand lC){
        if (authService.checkLogin(lC.login, lC.password)){
            render "OK"
        } else {
            render "NOT OK"
        }

    }

    def register(RegistrationCommand rC) {
        if(rC.validate()){
            render "valid"
        } else {
            render([errors: rC.errors.allErrors ] as JSON)
        }
    }


    class RegistrationCommand{
        String login
        String password
        String repeatPassword
        String firstName
        String middleName
        String lastName
        String mobile
        String mail

        static constraints = {
            login blank: false, size: 1..20;
            password blank: false; size: 1..20;
            repeatPassword validator: { val, obj -> val.equals(obj.password)}
            mobile: blank: false; matches: "[0-9]{9,13}"
            mail: blank: false; email:true
        }

    }

    class LoginCommand{
        String login
        String password

        static constraints = {
            login blank: false, size: 1..20;
            password blank: false; size: 1..20;
        }

    }
}
