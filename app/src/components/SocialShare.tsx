import { VFC } from 'react'


interface ISocialShareProps {
    social: 'twitter' | 'facebook'
    link: string
    text?: string
}

const SocialShare: VFC<ISocialShareProps> = ({ social, text, link }) => {

    const socials = {
        twitter: {
            name: 'Twitter',
            link: `https://twitter.com/intent/tweet?text=${text}&url=${link}`,
            color: '#1DA1F2',
        },
        facebook: {
            name: 'Facebook',
            link: `https://www.facebook.com/sharer/sharer.php?u=${link}`,
            color: '#3b5998',
        }
    }

    return (
        <a href={socials[social].link} target="_blank" rel="noopener noreferrer" style={{ backgroundColor: socials[social].color }} className="socialShare">
            Partager sur {socials[social].name}
        </a>
    )
}

export default SocialShare