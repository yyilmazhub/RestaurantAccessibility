import { makeAutoObservable, runInAction } from "mobx";
import { IRestaurantInput, ITagInput } from "../../interfaces/restaurant";
import { ITagCategoryInput } from "../../interfaces/tagCategory";

export class Restaurant {
    _id: IRestaurantInput['id']
    _name: IRestaurantInput['name']
    _link: IRestaurantInput['link']
    _category: IRestaurantInput['category']
    _address: IRestaurantInput['address']
    _longitude: IRestaurantInput['longitude']
    _latitude: IRestaurantInput['latitude']
    _images: IRestaurantInput['images']
    _price: IRestaurantInput['price']
    _rate: IRestaurantInput['rate']
    _tags: IRestaurantInput['tags']

    constructor({ id, name, link, category, address, longitude, latitude, images, price, rate, tags }: IRestaurantInput) {
        makeAutoObservable(this)
        this._id = id
        this._name = name
        this._link = link
        this._category = category
        this._address = address
        this._longitude = longitude
        this._latitude = latitude
        this._images = images
        this._price = price
        this._rate = rate
        this._tags = tags
    }

    get id() {
        return this._id
    }

    set id(value) {
        this._id = value
    }

    get name() {
        return this._name
    }

    set name(value) {
        this._name = value
    }

    get link() {
        return this._link
    }

    set link(value) {
        this._link = value
    }

    get category() {
        return this._category
    }

    set category(value) {
        this._category = value
    }

    get address() {
        return this._address
    }

    set address(value) {
        this._address = value
    }

    get longitude() {
        return this._longitude
    }

    set longitude(value) {
        this._longitude = value
    }

    get latitude() {
        return this._latitude
    }

    set latitude(value) {
        this._latitude = value
    }

    get images() {
        return this._images
    }

    set images(value) {
        this._images = value
    }

    get price() {
        return this._price
    }

    set rate(value) {
        this._rate = value
    }

    get rate() {
        return this._rate
    }

    set price(value) {
        this._price = value
    }

    set tags(value) {
        this._tags = value
    }

    get tags() {
        return this._tags
    }

}

export class TagCategory {
    _id: ITagCategoryInput['id']
    _name: ITagCategoryInput['name']
    _order: ITagCategoryInput['order']
    _operation: ITagCategoryInput['operation']


    constructor({ id, name, order, operation }: ITagCategoryInput) {
        makeAutoObservable(this)
        this._id = id
        this._name = name
        this._order = order
        this._operation = operation
    }

    get id() {
        return this._id
    }

    set id(value) {
        this._id = value
    }

    get name() {
        return this._name
    }

    set name(value) {
        this._name = value
    }

    get order() {
        return this._order
    }

    set order(value) {
        this._order = value
    }

    get operation() {
        return this._operation
    }

    set operation(value) {
        this._operation = value
    }

}

export class RestaurantManager {
    _restaurants: Restaurant[] = []

    constructor() {
        makeAutoObservable(this)
        this.fetchRestaurants()
    }

    async fetchRestaurants(): Promise<void> {
        const data = await fetch('/api/restaurants')
            .then(response => response.json())

        console.log(data);
        runInAction(() => {
            this._restaurants = data.map(({ id, name, link, category, address, longitude, latitude, images, price, rate, tags }: IRestaurantInput) => new Restaurant({ id, name, link, category, address, longitude, latitude, images, price, rate, tags }))
        })
    }

    getRestaurantById(id?: string): Restaurant | undefined {
        if (!id) {
            return undefined
        }
        return this._restaurants.find(restaurant => restaurant.id === id)
    }

    getRestaurantsByCategory(category: string): Restaurant[] {
        return this._restaurants.filter(restaurant => restaurant.category === category)
    }

    getRestaurantsByTagsAndLocation(tags: ITagInput[], location: string): Restaurant[] {
        const groupsTags: {
            category: string
            operation?: ITagInput['operation']
            tags: ITagInput['id'][]
        }[] = []

        tags.forEach(tag => {
            const groupTags = groupsTags.find(group => group.category === tag.category)
            if (!groupTags) {
                groupsTags.push({
                    category: tag.category,
                    operation: tag.operation ?? 'and',
                    tags: [tag.id]
                })
            }
            else {
                groupTags.tags.push(tag.id)
            }
        })

        if (tags.length > 0 || location) {
            return this.restaurants
                .filter(restaurant => {
                    if (location) {
                        return restaurant.address.toLowerCase().includes(location.toLowerCase())
                    }
                    else {
                        return true
                    }
                })
                .filter(restaurant => {
                    return groupsTags.every(({ tags, operation }) => {
                        if (operation === 'and') {
                            return tags.every((tagId: string) => restaurant.tags.some(restaurantTag => restaurantTag.id === tagId))
                        }
                        if (operation === 'or') {
                            return tags.some((tagId: string) => restaurant.tags.some(restaurantTag => restaurantTag.id === tagId))
                        }
                    })
                })
        }
        else {
            return this.restaurants
        }
    }

    get restaurants(): Restaurant[] {
        return this._restaurants
    }
}