import { VFC } from 'react'

import Tag from './Tag'

import { IRestaurantInput } from '../interfaces/restaurant'
import { Link } from 'react-router-dom'



const RestaurantCard: VFC<IRestaurantInput> = ({ id, name, address, rate, images, link, tags }) => {
    return (
        <Link to={`/search/${id}`} className="restaurantCard">
            <img className="restaurantImage" src={images} alt={name} />
            <div className="restaurantInfo">
                <div>
                    <h2 className="restaurantName">{name}</h2>
                    <address>
                        <p className="restaurantAddress">
                            {address}
                        </p>
                    </address>
                </div>
                <h4 className="restaurantRate">
                    {rate}
                </h4>
                <div className="tagsContainer">
                    {
                        tags?.map(tag => <Tag key={tag.id} name={tag.name} icon={tag.icon} />)
                    }
                </div>
            </div>
        </Link>
    )
}

export default RestaurantCard