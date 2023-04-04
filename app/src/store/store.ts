import { createContext } from 'react'
import { RestaurantManager } from "./models/restaurants"

export const Store = {
    restaurantManager: new RestaurantManager()
}

export const GlobalStore = createContext(Store)