import { useEffect, useState } from 'react'
import './App.css'
import Search from './component/Seach.jsx'
import Spinner from './component/Spinner.jsx';
import Card from './component/Card.jsx'
 
const App = () => {
  const [termSeach, setTermSeach] = useState("");
  const [errorMenssage, setErrorMenssage] = useState("");
  const [movieList, setMovieList] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const API_TOKEN = import.meta.env.VITE_TMDB_API_TOKEN;
  const API_URL_BASE=''
  const API_OPTION = {
    method: 'GET',
    headers: {
      accept: 'application/json',
      Authorization: `Bearer ${API_TOKEN}`,
    }
  }
  const fetchMovies = async () => {
    setIsLoading(true);
    setErrorMenssage("");
    try{
      const endpoint = `${API_URL_BASE}/discover/movie?sort_by=popularity.desc`;
      const response = await fetch(endpoint, API_OPTION);
      if (!response.ok) {
        throw new Error(`Erro na requisição.`);
      }
      const data = await response.json();

      if (data.Response == 'false') {
        setErrorMenssage(data.Error || "Falha ao buscar filmes.");
        setMovieList([]);
      }
    }
    catch (error) {
      console.error(`Erro ao buscar filmes: ${error}`);
      setErrorMenssage("Erro ao buscar filmes. Tente novamente mais tarde.");
    }
  }
  useEffect(() => {
    fetchMovies();
  }, [])
  return(
    <main>
      <div className='pattern'></div>
      <div className="wrapper">
        <header>
          <img src="./hero.png" alt="Banner do Herói" />
          <h1>
            Encontre Os <span className="text-gradient">Filmes</span> Que Você Vai Gostar
          </h1>
        </header>   
          <Search termSeach={termSeach} setTermSeach={setTermSeach}/>
          <h1 className='text-white'>{termSeach}</h1>
          <section className='all-movies'>
            <h2>Todos os filmes</h2>
            {isLoading ? /* Operador "Elvis" (operador de verdadeiro ou falso) */ (  ///Verifica se o isLoading é verdadeiro, se sim, exibe a mensagem de carregamento
                <Spinner/>
              ): errorMenssage ?(
                <p className='text-red-500'>{errorMenssage}</p>
              ):(
              <ul>{
                movieList.map((movie) => (
                  <Card movie={movie}/>
                ))
              }
              </ul>
              )
            }
          </section>
      </div>
    </main>
 
  )
}
 
export default App