import { VFC } from 'react'
import {Link} from 'react-router-dom'

const Nav: VFC = () => {
    return(
        <nav className="Nav">
            <Link className="title" to="/">
                {/* <i className="lni lni-dinner"></i>  
                <h1>Rest'<span className="green-text">egal</span></h1> */}
                <img src="/logo.jpeg" width="150px"  alt="" />
            </Link>
            <div className="connect">
                {/* <Link to="/login">Connexion</Link> */}
                <Link to="/register" className="active">Inscription</Link>
            </div> 
        </nav>
    )
}

export default Nav;