const Card = ({movie: 
    title, 
    vote_avarege, 
    poster_path, 
    release_date, 
    original_language
}) => {
    return(
        <div className='card'>
            <p className="text-white">{title}</p>
            <img src={poster_path?`https://image.tmdb.org/t/p/w500/${poster_path}`: `/filme-indisponivel.png`} alt={title} />
            <div className="mt-4">
                <h3>{title}</h3>
                <div className="content">
                    <div className="rating">
                        <img src="estrela.svg" alt="rate" />
                        <p>{vote_avarege? vote_avarege.toFixed(1): 'N/D'}</p>
                    </div>
                <span>•</span>
                <p className="lang">{original_language}</p>
                <span>•</span>
                <p className="year">{release_date? new Date(release_date).getFullYear(): 'N/D'}</p>
                </div>
            </div>
        </div>
    )
}
export default Card;