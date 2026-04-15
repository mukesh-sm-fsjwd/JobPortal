import "./App.css";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Navbar from "./components/Navbar";
import AllPosts from "./components/AllPosts";
import Create from "./components/Create";
import Edit from "./components/Edit";

function App() {
  return (
    <BrowserRouter>
      <Navbar />
      <Routes>
        <Route path="/"       element={<AllPosts />} />
        <Route path="/create" element={<Create />} />
        <Route path="/edit"   element={<Edit />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
