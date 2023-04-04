import React from 'react';
import { useForm, SubmitHandler } from 'react-hook-form';
import Header from '../components/Header';

type Inputs = {
  email: string,
  password: string,
};

const LoginForm = () => {
  const { register, handleSubmit, watch, formState: { errors } } = useForm<Inputs>();
  const onSubmit: SubmitHandler<Inputs> = data => console.log(data);

  // console.log(watch("email")) // watch input value by passing the name of it

  return (
    <div>
        <Header />
        <div  className="container-form">
          <div className="form">
            <h1>Connectez-vous sur Rest'<span className="green-text">egal</span></h1>
            <form onSubmit={handleSubmit(onSubmit)} className="RegisterForm">
              <label htmlFor="email">Adresse e-mail</label>
              <input {...register("email", { required: 'Ce champs est obligatoire.', pattern: {value: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: "Ce n'est pas une adresse email correcte."}})} placeholder="Entrez votre adresse email"/>
              {errors.email && <span className="form-error">{errors.email.message}</span>}
              
              <label htmlFor="password">Mot de passe</label>
              <input type="password" {...register("password", { required: 'Ce champs est obligatoire.', minLength: {value: 5, message: "Votre mot de passe doit contenir au moins 5 caractères."} })} placeholder="Créez votre mot de passe"/>
              {errors.password && <span className="form-error">{errors.password.message}</span>}
              
              <input type="submit" value="Se connecter"/>
              <div className="footer-auth">
                <a href="../register">Créer un compte</a> | <a href="">Mot de passe oublié ?</a>
              </div>
            </form>
          </div>
          <div className="img-form">
            <img src="/register.jpeg" alt="" width="100%"/>
          </div>
        </div>
    </div>

  );
};

export default LoginForm;