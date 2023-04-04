import React, { useState } from 'react';
import Axios from 'axios';

import { useForm, SubmitHandler } from 'react-hook-form';
import { useNavigate } from 'react-router';
import Header from '../components/Header';

type Inputs = {
  email: string,
  password: string,
};


const RegisterForm = () => {
  const navigate = useNavigate();
  const [message, setMessage] = useState("");
  const [colorMessage, setColorMessage] = useState("");
  const url = '/api/register'
  const { register, handleSubmit, formState: { errors } } = useForm<Inputs>();
  const onSubmit: SubmitHandler<Inputs> = data => {
    Axios.post(url,data).then(res => {
      setMessage("Bravo, votre compte a bien été créé ! vous pouvez désormais vous connecter.")
      setColorMessage("green");
    }).catch(() => {
      setMessage("Cette adresse email est déjà utilisée pour un autre utilisateur.")
      setColorMessage("red");
    })
  }

  return (
    <div>
        <Header />
        <div  className="container-form">
          <div className="form">
            <h1>Rejoignez la communauté Rest'<span className="green-text">egal</span></h1>
            <form onSubmit={handleSubmit(onSubmit)} className="RegisterForm">
              <label htmlFor="email">Adresse e-mail</label>
              <input {...register("email", { required: 'Ce champs est obligatoire.', pattern: {value: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: "Ce n'est pas une adresse email correcte."}})} placeholder="Entrez votre adresse email"/>
              {errors.email && <span className="form-error">{errors.email.message}</span>}
              
              <label htmlFor="password">Mot de passe</label>
              <input type="password" {...register("password", { required: 'Ce champs est obligatoire.', minLength: {value: 5, message: "Votre mot de passe doit contenir au moins 5 caractères."} })} placeholder="Créez votre mot de passe"/>
              {errors.password && <span className="form-error">{errors.password.message}</span>}
              <p className="error_register" style={{color: colorMessage}}>{message}</p>
              
              <input type="submit" value="S'inscrire"/>
              <div className="footer-auth">
                <a href="../login">J'ai déjà un compte ?</a>
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

export default RegisterForm;