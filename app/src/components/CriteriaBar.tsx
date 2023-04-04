import { useState, VFC } from 'react'
import { Link } from 'react-router-dom'
import Select, { MultiValue } from 'react-select'

interface ICriteriaBarProps {
    criterias?: any[]
}

const CriteriaBar: VFC<ICriteriaBarProps> = ({ criterias }) => {

    const [search, setSearch] = useState<{
        location: string,
        criterias: MultiValue<{ value: string; label: string; }>
    }>({
        location: '',
        criterias: []
    })

    const locationChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setSearch({
            ...search,
            location: e.target.value,
        })
    }

    const criteriasChange = (newValue: MultiValue<{ value: string; label: string; }>) => {
        console.log(newValue)
        setSearch({
            ...search,
            criterias: newValue
        })
    }

    return (
        <div className="SearchBar">
            <div className="searchItem">
                <span className="searchTitle">
                    Localisation
                </span>
                <input type="text" placeholder="Entrez votre adresse" onChange={locationChange} />
            </div>
            <div className="searchItem">
                <span className="searchTitle">
                    Critères
                </span>
                {/* @ts-ignore */}
                <Select className="select_criteria" placeholder="Sélectionnez vos critères" options={criterias} isMulti onChange={criteriasChange} />
            </div>
            {/* @ts-ignore */}
            <Link className="searchBtn" to={`/search?tags=${search.criterias.map(c => c.id)}?location=${search.location}`}>
                <i className="lni lni-search-alt"></i>
            </Link>
        </div>
    )
}

export default CriteriaBar