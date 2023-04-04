import { FC } from 'react'
import Banner from './Banner';
import Nav from './Nav';

const Header: FC = ({ children }) => {
    return (
        <div className="Header">
            <Nav />
            <Banner />
            {
                children && (
                    <div className="children">
                        {children}
                    </div>
                )
            }
        </div>
    )
}

export default Header;