import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './compteur.css'

function Compteur() {
  const [count, setCount] = useState(0)

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
      <h1>Compteur</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
        Incrémente:     {count}   
        </button>

        <button onClick={() => setCount((count) => 0)}>
        Effacer  
        </button>

      </div>

    </>
  )
}

export default Compteur
