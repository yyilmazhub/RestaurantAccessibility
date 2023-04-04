import { VFC, useState, MouseEvent, FormEvent, useRef, useEffect } from 'react'
import { ITagInput } from '../interfaces/restaurant';


interface AccordeonProps {
    title: string
    setSelectedTags: (tags: ITagInput[]) => void
    selectedTags: ITagInput[]
    availableTags: any[]
    resultsLength: number
}

const Accordeon: VFC<AccordeonProps> = ({ title, setSelectedTags, selectedTags, availableTags, resultsLength = 0 }) => {

    const formRef = useRef(null)
    const [categories, setCategories] = useState<[{
        id: string
        name: string
        tags: ITagInput[]
    }]>()

    const [active, setActive] = useState(false)


    const handleToggle = (e: MouseEvent) => {
        setActive(!active)
    }

    const apply = (event: FormEvent<HTMLFormElement>) => {
        event.preventDefault()
        const selectedTags = new FormData(event.target as HTMLFormElement).getAll('tags') as string[]
        setSelectedTags(selectedTags.map(a => JSON.parse(a)))
    }

    const toggleTag = (e: React.ChangeEvent<HTMLInputElement>, tag: ITagInput) => {
        if (e.target.checked) {
            setSelectedTags([...selectedTags, tag])
        }
        else {
            setSelectedTags(selectedTags.filter(t => t.id !== tag.id))
        }
    }

    const resetTags = () => {
        setSelectedTags([])
    }

    return (
        <div className={`accordeon ${active && "active"}`}>
            <div className="accordeon_title" onClick={handleToggle}>
                {title}
                <span className="accordeon_icon"></span>
            </div>
            <div className="accordeon_content">
                <form onSubmit={apply} ref={formRef}>

                    {availableTags?.map(category => (
                        <div className="categorySection" key={category.id}>
                            <h4>{category.name}</h4>
                            <div className="tags_section">
                                {
                                    category.tags?.map((tag: any) => {
                                        const checked = !!selectedTags.find(s => s.id === tag.id)
                                        return (
                                            <label className="tag_filter" key={tag.id}>
                                                <input type="checkbox" name="tags" onChange={e => toggleTag(e, tag)} checked={checked} />
                                                {tag.icon + ' ' + tag.name}
                                            </label>
                                        )
                                    })
                                }
                            </div>
                        </div>
                    ))}

                    <p>
                        {resultsLength} restaurant{resultsLength > 1 ? 's' : ''} trouvé{resultsLength > 1 ? 's' : ''}
                    </p>

                    <div className="header_filter">
                        <button onClick={resetTags} className="button secondary">Réinitialiser</button>
                    </div>
                </form>

            </div>
        </div>
    );
};

export default Accordeon;