import { React, useState, useEffect } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './Liste.css'

function Liste (props) {

  const [article, setArticle] = useState("");

  const handleChangeArticle = (evt) => {
      setArticle(evt.target.value);
  
      const handleChangeArticle =(evt) => {
          setArticle(evt.target.value)
      };

      const handleClick = (evt) => {
          props.onClick(article)
      };



  }

let article = ["article", "article2"];





  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>

      <h3>Liste de courses</h3>

      <div className="card">
        <input type="text" value={article} onChange={handleChangeArticle}/>

        <button onClick={handleClick}>
          Ajouter
        </button>


      </div>


    </>
  )
}

export {Liste}
