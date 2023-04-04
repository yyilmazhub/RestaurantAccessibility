import { ITagCategoryInput } from "./tagCategory"

export interface ITagInput {
    id: string
    name: string
    icon: string
    category: ITagCategoryInput['id']
    operation?: 'and' | 'or'
}

export interface IRestaurantInput {
    id: string
    name: string
    link: string
    category: string
    address: string
    longitude: number
    latitude: number 
    images: string
    price: number
    rate: number
    tags: ITagInput[]
}