import { VFC } from 'react'

interface ITagProps {
    icon: string
    name: string
}

const Tag: VFC<ITagProps> = ({ icon, name }) => (
    <div className="tag">
        <span>{icon}</span>
        <p>{name}</p>
    </div>
)

export default Tag