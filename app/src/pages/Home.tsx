import { useEffect, useState, VFC } from 'react'
import Category from '../components/Category'
import CriteriaBar from '../components/CriteriaBar'
import Header from '../components/Header'

const HomePage: VFC = () => {

    const [criterias, setCriterias] = useState<any[]>([])

    useEffect(() => {
        fetch('/api/tagsandcategories').then(res => res.json()).then(data => {
            setCriterias(data.map((d: any) => ({
                label: d.name,
                onHomepage: d.onHomepage,
                options: Object.values(d.tags).map(t => ({
                    ...t as Object,
                    category: d.id,
                    // @ts-ignore
                    label: t.name,
                    // @ts-ignore
                    value: t.id
                }))
            })))
        })
    }, [])


    return (
        <div>
            <Header>
                <CriteriaBar criterias={criterias} />
            </Header>
            <div className="conceptCaption">
                <div className="conceptContent">
                    <h2>Le concept Rest'<span className="green-text">egal</span></h2>
                    <p><b>Rest’Egal</b> est une application vous permettant de trouver <b>facilement</b>, <b>rapidement</b> et avec certitude un restaurant adapté selon certains critères <b>d’accessibilité</b> et/ou de <b>régimes alimentaires</b>.</p>
                    <h3>Ca n'a jamais été aussi <span className="green-text">simple</span> de trouver un restaurant selon <span className="green-text">vos critères !</span></h3>
                    <p>Pour trouver un restaurant disponible selon <b>vos envies ou besoins</b> près de chez vous c’est très simple : vous entrez simplement votre <b>localisation</b> ainsi que vos différents <b>critères d’accessibilités et habitudes alimentaires</b>, et vous envoyez la requête ! Notre algorithme vous retournera des résultats pouvant subvenir à <b>vos besoins</b>.</p>
                </div>

                <div className="conceptImage">
                    <img src="./conceptImage.jpeg" alt="image concept" width="100%" />
                </div>
            </div>
            {
                criterias && criterias
                    .filter(c => c.onHomepage)
                    .map(category => (
                        <>
                            <h3 className="criteria_title">Vos critères - <span style={{ color: "#406343" }}>{category.label}</span></h3>
                            <div className="categories">
                                {category.options
                                    .slice(0, 5)
                                    .map((t: any) => (
                                        <Category key={t.id} name={t.label} id={t.id} image={t.image} />
                                    ))}
                            </div>
                        </>
                    ))
            }
        </div>
    )
}

export default HomePage