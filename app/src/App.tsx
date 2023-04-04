import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { GlobalStore, Store} from './store/store';

import HomePage from './pages/Home'
import SearchPage from './pages/Search'
import SingleRestaurant from './pages/SingleRestaurant';
import RegisterForm from './pages/RegisterForm';

import './App.css';
import LoginForm from './pages/LoginForm';


const App = () => {

  return (
    <BrowserRouter>
      <GlobalStore.Provider value={Store}>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/search" element={<SearchPage />} />
          <Route path='/search/:id' element={<SingleRestaurant />}></Route>
          <Route path='/login' element={<LoginForm />}></Route>
          <Route path='/register' element={<RegisterForm />}></Route>
        </Routes>
      </GlobalStore.Provider>
    </BrowserRouter>
  );
}

export default App;
