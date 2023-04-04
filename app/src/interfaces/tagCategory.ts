export interface ITagCategoryInput {
  id: string
  name: string
  order?: number
  operation?: 'or' | 'and'
}