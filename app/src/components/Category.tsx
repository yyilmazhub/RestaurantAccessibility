import { VFC } from 'react'
import { Link } from 'react-router-dom'

interface CategoryProps {
    name: string
    image: string
    id: number
}

const Category: VFC<CategoryProps> = ({ name, id, image }) => {
    return (
        <Link style={{background: `url('${process.env.PUBLIC_URL + image}')`,backgroundSize: "cover"}} className="Category" to={`/search?tags=${id}`}>
            <div className="text_category">
                <p className="category_name">{name}</p>
            </div>
        </Link>
    );
};

export default Category;