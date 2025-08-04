import { useEffect, useState } from 'react'
import './App.css'
import Buscar from './component/Buscar.jsx'
 
const Cartao = ({título}) => {
  const [curtiu, setCurtiu] = useState(false);
  const [contagem, setContagem] = useState(0);
  useEffect(()=>{
    console.log(`${título} foi curtido: ${curtiu}`);
  }, [curtiu]);
  return(
    <div className="text-3xl underline text-red-500" onClick={()=>setContagem(contagem + 1)}>
      <h2>{título}</h2>
      <h2>{contagem}</h2>
      <button onClick={()=>setCurtiu(!curtiu)}>
        {curtiu? "❤️" : "🤍"}
      </button>
    </div>
  )
}
 
const App = () => {
  const [termoBusca, setTermoBusca] = useState("");
  const API_TOKEN = import.meta.env.VITE_TMDB_API_TOKEN;
  const API_URL_BASE=''
  const API_OPTION = {
    method: 'GET',
    headers: {
      accept: 'application/json',
      Authorization: `Bearer ${API_TOKEN}`,
    }
  }
  const [errorMenssage, setErrorMenssage] = useState("");
  const fetchMovies = async () => {
    try{
      const endpoint = `${API_URL_BASE}/discover/movie?sort_by=popularity.desc`;
      const response = await fetch(endpoint, API_OPTION);
      if (!response.ok) {
        throw new Error(`Erro na requisição.`);
      }
      const data = await response.json();
    }
    catch (error) {
      console.error(`Erro ao buscar filmes: ${error}`);
      setErrorMenssage("Erro ao buscar filmes. Tente novamente mais tarde.");
    }
  }
  useEffect(() => {
    fetchMovies();
  },[]);
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
          {/* <h2>Componente Funcional</h2>
          <Cartao título="Adão Negro"/>
          <Cartao título="Vingadores: Ultimato"/>
          <Cartao título="Homens de preto"/>  */}
          <Buscar termoBusca={termoBusca} setTermoBusca={setTermoBusca}/>
          <h1 className='text-white'>{termoBusca}</h1>
          <section className='all-movies'>
            <h2>Todos os filmes</h2>
            {errorMenssage && <p className='text-red-500'>{errorMenssage}</p>}
          </section>
      </div>
    </main>
 
 
  )
}
 
export default App