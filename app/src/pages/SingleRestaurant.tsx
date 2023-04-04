import { Icon } from "leaflet";
import { observer } from 'mobx-react';
import { useContext, useEffect, useState, VFC } from 'react';
import { MapContainer, Marker, Popup, TileLayer } from 'react-leaflet';
import { useNavigate, useParams } from 'react-router';
import Header from '../components/Header';
import SocialShare from "../components/SocialShare";
import Tag from '../components/Tag';
import { GlobalStore } from '../store/store';

const SingleRestaurant: VFC = () => {
  const navigate = useNavigate();
  const { id } = useParams();
  const { restaurantManager } = useContext(GlobalStore)
  const [position, setPosition] = useState({ latitude: 0, longitude: 0 })
  const restaurant = restaurantManager.getRestaurantById(id)

  useEffect(() => {
    getUserLocation()
  }, [id])

  const pizza = new Icon({
    iconUrl: "/pizza.png",
    iconSize: [45, 45]
  });

  function backPrevious() {
    navigate('../search');
  }

  const getUserLocation = () => {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(position => {
        const { latitude, longitude } = position.coords;
        setPosition({ latitude, longitude })
      })
    }
  }

  const goToRoute = () => {
    let restaurantDirection = restaurant?.address
    if (restaurant?.longitude && restaurant?.latitude) {
      restaurantDirection = `${restaurant.latitude},${restaurant.longitude}`
    }

    window.open(`https://www.google.com/maps/dir/${position.latitude},${position.longitude}/${restaurantDirection}`)
  }

  if (!restaurant) {
    return (
      <div>
        <Header />
        <div className="restaurantNotFound">
          <p>Désolé mais le restaurant n'a pas été trouvé.</p>
          <button onClick={backPrevious}>Revenir au résultat de la recherche</button>
        </div>
      </div>
    )
  }

  return (
    <div>
      <Header />
      <div className="SingleRestaurant">
        <div className="singleRestContent">
          <div className="singleRestTitle">
            <h1>{restaurant?.name}</h1>
            <p className='singleRestRate'>{restaurant?.rate}</p>
          </div>

          <div className="socialContainer">
            <SocialShare text={`${restaurant.name} sur Rest'egal ${restaurant?.tags.map(t => t.icon).join('')} `} social='twitter' link={window.location.toString()} />
            <SocialShare text={`${restaurant.name} sur Rest'egal ${restaurant?.tags.map(t => t.icon).join('')} `} social='facebook' link={window.location.toString()} />
          </div>

          <div className="tagsContainer">
            {
              restaurant?.tags.map(tag => <Tag key={tag.id} name={tag.name} icon={tag.icon} />)
            }
          </div>
          <p className="singleRestAddress">{restaurant?.address}</p>
          <img className="singleRestPicture" src={restaurant?.images} alt="bannière restaurant" />
        </div>
        <div className="singleRestMap">
          <div className="mapButtons">
            <a href={restaurant?.link} className="mapButton" target="_blank" rel="noopener noreferrer">Réserver</a>
            <button onClick={goToRoute} disabled={!(position.latitude && position.longitude)} className="mapButton" title={!(position.latitude && position.longitude) ? 'La géolocalisation doit être autorisée' : ''}>
              M'y rendre
            </button>
          </div>
          <MapContainer center={[restaurant?.latitude || 0, restaurant?.longitude || 0]} zoom={13} className="carte">
            <TileLayer
              attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
              url="http://b.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"
            />

            {
              position && (
                <Marker position={[position.latitude || 0, position.longitude || 0]}>
                  <Popup>
                    Vous êtes ici
                  </Popup>
                </Marker>
              )
            }
            <Marker position={[restaurant?.latitude || 0, restaurant?.longitude || 0]} icon={pizza}>
              <Popup>
                <b>{restaurant?.name}</b><br />{restaurant?.address}
              </Popup>
            </Marker>

          </MapContainer>
        </div>
      </div>
    </div>
  );
}

export default observer(SingleRestaurant);