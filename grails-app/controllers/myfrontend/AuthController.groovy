package myfrontend

import grails.converters.JSON
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.web.servlet.support.RequestContextUtils

class AuthController {
    def authService

    def index() {
        if (!session.lang) {
            def localeList = Lang.findAll().shortLocale
            def lang = LocaleContextHolder.getLocale().getLanguage();
            lang = (lang == 'uk') ? 'ua' : lang

            if (lang in localeList) {
                session.lang = session?.lang ?: lang
            } else {
                session.lang = 'en';
            }
            LocaleContextHolder.setLocale(new Locale(session.lang))
            RequestContextUtils.getLocaleResolver(request).setLocale(request, response, new Locale(session.lang))
        }
    }

    def lang() {
        String targetUri = params.targetUri ? params.targetUri : "/"
        session.lang = params.lang ?: session.lang
        LocaleContextHolder.setLocale(new Locale(session.lang))
        RequestContextUtils.getLocaleResolver(request).setLocale(request, response, new Locale(session.lang))
        redirect(uri: targetUri, params: params)
    }

    def registration() {
        render(template: 'templates/registration')
    }

    def login(){
        render(template: 'templates/login')
    }

    def doLogin(LoginCommand lC){
        if(lC.validate() && authService.checkLogin(lC.login, lC.password)){
            render "OK"
        } else {
            render([errors: lC.errors.allErrors ] as JSON)
        }
    }

    def register(RegistrationCommand rC) {
        if(rC.validate()){
            render "OK"
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
