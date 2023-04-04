import { observer } from 'mobx-react'
import { useContext, useState, VFC } from 'react'
import Header from '../components/Header'
import Accordeon from '../components/Accordeon'
import RestaurantCard from '../components/RestaurantCard'

import { GlobalStore } from '../store/store'
import { ITagInput } from '../interfaces/restaurant'
import { useEffect } from 'react'

const SearchPage: VFC = () => {
    const { restaurantManager } = useContext(GlobalStore)
    const [availableTags, setAvailableTags] = useState([])
    const [selectedTags, setSelectedTags] = useState<ITagInput[]>([])
    const [searchLocation, setSearchLocation] = useState('')

    useEffect(() => {
        fetch('/api/tagsandcategories').then(res => res.json()).then(data => {
            setAvailableTags(data.map((d: any) => ({
                ...d,
                tags: Object.values(d.tags).map(t => ({
                    ...t as Object,
                    operation: d.operation,
                    category: d.id
                }))
            })))
        })
    }, [])

    useEffect(() => {
        if (window && availableTags) {
            const params = new URLSearchParams(window.location.search)
            const urlSelectedTags: ITagInput[] = []
            params.getAll('tags').toString().split(',').forEach(selectedTag => {
                const tag = availableTags.map((c: any) => c.tags).flat().find(t => t.id === parseInt(selectedTag))
                if (tag) {
                    urlSelectedTags.push(tag)
                }
            })

            // @ts-ignore
            params.get('location') && setSearchLocation(params.get('location'))

            setSelectedTags(urlSelectedTags)
        }
    }, [availableTags])

    return (
        <div>
            <Header />

            <div className="searchContent">
                <div className="accordeons">
                    <Accordeon title="Filtrer les restaurants" availableTags={availableTags} setSelectedTags={setSelectedTags} selectedTags={selectedTags} resultsLength={restaurantManager.getRestaurantsByTagsAndLocation(selectedTags, searchLocation).length} />
                </div>
                <div className="restaurantCardsContainer">
                    {
                        restaurantManager.getRestaurantsByTagsAndLocation(selectedTags, searchLocation).length > 0 ? restaurantManager.getRestaurantsByTagsAndLocation(selectedTags, searchLocation).map(restaurant => (
                            <RestaurantCard
                                key={restaurant.id}
                                id={restaurant.id}
                                category={restaurant.category}
                                name={restaurant.name}
                                address={restaurant.address}
                                longitude={restaurant.longitude}
                                latitude={restaurant.latitude}
                                rate={restaurant.rate}
                                images={restaurant.images}
                                link={restaurant.link}
                                tags={restaurant.tags}
                                price={0} />
                        ))
                            :
                            <div className="notResults">
                                <h3>Aucun restaurant ne correspond à vos critères de recherche.</h3>
                            </div>
                    }
                </div>
            </div>
        </div>
    )
}

export default observer(SearchPage)