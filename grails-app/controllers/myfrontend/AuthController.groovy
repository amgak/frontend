package myfrontend

class AuthController {

    def index() {
        redirect(action: 'registration')
    }

    def registration() {

    }

    def login(){
    }

    def register() {
        render "register"
    }


    class registrationCommand{
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
            password size: 1..20;
            repeatPassword validator: { val, obj -> val.equals(obj.password)}
            mobile: matches: "[0-9]{13}"
            mail: email:true
        }

    }
}
